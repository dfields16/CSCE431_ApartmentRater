Feature: Add Tag Form
  As a Reviewer
  So that I can add another tag that I want to use with my review
  I want to add a from for adding a tag and add that tag to the database

Background:
  Given I am on the homepage
  And I click on Sign Up
  And I fill out the form and submit it
  And I am an admin
  When I access the admin portal and click on View Tags
  Then I am on the page to add the new tag

Scenario: Create a New Tag
  When I fill out the new tag form with a name
  And Submit the form
  Then I should see a success message for the tag
  Then I should see the new tag on the list of tags

Scenario: Fill out the new tag form with a blank name
  When I don't fill out the new tag form
  And Submit the form
  Then I should see a failure message for tags