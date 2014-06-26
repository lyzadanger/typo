Feature: Create Categories
  As a blog administrator
  In order to organize my thoughts about the world
  I want to be able to add new blog post categories

  Background:
    Given the blog is set up
    And I am logged into the admin panel

  Scenario: Successfully access the categories admin page
    Given I am on the admin dashboard page
    When I follow "Categories"
    Then I should be on the new category page

  Scenario: Successfully add a new category
    Given I am on the new category page
    When I fill in "category_name" with "My Category"
    And I fill in "category_keywords" with "foo bar baz"
    And I fill in "category_description" with "Lorem Ipsum Dolor"
    And I press "Save"
    Then I should be on the new category page
    And I should see "My Category"
