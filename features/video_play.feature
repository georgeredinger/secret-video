@javascript
Feature: Play Video

  Scenario: play baseline video 
    Given I go to a video page
    And I click play
    Then I should see the video play
    
