@dogs
Feature: Dogs
  In order to have dogs on my website
  As an administrator
  I want to manage dogs

  Background:
    Given I am a logged in refinery user
    And I have no dogs

  @dogs-list @list
  Scenario: Dogs List
   Given I have dogs titled UniqueTitleOne, UniqueTitleTwo
   When I go to the list of dogs
   Then I should see "UniqueTitleOne"
   And I should see "UniqueTitleTwo"

  @dogs-valid @valid
  Scenario: Create Valid Dog
    When I go to the list of dogs
    And I follow "Add New Dog"
    And I fill in "Title" with "This is a test of the first string field"
    And I press "Save"
    Then I should see "'This is a test of the first string field' was successfully added."
    And I should have 1 dog

  @dogs-invalid @invalid
  Scenario: Create Invalid Dog (without title)
    When I go to the list of dogs
    And I follow "Add New Dog"
    And I press "Save"
    Then I should see "Title can't be blank"
    And I should have 0 dogs

  @dogs-edit @edit
  Scenario: Edit Existing Dog
    Given I have dogs titled "A title"
    When I go to the list of dogs
    And I follow "Edit this dog" within ".actions"
    Then I fill in "Title" with "A different title"
    And I press "Save"
    Then I should see "'A different title' was successfully updated."
    And I should be on the list of dogs
    And I should not see "A title"

  @dogs-duplicate @duplicate
  Scenario: Create Duplicate Dog
    Given I only have dogs titled UniqueTitleOne, UniqueTitleTwo
    When I go to the list of dogs
    And I follow "Add New Dog"
    And I fill in "Title" with "UniqueTitleTwo"
    And I press "Save"
    Then I should see "There were problems"
    And I should have 2 dogs

  @dogs-delete @delete
  Scenario: Delete Dog
    Given I only have dogs titled UniqueTitleOne
    When I go to the list of dogs
    And I follow "Remove this dog forever"
    Then I should see "'UniqueTitleOne' was successfully removed."
    And I should have 0 dogs
 