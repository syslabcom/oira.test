import unittest

import robotsuite
from plone.testing import layered, z2
from plone.app.testing import FunctionalTesting
from osha.oira.tests.base import OiRATestLayer

OIRA_ROBOT_TESTING = FunctionalTesting(
        bases=(OiRATestLayer(), z2.ZSERVER_FIXTURE),
        name="OiRATest:Robot")

def test_suite():
    suite = unittest.TestSuite()
    suite.addTests([
        layered(robotsuite.RobotTestSuite("acceptance/login.rst"),
                layer=OIRA_ROBOT_TESTING),
    ])
    suite.addTests([
        layered(robotsuite.RobotTestSuite("acceptance/user_actions.rst"),
                layer=OIRA_ROBOT_TESTING),
    ])
    return suite

