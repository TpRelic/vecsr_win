% Simple Tasks not in VH Database
get_relevant(grab_remote, [Remote]) :- type(Remote, remotecontrol).
complete_task(grab_remote, P) :- type(Remote, remotecontrol),
    transform([close([]), holds([Remote]), sat_on([]), on_top_of([]), inside([]), on([]), laid_on([]), used([]), eaten([])], P).

get_relevant(grab_remote_and_clothes, [Remote, Clothes]) :- type(Remote, remotecontrol), type(Clothes, clothesshirt).
complete_task(grab_remote_and_clothes, P) :- type(Remote, remotecontrol), type(Clothes, clothesshirt),
    transform([close([]), holds([Remote, Clothes]), sat_on([]), on_top_of([]), inside([]), on([]), laid_on([]), used([]), eaten([])], P).

get_relevant(use_phone_on_couch, [Cell, Sofa]) :- type(Cell, cellphone), type(Sofa, sofa).
complete_task(use_phone_on_couch, P) :- type(Cell, cellphone), type(Sofa, sofa),
    transform([close([]), holds([Cell]), sat_on([Sofa]), on_top_of([]), inside([]), on([]), laid_on([]), used([]), eaten([])], P).

get_relevant(set_remote_on_coffee_table, [Remote, Ct]) :- type(Remote, remotecontrol), type(Ct, coffeetable).
complete_task(set_remote_on_coffee_table, P) :- type(Remote, remotecontrol), type(Ct, coffeetable),
    transform([close([]), holds([]), sat_on([]), on_top_of([[Remote, Ct]]), inside([]), on([]), laid_on([]), used([]), eaten([])], P).

get_relevant(turn_on_tv, [Tv]) :- type(Tv, tv).
complete_task(turn_on_tv, P) :- type(Tv, tv),
    transform([close([]), holds([]), sat_on([]), on_top_of([]), inside([]), on([Tv]), laid_on([]), used([]), eaten([])], P).

% Original VECSR VirtualHome tasks
% Go To Sleep
get_relevant(go_to_sleep, [Bed]) :- type(Bed, bed).
complete_task(go_to_sleep, P) :- type(Bed, bed),
    transform([close([]), holds([]), sat_on([]), on_top_of([]), inside([]), on([]), laid_on([Bed]), used([]), eaten([])], P).

% Browse Internet
get_relevant(browse_internet, [Computer, Chair, Cpuscreen, Floor]) :-
    type(Computer, computer), type(Chair, chair), type(Cpuscreen, cpuscreen), inside_same_room(Computer, Chair),
    ontopof(Oto), ontopof_inherited(Floor, Cpuscreen, Oto), type(Floor, floor).
complete_task(browse_internet, P) :-
    type(Computer, computer), type(Chair, chair), type(Cpuscreen, cpuscreen), inside_same_room(Computer, Chair),
    transform([close([Cpuscreen]), holds([]), sat_on([Chair]), on_top_of([]), inside([]), on([Computer]), laid_on([]), used([]), eaten([])], P).

% Wash Teeth
get_relevant(wash_teeth, [Toothbrush, Toothpaste, Faucet]) :-
    type(Toothbrush, toothbrush), type(Toothpaste, toothpaste), type(Faucet, faucet).
complete_task(wash_teeth, P) :-
    type(Toothbrush, toothbrush), type(Toothpaste, toothpaste), type(Faucet, faucet),
    transform([close([Faucet]), holds([Toothbrush, Toothpaste]), sat_on([]), on_top_of([]), inside([]), on([Faucet]), laid_on([]), used([Toothpaste, Toothbrush]), eaten([])], P).

% Brush Teeth
get_relevant(brush_teeth, [Toothbrush, Toothpaste, Faucet]) :-
    type(Toothbrush, toothbrush), type(Toothpaste, toothpaste), type(Faucet, faucet).
complete_task(brush_teeth, P) :-
    type(Toothbrush, toothbrush), type(Toothpaste, toothpaste), type(Faucet, faucet),
    transform([close([Faucet]), holds([Toothbrush, Toothpaste]), sat_on([]), on_top_of([]), inside([]), on([Faucet]), laid_on([]), used([Toothpaste, Toothbrush]), eaten([])], P).

% Vacuum
get_relevant(vacuum, [Vacuum]) :-
    type(Vacuum, vacuum).
complete_task(vacuum, P) :-
    type(Vacuum, vacuum),
    transform([close([]), holds([Vacuum]), sat_on([]), on_top_of([]), inside([]), on([Vacuum]), laid_on([]), used([Vacuum]), eaten([])], P).

% Change Sheets and Pillow Cases
get_relevant(change_sheets_and_pillow_cases, [Bed, Pillow1, Pillow2, Pillowcase1, Pillowcase2, Sheets,
                                            ReplacementPillowcase1, ReplacementPillowcase2, ReplacementSheets, Clothespile]) :-
    type(Bed, bed), type(Pillow1, pillow), type(Pillow2, pillow), Pillow1 \= Pillow2, inside_same_room(Pillow1, Bed),
    inside_same_room(Pillow2, Bed), type(Pillowcase1, pillowcase), type(Pillowcase2, pillowcase), Pillowcase1 \= Pillowcase2,
    inside_same_room(Pillowcase1, Pillow1), inside_same_room(Pillowcase2, Pillow2), type(Sheets, sheets), inside_same_room(Sheets, Bed),
    type(ReplacementPillowcase1, pillowcase), type(ReplacementPillowcase2, pillowcase), type(ReplacementSheets, sheets),
    ReplacementPillowcase1 \= Pillowcase1, ReplacementPillowcase1 \= Pillowcase2, ReplacementPillowcase2 \= Pillowcase1,
    ReplacementPillowcase2 \= Pillowcase2, ReplacementSheets \= Sheets, type(Clothespile, clothespile).
complete_task(change_sheets_and_pillow_cases, P) :-
    type(Bed, bed), type(Pillow1, pillow), type(Pillow2, pillow), Pillow1 \= Pillow2, inside_same_room(Pillow1, Bed),
    inside_same_room(Pillow2, Bed), type(Pillowcase1, pillowcase), type(Pillowcase2, pillowcase), Pillowcase1 \= Pillowcase2,
    inside_same_room(Pillowcase1, Pillow1), inside_same_room(Pillowcase2, Pillow2), type(Sheets, sheets), inside_same_room(Sheets, Bed),
    type(ReplacementPillowcase1, pillowcase), type(ReplacementPillowcase2, pillowcase), type(ReplacementSheets, sheets),
    ReplacementPillowcase1 \= Pillowcase1, ReplacementPillowcase1 \= Pillowcase2, ReplacementPillowcase2 \= Pillowcase1,
    ReplacementPillowcase2 \= Pillowcase2, ReplacementSheets \= Sheets, type(Clothespile, clothespile),
    transform([close([]), holds([]), sat_on([]),
        on_top_of([[Pillowcase1, Clothespile], [Pillowcase2, Clothespile], [Sheets, Clothespile],
        [ReplacementPillowcase1, Pillow1], [ReplacementPillowcase2, Pillow2], [ReplacementSheets, Bed]]),
        inside([]), on([]), laid_on([]), used([]), eaten([])], P).
%    transform([close([]), holds([]), sat_on([]),
%        on_top_of([[pillowcase011, clothespile150], [pillowcase012, clothespile150], [sheets01, clothespile150],
%        [pillowcase021, pillow188], [pillowcase022, pillow189], [sheets02, bed111]]),
%        inside([]), on([]), laid_on([]), used([]), eaten([])], P).

% Wash Dirty Dishes
get_relevant(wash_dirty_dishes, List) :-
    type(Sink, sink), type(Kitchen, kitchen), inside(Inside), member([Sink, Kitchen], Inside),
    dirty_in_sink(Sink, Dishes), type(Faucet, faucet), member([Faucet, Kitchen], Inside), append([Sink, Faucet], Dishes, List).
complete_task(wash_dirty_dishes, P) :-
    type(Sink, sink), inside(Inside), member([Sink, Kitchen], Inside),
    dirty_in_sink(Sink, Dishes), type(Faucet, faucet), member([Faucet, Kitchen], Inside),
    transform([close([]), holds([]), sat_on([]), on_top_of(Dishes),
        inside([]), on([Faucet]), laid_on([]), used([Sink]), eaten([])], P).

% Feed Me
get_relevant(feed_me, [Food, Veggie, Pan, Stove]) :-
    needs_cooking(Food), vegetable(Veggie), type(Pan, fryingpan), type(Stove, stove).
complete_task(feed_me, P) :-
    needs_cooking(Food), vegetable(Veggie), type(Pan, fryingpan), type(Stove, stove),
    transform([close([]), holds([]), sat_on([]), on_top_of([[Food, Pan], [Veggie, Pan], [Pan, Stove]]),
        inside([]), on([Stove]), laid_on([]), used([]), eaten([Food])], P).
%    transform([close([]), holds([]), sat_on([]), on_top_of([[salmon328, fryingpan270], [bellpepper321, fryingpan270],
%    [fryingpan270, stove312]]), inside([]), on([stove312]), laid_on([]), used([]), eaten([salmon328])], P).

% Breakfast
get_relevant(breakfast, [Food, Heatsource]) :-
    breakfast(Food), easy_cooking(Heatsource, Food).
complete_task(breakfast, P) :-
    breakfast(Food), easy_cooking(Heatsource, Food),
    transform([close([]), holds([]), sat_on([]), on_top_of([[Food, Heatsource]]),
        inside([]), on([Heatsource]), laid_on([]), used([]), eaten([Food])], P).
%    transform([close([]), holds([]), sat_on([]), on_top_of([[breadslice310, toaster309]]),
%        inside([]), on([toaster309]), laid_on([]), used([]), eaten([breadslice310])], P).

% Read
get_relevant(read, [Reading, Comfy, Light]) :-
    readable(Reading), sittable(Comfy), type(Comfy, sofa), type(Light, lightswitch).
complete_task(read, P) :-
    readable(Reading), sittable(Comfy), type(Comfy, sofa), type(Light, lightswitch),
    transform([close([]), holds([Reading]), sat_on([Comfy]), on_top_of([]),
        inside([]), on([Light]), laid_on([]), used([Reading]), eaten([])], P).


% Unseen Data Batch A
% Watch TV
get_relevant(watch_tv, [Tv, Comfy]) :-
    sittable(Comfy), type(Comfy, sofa), type(Tv, tv).
complete_task(watch_tv, P) :-
    sittable(Comfy), type(Comfy, sofa), type(Tv, tv),
    transform([close([]), holds([]), sat_on([Comfy]), on_top_of([]),
        inside([]), on([Tv]), laid_on([]), used([]), eaten([])], P).
% Read Book
get_relevant(read_book, [Book, Comfy, Light]) :-
    type(Book, book), readable(Book), sittable(Comfy), type(Comfy, sofa), type(Light, lightswitch).
complete_task(read_book, P) :-
    type(Book, book), readable(Book), sittable(Comfy), type(Comfy, sofa), type(Light, lightswitch),
    transform([close([]), holds([Book]), sat_on([Comfy]), on_top_of([]),
        inside([]), on([Light]), laid_on([]), used([Book]), eaten([])], P).
% Relax on Sofa
get_relevant(relax_on_sofa, [Comfy]) :-
    type(Comfy, sofa).
complete_task(relax_on_sofa, P) :-
    type(Comfy, sofa),
    transform([close([]), holds([]), sat_on([Comfy]), on_top_of([]),
        inside([]), on([]), laid_on([]), used([]), eaten([])], P).
% Listen to Music
get_relevant(listen_to_music, [Radio]) :-
    type(Radio, radio).
complete_task(listen_to_music, P) :-
    type(Radio, radio),
    transform([close([]), holds([]), sat_on([]), on_top_of([]),
        inside([]), on([Radio]), laid_on([]), used([]), eaten([])], P).
% Tabletop Game
get_relevant(tabletop_game, [Table, Game]) :-
    type(Table, kitchentable), type(Game, tabletopgame).
complete_task(tabletop_game, P) :-
    type(Table, kitchentable), type(Game, tabletopgame),
    transform([close([]), holds([]), sat_on([]), on_top_of([[Game, Table]]),
        inside([]), on([]), laid_on([]), used([Game]), eaten([])], P).
% Pee
get_relevant(pee, [Toilet]) :-
    type(Toilet, toilet).
complete_task(pee, P) :-
    type(Toilet, toilet),
    transform([close([]), holds([]), sat_on([]), on_top_of([]),
        inside([]), on([]), laid_on([]), used([Toilet]), eaten([])], P).
% Go To Bathroom
get_relevant(go_to_bathroom, [Toilet]) :-
    type(Toilet, toilet).
complete_task(go_to_bathroom, P) :-
    type(Toilet, toilet),
    transform([close([]), holds([]), sat_on([Toilet]), on_top_of([]),
        inside([]), on([]), laid_on([]), used([Toilet]), eaten([])], P).
% Have snack
get_relevant(have_snack, [Change, Dresser]) :-
    type(Change, change), type(Dresser, dresser).
complete_task(have_snack, P) :-
    type(Change, change), type(Dresser, dresser),
    transform([close([]), holds([Change]), sat_on([]), on_top_of([]),
        inside([]), on([]), laid_on([]), used([]), eaten([])], P).
% Put shoes and coat FAILURE
get_relevant(put_shoes_and_coat, [Shoe1, Shoe2, Coat]) :-
    type(Shoe1, shoe), type(Shoe2, shoe), Shoe1 \= Shoe2, type(Coat, coat).
complete_task(put_shoes_and_coat, P) :-
    type(Shoe1, shoe), type(Shoe2, shoe), Shoe1 \= Shoe2, type(Coat, coat),
    transform([close([]), holds([]), sat_on([]), on_top_of([[Shoe1, character1], [Shoe2, character1], [Coat, character1]]),
        inside([]), on([]), laid_on([]), used([]), eaten([])], P).
% Hair
get_relevant(hair, [HairProduct, Comb]) :-
    type(HairProduct, hairproduct), type(Comb, comb).
complete_task(hair, P) :-
    type(HairProduct, hairproduct), type(Comb, comb),
    transform([close([]), holds([Comb, HairProduct]), sat_on([]), on_top_of([]),
        inside([]), on([]), laid_on([]), used([Comb, HairProduct]), eaten([])], P).
% Put out flowers
get_relevant(put_out_flowers, [Flowers, Vase, Table]) :-
    type(Flowers, flowers), type(Vase, vase), type(Table, kitchentable).
complete_task(put_out_flowers, P) :-
    type(Flowers, flowers), type(Vase, vase), type(Table, kitchentable),
    transform([close([]), holds([]), sat_on([]), on_top_of([[Vase, Table], [Flowers, Vase]]),
        inside([]), on([]), laid_on([]), used([]), eaten([])], P).
% Put down bags
get_relevant(put_down_bags, [Bag1, Bag2, Table]) :-
    type(Bag1, bag), type(Bag2, bag), Bag1 \= Bag2, type(Table, kitchentable).
complete_task(put_down_bags, P) :-
    type(Bag1, bag), type(Bag2, bag), Bag1 \= Bag2, type(Table, kitchentable),
    transform([close([]), holds([]), sat_on([]), on_top_of([[Bag1, Table], [Bag2, Table]]),
        inside([]), on([]), laid_on([]), used([]), eaten([])], P).
% Dry yourself off
get_relevant(dry_yourself_off, [Towel]) :-
    type(Towel, towel).
complete_task(dry_yourself_off, P) :-
    type(Towel, towel),
    transform([close([]), holds([Towel]), sat_on([]), on_top_of([]),
        inside([]), on([]), laid_on([]), used([Towel]), eaten([])], P).
% Curled hair
get_relevant(curled_hair, [HairProduct, CurlingIron]) :-
    type(HairProduct, hairproduct), type(CurlingIron, curlingiron).
complete_task(curled_hair, P) :-
    type(HairProduct, hairproduct), type(CurlingIron, curlingiron),
    transform([close([]), holds([CurlingIron, HairProduct]), sat_on([]), on_top_of([]),
        inside([]), on([CurlingIron]), laid_on([]), used([CurlingIron, HairProduct]), eaten([])], P).
% Place centerpiece
get_relevant(place_centerpiece, [Centerpiece, Table]) :-
    type(Centerpiece, centerpiece), type(Table, kitchentable).
complete_task(place_centerpiece, P) :-
    type(Centerpiece, centerpiece), type(Table, kitchentable),
    transform([close([]), holds([]), sat_on([]), on_top_of([[Centerpiece, Table]]),
        inside([]), on([]), laid_on([]), used([]), eaten([])], P).
% Facial
get_relevant(facial, [Facecream]) :-
    type(Facecream, facecream).
complete_task(facial, P) :-
    type(Facecream, facecream),
    transform([close([]), holds([Facecream]), sat_on([]), on_top_of([]),
        inside([]), on([]), laid_on([]), used([Facecream]), eaten([])], P).
% Practice Violin
get_relevant(practice_violin, [Violin]) :-
    type(Violin, violin).
complete_task(practice_violin, P) :-
    type(Violin, violin),
    transform([close([]), holds([Violin]), sat_on([]), on_top_of([]),
        inside([]), on([]), laid_on([]), used([Violin]), eaten([])], P).
% Wipe room with lysol
get_relevant(wipe_room_with_lysol, [Lysol, Towel, Counter]) :-
    type(Lysol, lysol), type(Towel, towel), type(Counter, bathroomcounter).
complete_task(wipe_room_with_lysol, P) :-
    type(Lysol, lysol), type(Towel, towel), type(Counter, bathroomcounter),
    transform([close([Counter]), holds([Lysol, Towel]), sat_on([]), on_top_of([]),
        inside([]), on([]), laid_on([]), used([Lysol, Towel]), eaten([])], P).
% Replace toothpaste
get_relevant(replace_toothpaste, [Oldtoothpaste, Newtoothpaste, Trash, Counter]) :-
    type(Oldtoothpaste, toothpaste), type(Newtoothpaste, toothpaste), new(Newtoothpaste), Oldtoothpaste \= Newtoothpaste,
    type(Trash, garbagecan), type(Counter, bathroomcounter).
complete_task(replace_toothpaste, P) :-
    type(Oldtoothpaste, toothpaste), type(Newtoothpaste, toothpaste), new(Newtoothpaste), Oldtoothpaste \= Newtoothpaste,
    type(Trash, garbagecan), type(Counter, bathroomcounter),
    transform([close([]), holds([]), sat_on([]), on_top_of([[Oldtoothpaste, Trash], [Newtoothpaste, Counter]]),
        inside([]), on([]), laid_on([]), used([]), eaten([])], P).
% Hang up jacket
get_relevant(hang_up_jacket, [Coat, Hanger]) :-
    type(Coat, coat), type(Hanger, hanger).
complete_task(hang_up_jacket, P) :-
    type(Coat, coat), type(Hanger, hanger),
    transform([close([]), holds([]), sat_on([]), on_top_of([[Coat, Hanger]]),
        inside([]), on([]), laid_on([]), used([]), eaten([])], P).
% Shampoo hair
get_relevant(shampoo_hair, [Shampoo, Tub]) :-
    type(Shampoo, shampoo), type(Tub, bathtub).
complete_task(shampoo_hair, P) :-
    type(Shampoo, shampoo), type(Tub, bathtub),
    transform([close([]), holds([Shampoo]), sat_on([Tub]), on_top_of([]),
        inside([]), on([]), laid_on([]), used([Shampoo]), eaten([])], P).
% Read them bedtime story
get_relevant(read_them_bedtime_story, [Book, Bed]) :-
    readable(Book), type(Bed, bed).
complete_task(read_them_bedtime_story, P) :-
    readable(Book), type(Bed, bed),
    transform([close([]), holds([Book]), sat_on([Bed]), on_top_of([]),
        inside([]), on([]), laid_on([]), used([Book]), eaten([])], P).
% Sit Quietly
get_relevant(sit_quietly, [Comfy]) :-
    type(Comfy, sofa).
complete_task(sit_quietly, P) :-
    type(Comfy, sofa),
    transform([close([]), holds([]), sat_on([Comfy]), on_top_of([]),
        inside([]), on([]), laid_on([]), used([]), eaten([])], P).
% Work
get_relevant(work, [Computer, Chair, Cpuscreen, Floor]) :-
    type(Computer, computer), type(Chair, chair), type(Cpuscreen, cpuscreen), inside_same_room(Computer, Chair),
    ontopof(Oto), ontopof_inherited(Floor, Cpuscreen, Oto), type(Floor, floor).
complete_task(work, P) :-
    type(Computer, computer), type(Chair, chair), type(Cpuscreen, cpuscreen), inside_same_room(Computer, Chair),
    transform([close([Cpuscreen]), holds([]), sat_on([Chair]), on_top_of([]), inside([]), on([Computer]), laid_on([]), used([]), eaten([])], P).
% Use laptop
get_relevant(use_laptop, [Computer, Chair, Cpuscreen, Floor]) :-
    type(Computer, computer), type(Chair, chair), type(Cpuscreen, cpuscreen), inside_same_room(Computer, Chair),
    ontopof(Oto), ontopof_inherited(Floor, Cpuscreen, Oto), type(Floor, floor).
complete_task(use_laptop, P) :-
    type(Computer, computer), type(Chair, chair), type(Cpuscreen, cpuscreen), inside_same_room(Computer, Chair),
    transform([close([Cpuscreen]), holds([]), sat_on([Chair]), on_top_of([]), inside([]), on([Computer]), laid_on([]), used([]), eaten([])], P).
% Check email
get_relevant(check_email, [Computer, Chair, Cpuscreen, Floor]) :-
    type(Computer, computer), type(Chair, chair), type(Cpuscreen, cpuscreen), inside_same_room(Computer, Chair),
    ontopof(Oto), ontopof_inherited(Floor, Cpuscreen, Oto), type(Floor, floor).
complete_task(check_email, P) :-
    type(Computer, computer), type(Chair, chair), type(Cpuscreen, cpuscreen), inside_same_room(Computer, Chair),
    transform([close([Cpuscreen]), holds([]), sat_on([Chair]), on_top_of([]), inside([]), on([Computer]), laid_on([]), used([]), eaten([])], P).
% Print Out Document
get_relevant(print_out_document, [Computer, Chair, Cpuscreen, Floor]) :-
    type(Computer, computer), type(Chair, chair), type(Cpuscreen, cpuscreen), inside_same_room(Computer, Chair),
    ontopof(Oto), ontopof_inherited(Floor, Cpuscreen, Oto), type(Floor, floor).
complete_task(print_out_document, P) :-
    type(Computer, computer), type(Chair, chair), type(Cpuscreen, cpuscreen), inside_same_room(Computer, Chair),
    transform([close([Cpuscreen]), holds([]), sat_on([Chair]), on_top_of([]), inside([]), on([Computer]), laid_on([]), used([]), eaten([])], P).
% Type Up Document
get_relevant(type_up_document, [Computer, Chair, Cpuscreen, Floor]) :-
    type(Computer, computer), type(Chair, chair), type(Cpuscreen, cpuscreen), inside_same_room(Computer, Chair),
    ontopof(Oto), ontopof_inherited(Floor, Cpuscreen, Oto), type(Floor, floor).
complete_task(type_up_document, P) :-
    type(Computer, computer), type(Chair, chair), type(Cpuscreen, cpuscreen), inside_same_room(Computer, Chair),
    transform([close([Cpuscreen]), holds([]), sat_on([Chair]), on_top_of([]), inside([]), on([Computer]), laid_on([]), used([]), eaten([])], P).
% Watch youtube
get_relevant(watch_youtube, [Computer, Chair, Cpuscreen, Floor]) :-
    type(Computer, computer), type(Chair, chair), type(Cpuscreen, cpuscreen), inside_same_room(Computer, Chair),
    ontopof(Oto), ontopof_inherited(Floor, Cpuscreen, Oto), type(Floor, floor).
complete_task(watch_youtube, P) :-
    type(Computer, computer), type(Chair, chair), type(Cpuscreen, cpuscreen), inside_same_room(Computer, Chair),
    transform([close([Cpuscreen]), holds([]), sat_on([Chair]), on_top_of([]), inside([]), on([Computer]), laid_on([]), used([]), eaten([])], P).
% Do Homework
get_relevant(do_homework, [Computer, Chair, Cpuscreen, Floor]) :-
    type(Computer, computer), type(Chair, chair), type(Cpuscreen, cpuscreen), inside_same_room(Computer, Chair),
    ontopof(Oto), ontopof_inherited(Floor, Cpuscreen, Oto), type(Floor, floor).
complete_task(do_homework, P) :-
    type(Computer, computer), type(Chair, chair), type(Cpuscreen, cpuscreen), inside_same_room(Computer, Chair),
    transform([close([Cpuscreen]), holds([]), sat_on([Chair]), on_top_of([]), inside([]), on([Computer]), laid_on([]), used([]), eaten([])], P).
% Shop
get_relevant(shop, [Computer, Chair, Cpuscreen, Floor]) :-
    type(Computer, computer), type(Chair, chair), type(Cpuscreen, cpuscreen), inside_same_room(Computer, Chair),
    ontopof(Oto), ontopof_inherited(Floor, Cpuscreen, Oto), type(Floor, floor).
complete_task(shop, P) :-
    type(Computer, computer), type(Chair, chair), type(Cpuscreen, cpuscreen), inside_same_room(Computer, Chair),
    transform([close([Cpuscreen]), holds([]), sat_on([Chair]), on_top_of([]), inside([]), on([Computer]), laid_on([]), used([]), eaten([])], P).
% Change Curtains
get_relevant(change_curtains, [OldCurtains, Window, NewCurtains, Closet]) :-
    type(OldCurtains, curtains), type(Window, window), extra_ontopof(Ontopof), member([OldCurtains, Window], Ontopof),
    type(NewCurtains, curtains), OldCurtains \= NewCurtains, type(Closet, closet).
complete_task(change_curtains, P) :-
    type(OldCurtains, curtains), type(Window, window), extra_ontopof(Ontopof), member([OldCurtains, Window], Ontopof),
    type(NewCurtains, curtains), OldCurtains \= NewCurtains, type(Closet, closet),
    transform([close([]), holds([]), sat_on([]),
        on_top_of([[OldCurtains, Closet], [NewCurtains, Window]]),
        inside([]), on([]), laid_on([]), used([]), eaten([])], P).
% Eat Family Meals
get_relevant(eat_family_meals, [Food, Veggie, Pan, Stove]) :-
    needs_cooking(Food), vegetable(Veggie), type(Pan, fryingpan), type(Stove, stove).
complete_task(eat_family_meals, P) :-
    needs_cooking(Food), vegetable(Veggie), type(Pan, fryingpan), type(Stove, stove),
    transform([close([]), holds([]), sat_on([]), on_top_of([[Food, Pan], [Veggie, Pan], [Pan, Stove]]),
        inside([]), on([Stove]), laid_on([]), used([]), eaten([Food])], P).
% Use Bathroom
get_relevant(use_bathroom, [Toilet]) :-
    type(Toilet, toilet).
complete_task(use_bathroom, P) :-
    type(Toilet, toilet),
    transform([close([]), holds([]), sat_on([Toilet]), on_top_of([]),
        inside([]), on([]), laid_on([]), used([Toilet]), eaten([])], P).
% Do Dishes
get_relevant(do_dishes, List) :-
    type(Sink, sink), type(Kitchen, kitchen), inside(Inside), member([Sink, Kitchen], Inside),
    dirty_in_sink(Sink, Dishes), type(Faucet, faucet), member([Faucet, Kitchen], Inside), append([Sink, Faucet], Dishes, List).
complete_task(do_dishes, P) :-
    type(Sink, sink), inside(Inside), member([Sink, Kitchen], Inside),
    dirty_in_sink(Sink, Dishes), type(Faucet, faucet), member([Faucet, Kitchen], Inside),
    transform([close([]), holds([]), sat_on([]), on_top_of(Dishes),
        inside([]), on([Faucet]), laid_on([]), used([Sink]), eaten([])], P).
% Eat Family Meals
get_relevant(eat_family_meals, [Food, Veggie, Pan, Stove]) :-
    needs_cooking(Food), vegetable(Veggie), type(Pan, fryingpan), type(Stove, stove).
complete_task(eat_family_meals, P) :-
    needs_cooking(Food), vegetable(Veggie), type(Pan, fryingpan), type(Stove, stove),
    transform([close([]), holds([]), sat_on([]), on_top_of([[Food, Pan], [Veggie, Pan], [Pan, Stove]]),
        inside([]), on([Stove]), laid_on([]), used([]), eaten([Food])], P).
% Change Bedding
get_relevant(change_bedding, [Bed, Pillow1, Pillow2, Pillowcase1, Pillowcase2, Sheets,
                                            ReplacementPillowcase1, ReplacementPillowcase2, ReplacementSheets, Clothespile]) :-
    type(Bed, bed), type(Pillow1, pillow), type(Pillow2, pillow), Pillow1 \= Pillow2, inside_same_room(Pillow1, Bed),
    inside_same_room(Pillow2, Bed), type(Pillowcase1, pillowcase), type(Pillowcase2, pillowcase), Pillowcase1 \= Pillowcase2,
    inside_same_room(Pillowcase1, Pillow1), inside_same_room(Pillowcase2, Pillow2), type(Sheets, sheets), inside_same_room(Sheets, Bed),
    type(ReplacementPillowcase1, pillowcase), type(ReplacementPillowcase2, pillowcase), type(ReplacementSheets, sheets),
    ReplacementPillowcase1 \= Pillowcase1, ReplacementPillowcase1 \= Pillowcase2, ReplacementPillowcase2 \= Pillowcase1,
    ReplacementPillowcase2 \= Pillowcase2, ReplacementSheets \= Sheets, type(Clothespile, clothespile).
complete_task(change_bedding, P) :-
    type(Bed, bed), type(Pillow1, pillow), type(Pillow2, pillow), Pillow1 \= Pillow2, inside_same_room(Pillow1, Bed),
    inside_same_room(Pillow2, Bed), type(Pillowcase1, pillowcase), type(Pillowcase2, pillowcase), Pillowcase1 \= Pillowcase2,
    inside_same_room(Pillowcase1, Pillow1), inside_same_room(Pillowcase2, Pillow2), type(Sheets, sheets), inside_same_room(Sheets, Bed),
    type(ReplacementPillowcase1, pillowcase), type(ReplacementPillowcase2, pillowcase), type(ReplacementSheets, sheets),
    ReplacementPillowcase1 \= Pillowcase1, ReplacementPillowcase1 \= Pillowcase2, ReplacementPillowcase2 \= Pillowcase1,
    ReplacementPillowcase2 \= Pillowcase2, ReplacementSheets \= Sheets, type(Clothespile, clothespile),
    transform([close([]), holds([]), sat_on([]),
        on_top_of([[Pillowcase1, Clothespile], [Pillowcase2, Clothespile], [Sheets, Clothespile],
        [ReplacementPillowcase1, Pillow1], [ReplacementPillowcase2, Pillow2], [ReplacementSheets, Bed]]),
        inside([]), on([]), laid_on([]), used([]), eaten([])], P).
% Toast Bread
get_relevant(toast_bread, [Food, Heatsource]) :-
    breakfast(Food), easy_cooking(Heatsource, Food).
complete_task(toast_bread, P) :-
    breakfast(Food), easy_cooking(Heatsource, Food),
    transform([close([]), holds([]), sat_on([]), on_top_of([[Food, Heatsource]]),
        inside([]), on([Heatsource]), laid_on([]), used([]), eaten([])], P).
% Drink Iced Coffee
get_relevant(drink_iced_coffee, [Mug, IcedCoffee]) :-
    type(Mug, mug), type(IcedCoffee, icedcoffee), extra_inside(Inside), member([IcedCoffee, Mug], Inside).
complete_task(drink_iced_coffee, P) :-
    type(Mug, mug), type(IcedCoffee, icedcoffee), extra_inside(Inside), member([IcedCoffee, Mug], Inside),
    transform([close([]), holds([]), sat_on([]), on_top_of([]),
        inside([]), on([]), laid_on([]), used([]), eaten([Mug])], P).
% Get in way of guests trying to leave
get_relevant(get_in_way_of_guests_trying_to_leave, [character2]).
complete_task(get_in_way_of_guests_trying_to_leave, P) :-
    transform([close([character2]), holds([]), sat_on([]), on_top_of([]),
        inside([]), on([]), laid_on([]), used([]), eaten([])], P).
% Prepare letter for mailing
get_relevant(prepare_letter_for_mailing, [Paper, Envelope, Mailbox]) :-
    type(Paper, paper), type(Envelope, envelope), type(Mailbox, mailbox).
complete_task(prepare_letter_for_mailing, P) :-
    type(Paper, paper), type(Envelope, envelope), type(Mailbox, mailbox),
    transform([close([]), holds([]), sat_on([]), on_top_of([[Paper, Envelope], [Envelope, Mailbox]]),
        inside([]), on([]), laid_on([]), used([]), eaten([])], P).