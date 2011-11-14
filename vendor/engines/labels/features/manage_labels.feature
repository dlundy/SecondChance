@labels
Feature: Labels
  In order to have labels on my website
  As an administrator
  I want to manage labels

  Background:
    Given I am a logged in refinery user
    And I have no labels

  @labels-list @list
  Scenario: Labels List
   Given I have labels titled UniqueTitleOne, UniqueTitleTwo
   When I go to the list of labels
   Then I should see "UniqueTitleOne"
   And I should see "UniqueTitleTwo"

  @labels-valid @valid
  Scenario: Create Valid Label
    When I go to the list of labels
    And I follow "Add New Label"
    And I fill in "Name" with "This is a test of the first string field"
    And I press "Save"
    Then I should see "'This is a test of the first string field' was successfully added."
    And I should have 1 label

  @labels-invalid @invalid
  Scenario: Create Invalid Label (without name)
    When I go to the list of labels
    And I follow "Add New Label"
    And I press "Save"
    Then I should see "Name can't be blank"
    And I should have 0 labels

  @labels-edit @edit
  Scenario: Edit Existing Label
    Given I have labels titled "A name"
    When I go to the list of labels
    And I follow "Edit this label" within ".actions"
    Then I fill in "Name" with "A different name"
    And I press "Save"
    Then I should see "'A different name' was successfully updated."
    And I should be on the list of labels
    And I should not see "A name"

  @labels-duplicate @duplicate
  Scenario: Create Duplicate Label
    Given I only have labels titled UniqueTitleOne, UniqueTitleTwo
    When I go to the list of labels
    And I follow "Add New Label"
    And I fill in "Name" with "UniqueTitleTwo"
    And I press "Save"
    Then I should see "There were problems"
    And I should have 2 labels

  @labels-delete @delete
  Scenario: Delete Label
    Given I only have labels titled UniqueTitleOne
    When I go to the list of labels
    And I follow "Remove this label forever"
    Then I should see "'UniqueTitleOne' was successfully removed."
    And I should have 0 labels
 