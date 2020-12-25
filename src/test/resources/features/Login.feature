@login
Feature: As user I want to be able to login under different roles
  # this is a comment
  # background - test pre-condition, will be executed before every scenario
  # in the particular feature file

  Background: common steps
    Given user is on the login page

  Scenario: Login as a sales manager
    When user logs in
    Then user should see dashboard page

  @parametrized_test
  Scenario: Parametrized login
    When user logs in as a "store manager"
    Then user should see dashboard page
      #"driver" is a parameter. "" allows to do test parametrization which helps

  @parametrized_test
  Scenario: Parametrized login
    When user logs in as a "sales manager"
    Then user should see dashboard page

  @s_o
  Scenario Outline: Parametrized login as <role>
    When user logs in as a "<role>"
    Then user should see dashboard page

    Examples:
      | role          |
      | sales manager |
      | store manager |

  @s_o @with_two_columns
  Scenario Outline: Parametrized login as <role>
    When user logs in as a "<role>"
    Then user should see "<page_title>" page

    Examples:
      | role          | page_title      |
      | sales manager | Dashboard       |
      | store manager | Dashboard       |
      | driver        | Quick Launchpad |

  @negative_login
  Scenario: Invalid password
    When user logs in with "storemanager85" username and "wrong" password
    Then user verifies that "Invalid user name or password." message is displayed



