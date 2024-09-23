Feature: Scroll to element and delete a user
  As a user
  I want to scroll to the element with first name "Alen"
  So that I can click the delete button

  Scenario Outline: Scroll to the element and delete a user
    Given I am on the Example page
    When I scroll to the user with first name "<first_name>"
    Then I click the delete button for the user "<first_name>"

    Examples:
      | first_name  |
      | Alden       |
      | Kierra      |

  Scenario Outline: Scroll to the element and delete a user
    Given I am on the Example page
    When I scroll to the user with first name "<first_name>"
    Then I click the delete button for the user "<first_name>"

    Examples:
      | first_name  |
      | Alden       |
      | Lalit       |


