Feature: The pet store service back-end
    As a Pet Store Owner
    I need a RESTful catalog service
    So that I can keep track of all my pets

Background:
    Given the following pets
        | id | name       | category | available |
        |  1 | fido       | dog      | True      |
        |  2 | kitty      | cat      | True      |
        |  3 | leo        | lion     | True      |

Scenario: The server is running
    When I visit the "Home Page"
    Then I should see "Pet Demo RESTful Service" in the title
    And I should not see "404 Not Found"

Scenario: Create a Pet
    When I visit the "Home Page"
    And I set the "Name" to "Happy"
    And I set the "Category" to "Hippo"
    And I press the "Create" button
    Then I should see the message "Success"

Scenario: List all pets
    When I visit the "Home Page"
    And I press the "Search" button
    Then I should see "fido" in the results
    And I should see "kitty" in the results
    And I should see "leo" in the results

Scenario: List all dogs
    When I visit the "Home Page"
    And I set the "Category" to "dog"
    And I press the "Search" button
    Then I should see "fido" in the results
    And I should not see "kitty" in the results
    And I should not see "leo" in the results

Scenario: Update a Pet
    When I visit the "Home Page"
    And I set the "Id" to "1"
    And I press the "Retrieve" button
    Then I should see "fido" in the "Name" field
    When I change "Name" to "Boxer"
    And I press the "Update" button
    Then I should see the message "Success"
    When I set the "Id" to "1"
    And I press the "Retrieve" button
    Then I should see "Boxer" in the "Name" field
    When I press the "Clear" button
    And I press the "Search" button
    Then I should see "Boxer" in the results
    Then I should not see "fido" in the results
