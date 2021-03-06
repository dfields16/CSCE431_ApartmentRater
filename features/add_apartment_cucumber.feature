Feature: Add Apartment Form
  As a Reviewer
  So that I can add an apartment I want to review if it doesn't exist
  I want to create a new form for the user to create an apartment

Background:
  Given I am on the homepage
  And I click on Sign Up
  And I fill out the form and submit it
  And I am an admin
  When I access the admin portal and click on View Apartments
  Then I am on the page to add a new apartment

Scenario: Create a new apartment
  When I fill out the new apartment form with a name
  And Submit the form
  Then I should see a success message
  And Be on the individual apartment page
  Then I should see the new apartment listed there

Scenario: Fill out the new apartment form with a blank name
  When I don't fill out the new apartment form
  And Submit the form
  Then I should see a failure message for apartments
