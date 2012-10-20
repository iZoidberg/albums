Given /^the following user records$/ do |table|
  table.hashes.each do |hash|
    FactoryGirl.create(:user, hash)
  end
end

When /^I visit the login site$/ do
  visit new_user_session_path
end

When /^I fill in the login form with "(.*?)" and "(.*?)"$/ do |arg1, arg2|
  fill_in "user_email", :with => arg1
  fill_in "user_password", :with=> arg2
  click_button "Sign in"
end

Then /^I should see "(.*?)"$/ do |arg1|
  page.should have_content(arg1)
end

When /^I visit the create a new album site$/ do
  visit new_album_path
end

When /^I fill in the new album form with "(.*?)" and "(.*?)"$/ do |arg1, arg2|
  fill_in "album_title", :with => arg1
  fill_in "album_artist", :with=> arg2
  click_button "Create Album"
end

Then /^I should have the album "(.*?)" in the database$/ do |arg1|
  album = Album.where("artist = ?", arg1).all
  album.count.should == 1
end