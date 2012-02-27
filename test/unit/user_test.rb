require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "ensures we have a name" do
    attrs = {name: nil, email: "email@email.com", username: "some_username", password: "some_password", password_confirmation: "some_password"}
    u = User.new(attrs)
    assert !u.valid?
  end

  test "ensures we have an email" do
    attrs = {name: "some_name", email: nil, username: "some_username", password: "some_password", password_confirmation: "some_password"}
    u = User.new(attrs)
    assert !u.valid?
  end
  
  test "ensures email is in proper format" do
    attrsInvalid = {name: "some_name", email: "invalid_email", username: "some_username", password: "some_password", password_confirmation: "some_password"}
    invalidUser = User.new(attrsInvalid)
    assert !invalidUser.valid?
  end
  
  test "ensures we have a username" do
    attrs = {name: "some_name", email: "email@email.com", username: nil, password: "some_password", password_confirmation: "some_password"}
    u = User.new(attrs)
    assert !u.valid?
  end
  
  test "ensures username is unique" do
    attrs = {name: "some_name", email: "email@email.com", username: "User1", password: "some_password", password_confirmation: "some_password"}
    u1 = User.new(attrs)
    assert !u1.valid?
  end
  
  test "ensures password is correct length" do
    attrs1 = {name: "some_name", email: "email@email.com", username: "some_username", password: "short", password_confirmation: "short"}
    attrs2 = {name: "some_name", email: "email@email.com", username: "some_username", password: "extra_long_password", password_confirmation: "extra_long_password"}
    u1 = User.new(attrs1)
    u2 = User.new(attrs2)
    assert !u1.valid?
    assert !u2.valid?
  end
  
  test "ensures passwords match" do
    attrs = {name: "some_name", email: "email@email.com", username: "some_username", password: "password", password_confirmation: "not_password"}
    u = User.new(attrs)
    assert !u.valid?
  end

end
