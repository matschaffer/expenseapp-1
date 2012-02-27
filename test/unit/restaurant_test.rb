require 'test_helper'

class RestaurantTest < ActiveSupport::TestCase
  test "ensures we have a name" do
    attrs = {name: nil, location: "Philadelphia", date: 2012-02-11, rating: 1, review: "some review" }
    r = Restaurant.new(attrs)
    assert !r.valid?
  end
  
  test "ensures we have a location" do
    attrs = {name: "test", location: nil, date: 2012-02-11, rating: 1, review: "some review" }
    r = Restaurant.new(attrs)
    assert !r.valid?
  end
end
