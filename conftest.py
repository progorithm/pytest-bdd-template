import pytest
from pytest_bdd import scenarios, given, when, then, parsers


@given(parsers.parse('the dummy project is started'))
def given_project():
    pass

@then(parsers.parse('the dummy project works'))
def then_works():
    assert True == True