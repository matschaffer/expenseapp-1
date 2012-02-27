class User < ActiveRecord::Base
  validates :name, presence: true
  validates :email,
    presence: true,
    format: {
      with: /[\w]+@[\w]+\.[\w]+/,
      message: "%{value} is not a valid email address"
    }
  validates :username,
    presence: true,
    uniqueness: true
  validates :password,
    confirmation: true, 
    length: {
      minimum: 6,
      maximum: 12,
      too_short: "must have at least %{count} characters",
      too_long: "must have at most %{count} characters"
    }
  validates :password_confirmation, presence: true
end
