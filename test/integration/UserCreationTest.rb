require 'test_helper'

class UserCreationTest < ActionDispatch::IntegrationTest
	test "checking create user" do
		visit users_path
		click_link "New User"
		
		click_button "Create User"
		error_message = "Name can't be blank"
		assert page.has_content?(error_message)
		fill_in "Name", with: "TestName"
		click_button "Create User"
		assert !page.has_content?(error_message)
		
		click_button "Create User"
		error_message = "Email can't be blank"
		assert page.has_content?(error_message)
		fill_in "Email", with: "test"
		click_button "Create User"
		assert !page.has_content?(error_message)
		error_message = "Email test is not a valid email address"
		assert page.has_content?(error_message)
		fill_in "Email", with: "test@test.com"
		click_button "Create User"
		assert !page.has_content?(error_message)
		
		click_button "Create User"
		error_message = "Username can't be blank"
		assert page.has_content?(error_message)
		fill_in "Username", with: "User1"
		click_button "Create User"
		assert !page.has_content?(error_message)
		error_message = "Username has already been taken"
		assert page.has_content?(error_message)
		fill_in "Username", with: "TestUserName"
		click_button "Create User"
		assert !page.has_content?(error_message)
		
		click_button "Create User"
		error_message = "Password must have at least 6 characters"
		assert page.has_content?(error_message)
		fill_in "Password", with: "extremelylongpassword"
		click_button "Create User"
		assert !page.has_content?(error_message)
		error_message = "Password must have at most 12 characters"
		assert page.has_content?(error_message)
		fill_in "Password", with: "password"
		click_button "Create User"
		assert !page.has_content?(error_message)
		error_message = "Password doesn't match confirmation"
		assert page.has_content?(error_message)
		fill_in "Password confirmation", with: "password"
		click_button "Create User"
		assert !page.has_content?(error_message)
	end
end