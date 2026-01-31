import pytest

from src.scasp_functions import scaspharness
from src.simulators.simulator import MockSimulator

if __name__ == '__main__':
    sim = MockSimulator()
    scasp = scaspharness.ScaspHarness(sim, multiple_worlds=True)
    output, o = scasp.run_generated_scasp()
    print(output)