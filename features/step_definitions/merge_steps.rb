Given /^the following articles exist$/ do |table|
  # table is a Cucumber::Ast::Table
  table.hashes.each do |article|
    Article.create article
  end
end

Given /^the following comments exist for the article "(.*?)"$/ do |title, table|
  article = Article.find_by_title(title)
  table.hashes.each do |comment|
    article.comments.create comment
  end
end



Then /^the article "(.*?)" should have body "(.*?)"$/ do |title, body|
  Article.find_by_title(title).body.should eq body
end

Then /^the article called "(.*?)" should have the id of "(\d+)"$/ do |title, id|
  Article.find_by_title(title).id should eq id
end

When /^(?:|I )fill in "([^"]*)" with the id for the article "([^"]*)"$/ do |field, title|
  value = Article.find_by_title(title).id
  fill_in(field, :with => value)
end

Then /^the author for "(.*?)" should be "(.*?)"$/ do |title, author|
  Article.find_by_title(title).author.should eq author
end

Then /^the article "(.*?)" should have "(\d+)" comments$/ do |title, count|
  Article.find_by_title(title).comments.length.should eq count.to_i
end