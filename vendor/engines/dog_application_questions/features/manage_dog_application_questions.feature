@dog_application_questions
Feature: Dog Application Questions
  In order to have dog_application_questions on my website
  As an administrator
  I want to manage dog_application_questions

  Background:
    Given I am a logged in refinery user
    And I have no dog_application_questions

  @dog_application_questions-list @list
  Scenario: Dog Application Questions List
   Given I have dog_application_questions titled UniqueTitleOne, UniqueTitleTwo
   When I go to the list of dog_application_questions
   Then I should see "UniqueTitleOne"
   And I should see "UniqueTitleTwo"

  @dog_application_questions-valid @valid
  Scenario: Create Valid Dog Application Question
    When I go to the list of dog_application_questions
    And I follow "Add New Dog Application Question"
    And I fill in "Question Text" with "This is a test of the first string field"
    And I press "Save"
    Then I should see "'This is a test of the first string field' was successfully added."
    And I should have 1 dog_application_question

  @dog_application_questions-invalid @invalid
  Scenario: Create Invalid Dog Application Question (without question_text)
    When I go to the list of dog_application_questions
    And I follow "Add New Dog Application Question"
    And I press "Save"
    Then I should see "Question Text can't be blank"
    And I should have 0 dog_application_questions

  @dog_application_questions-edit @edit
  Scenario: Edit Existing Dog Application Question
    Given I have dog_application_questions titled "A question_text"
    When I go to the list of dog_application_questions
    And I follow "Edit this dog_application_question" within ".actions"
    Then I fill in "Question Text" with "A different question_text"
    And I press "Save"
    Then I should see "'A different question_text' was successfully updated."
    And I should be on the list of dog_application_questions
    And I should not see "A question_text"

  @dog_application_questions-duplicate @duplicate
  Scenario: Create Duplicate Dog Application Question
    Given I only have dog_application_questions titled UniqueTitleOne, UniqueTitleTwo
    When I go to the list of dog_application_questions
    And I follow "Add New Dog Application Question"
    And I fill in "Question Text" with "UniqueTitleTwo"
    And I press "Save"
    Then I should see "There were problems"
    And I should have 2 dog_application_questions

  @dog_application_questions-delete @delete
  Scenario: Delete Dog Application Question
    Given I only have dog_application_questions titled UniqueTitleOne
    When I go to the list of dog_application_questions
    And I follow "Remove this dog application question forever"
    Then I should see "'UniqueTitleOne' was successfully removed."
    And I should have 0 dog_application_questions
 