require 'test_helper'

class RestaurantCreationTest < ActionDispatch::IntegrationTest
  test "checking adding a restaurant" do
    visit restaurants_path
    click_link "New Restaurant"
    
    click_button "Create Restaurant"
    error_message = "Name can't be blank"
    assert page.has_content?(error_message)
    fill_in "Name", with: "TestName"
    click_button "Create Restaurant"
    assert !page.has_content?(error_message)
    
    click_button "Create Restaurant"
    error_message = "Location can't be blank"
    assert page.has_content?(error_message)
    fill_in "Location", with: "Philadelphia"
    click_button "Create Restaurant"
    assert !page.has_content?(error_message)
   end
 end