import pytest

from src.scasp_functions import scaspharness
from src.simulators.simulator import MockSimulator

# Hi there! This whole page is a stub currently, it only "tests" some very specific
# use cases.
@pytest
def test_run_generated_scasp():
    sim = MockSimulator()
    scasp = scaspharness.ScaspHarness(sim)
    output, o = scasp.run_generated_scasp()
    print(output)
