import logging
import time
import datetime

from src.scasp_functions import scaspharness
from src.simulators import simulator_virtualhome
from src.main_helpers import run, check_results, task_helper
from src.counterfactual_analysis import counterfactual_checker

def state_subset(final_state, curr_state):
    """
    Checks if the task is accomplished or not
    [close(Close), holds(Holds), sat_on(Sat), on_top_of(Oto), inside(Inside), on(On), laid_on(Laid), used(Used), eaten(Eaten)]
    :param final_state: desired final state, already in a list
    :param curr_state: current state as a string
    :return: boolean representing success
    """
    def make_list_regular(string_state):
        new_list = string_state.replace("(", "").replace("[", "").replace(")", "").replace("]", "").split(",")
        new_list = [x for x in new_list if x]
        return new_list
    def make_list_doubles(string_state):
        new_list =  string_state.split("]")
        new_list = [x[1:] + "]" for x in new_list]
        new_list.pop()
        new_list.pop()
        if new_list:
            new_list[0] = new_list[0][1:]
        return new_list

    def machine_state(string_state):
        close_state = make_list_regular(string_state.split("close")[1].split("holds")[0])
        holds_state = make_list_regular(string_state.split("holds")[1].split("sat_on")[0])
        sat_on_state = make_list_regular(string_state.split("sat_on")[1].split("on_top_of")[0])
        on_top_of_state = make_list_doubles(string_state.split("on_top_of")[1].split("inside")[0])
        inside_state = make_list_doubles(string_state.split("inside")[1].split(",on(")[0])
        on_state = make_list_regular(string_state.split(",on(")[1].split("laid_on")[0])
        laid_on_state = make_list_regular(string_state.split("laid_on")[1].split("used")[0])
        used_state = make_list_regular(string_state.split("used")[1].split("eaten")[0])
        eaten_state = make_list_regular(string_state.split("eaten")[1])
        return [close_state, holds_state, sat_on_state, on_top_of_state, inside_state, on_state, laid_on_state, used_state, eaten_state]

    final = machine_state("".join(final_state.split()))
    curr = machine_state("".join(curr_state.split()))

    if not set(final[0]) <= set(curr[0]):
        return False
    if not set(final[1]) <= set(curr[1]):
        return False
    if not set(final[2]) <= set(curr[2]):
        return False
    if not set(final[3]) <= set(curr[3]):
        return False
    if not set(final[4]) <= set(curr[4]):
        return False
    if not set(final[5]) <= set(curr[5]):
        return False
    if not set(final[6]) <= set(curr[6]):
        return False
    if not set(final[7]) <= set(curr[7]):
        return False
    if not set(final[8]) <= set(curr[8]):
        return False
    return True

def get_relevant(task):
    relevant_items = check_results(program.run_query([("get_relevant", task, "P")]))['P']
    listified_items = relevant_items.replace("[","").replace("]","").split(",")
    listified_items.append("character1")
    logging.info(listified_items)
    return listified_items

def run_step_by_step(task, final_state, program, state_subset):
    start_time = time.time()
    logging.info("Step-By-Step Task: " + task)
    logging.info("Task received: %s seconds" % start_time)
    curr_state = check_results(program.run_query([("initial_state", "P")]))['P']
    plan = []
    success_check = state_subset(final_state, curr_state)
    # Get plans
    while not success_check:
        next_action = check_results(program.run_query([("choose_action", "X", curr_state, final_state)]))['X']
        logging.info("Choose action: %s seconds" % (time.time() - start_time))
        logging.info("Action chosen: " + next_action)
        curr_state = check_results(program.run_query([("update", next_action, curr_state, "S")]))['S']
        logging.info("Update: %s seconds" % (time.time() - start_time))
        plan.append(next_action)
        success_check = state_subset(final_state, curr_state)
    logging.info("Plan found!")
    logging.info(plan)
    for action in plan:
        a = action.replace("(", " ").replace(",", " ").split()
        if a:
            program.take_action(tuple(a))
    logging.info("Actions taken in simulation: %s seconds" % (time.time() - start_time))
    logging.info("Task End Time: %s", datetime.datetime.now())

def run_cfa(actions, relevant, simulator):
    objects, actions = counterfactual_checker.format_objects_and_actions(actions, relevant, simulator)
    counterfactual_checker.counterfactual_checker(objects, actions)

if __name__ == '__main__':
    logging.basicConfig(format='%(levelname)s:%(message)s', level=logging.INFO)
    initial_rules_file = "scasp_knowledge_base/knowledge_base_virtualhome_v2.pl"
    values = [True,     # 0 Real simulator or not?
              False,    # 1 Optimize or not?
              False,    # 2 Remove unnecessary items or not?
              False,    # 3 Run dynamically or not?
              False,    # 4 Use an answer key or not?
              False,    # 5 Get plans step by step or not?
              False,    # 6 Only use relevant rooms or not?
              False  # 7 Counterfactual analysis?
              ]
    best = False
    best_norelitems = False
    best_noopt = False
    best_norelrooms = False
    only_relitems = False
    only_opt = False
    only_relrooms = False
    nothing = True
    if best:
        values[1] = True
        values[2] = True
        values[6] = True
    if best_norelitems:
        values[1] = True
        values[2] = False
        values[6] = True
    if best_noopt:
        values[1] = False
        values[2] = True
        values[6] = True
    if best_norelrooms:
        values[1] = True
        values[2] = True
        values[6] = False
    if only_relitems:
        values[1] = False
        values[2] = True
        values[6] = False
    if only_opt:
        values[1] = True
        values[2] = False
        values[6] = False
    if only_relrooms:
        values[1] = False
        values[2] = False
        values[6] = True
    if nothing:
        values[1] = False
        values[2] = False
        values[6] = False
    real_simulator = values[0]
    optimize_rules = values[1]
    reduce_items = values[2] # Remove all facts about non-relevant objects
    dynamic = values[3]
    use_answer_key = values[4]
    step_by_step = values[5]
    few_rooms = values[6]
    cfa = values[7]
    task_selection = 15
    task = "read"
    [final_state, answer_key, rooms] = task_helper(task)
    if not few_rooms:
        rooms = None
    start_time = time.time()
    logging.info("Start Time: %s", datetime.datetime.now())
    # Create simulator
    if real_simulator:
        simulat = simulator_virtualhome.VirtualHomeSimulator(environment=0) # VirtualHome Simulator
    else:
        simulat = simulator_virtualhome.MockVirtualHomeSimulator() # Mock VirtualHome Simulator
    # Create Harness
    program = scaspharness.ScaspHarness(simulat, initial_rules=initial_rules_file, optimize_rules=optimize_rules, rooms=rooms)
    if cfa:
        program.initial_rules = program.initial_rules.replace("%dangerx", "")
    logging.info("Program Initialized Time: %s seconds" % (time.time() - start_time))
    start_time = time.time()
    if reduce_items or cfa:
        relevant = get_relevant(task)
        if reduce_items:
            program.relevant_items = relevant
    # Full loop
    if step_by_step:
        run_step_by_step(task, final_state, program, state_subset)
    elif not dynamic or cfa:
        if use_answer_key:
            actions = run(task, program, answer_key, take_actions=not cfa)
        else:
            actions = run(task, program, take_actions=not cfa)
        if cfa:
            run_cfa(actions, relevant, simulat)
    else:
        while True:
            task = input("Input task:")
            run(task, program)
