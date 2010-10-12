Feature: List Videos
  In order to see a list of videos
  As a user
  I want to see a list of video links

  Scenario: baseline video delivery
    Given I have a video
    And the video is baseline delivery
    When I show 
    Then I should see "baseline"
    And I should see "play"

