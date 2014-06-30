Feature: Merge Articles
  As a blog administrator
  In order to organize articles and reduce duplication
  I want to be able to merge two blog posts together

  Background:
    Given the blog is set up
    And I am logged into the admin panel
    And the following articles exist
    |   id   | title                | body                            |  author      |
    |    2   | First Merge Article  | I am the first article.         |  L. Dogg     |
    |    3   | Second Merge Article | I am the second article.        |  L. Danger   |

  Scenario: Successfully merge articles
    Given I am on the edit article page for "First Merge Article"
    And I fill in "merge_with" with the id for the article "Second Merge Article"
    And I press "Merge"
    Then the article "First Merge Article" should have body "I am the first article. I am the second article."
    And the author for "First Merge Article" should be "L. Dogg"
    And I should see "Hooray! Articles merged successfully"

  Scenario: Try to merge the same article to itself
    Given I am on the edit article page for "First Merge Article"
    And I fill in "merge_with" with the id for the article "First Merge Article"
    And I press "Merge"
    Then I should see "Alas! You cannot merge an article with itself"
