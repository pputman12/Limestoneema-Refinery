@hazards
Feature: Hazards
  In order to have hazards on my website
  As an administrator
  I want to manage hazards

  Background:
    Given I am a logged in refinery user
    And I have no hazards

  @hazards-list @list
  Scenario: Hazards List
   Given I have hazards titled UniqueTitleOne, UniqueTitleTwo
   When I go to the list of hazards
   Then I should see "UniqueTitleOne"
   And I should see "UniqueTitleTwo"

  @hazards-valid @valid
  Scenario: Create Valid Hazard
    When I go to the list of hazards
    And I follow "Add New Hazard"
    And I fill in "Title" with "This is a test of the first string field"
    And I press "Save"
    Then I should see "'This is a test of the first string field' was successfully added."
    And I should have 1 hazard

  @hazards-invalid @invalid
  Scenario: Create Invalid Hazard (without title)
    When I go to the list of hazards
    And I follow "Add New Hazard"
    And I press "Save"
    Then I should see "Title can't be blank"
    And I should have 0 hazards

  @hazards-edit @edit
  Scenario: Edit Existing Hazard
    Given I have hazards titled "A title"
    When I go to the list of hazards
    And I follow "Edit this hazard" within ".actions"
    Then I fill in "Title" with "A different title"
    And I press "Save"
    Then I should see "'A different title' was successfully updated."
    And I should be on the list of hazards
    And I should not see "A title"

  @hazards-duplicate @duplicate
  Scenario: Create Duplicate Hazard
    Given I only have hazards titled UniqueTitleOne, UniqueTitleTwo
    When I go to the list of hazards
    And I follow "Add New Hazard"
    And I fill in "Title" with "UniqueTitleTwo"
    And I press "Save"
    Then I should see "There were problems"
    And I should have 2 hazards

  @hazards-delete @delete
  Scenario: Delete Hazard
    Given I only have hazards titled UniqueTitleOne
    When I go to the list of hazards
    And I follow "Remove this hazard forever"
    Then I should see "'UniqueTitleOne' was successfully removed."
    And I should have 0 hazards
 