#!/bin/sh
# Sample Jenkins params override script to only run Raven notebooks
# with the proper --nbval-lax switch.

TEST_PAVICS_SDI_REPO="false"
TEST_FINCH_REPO="false"
TEST_PAVICS_LANDING_REPO="false"
TEST_LOCAL_NOTEBOOKS="false"
TEST_RAVEN_REPO="true"
TEST_RAVENPY_REPO="true"

PYTEST_EXTRA_OPTS="$PYTEST_EXTRA_OPTS --nbval-lax"

# Set different test branch if required.
#RAVEN_BRANCH=""
#RAVENPY_BRANCH=""
