require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "a user should enter a first name" do
  	user = User.new
  	assert !user.save
  	assert !user.errors[:first_name].empty?
  end

  test "a user should enter a last name" do
  	user = User.new
  	assert !user.save
  	assert !user.errors[:last_name].empty?
  end

   test "a user should enter a profile name" do
  	user = User.new
  	assert !user.save
  	assert !user.errors[:profile_name].empty?
  end

  test "a user must have a unique profile name" do
  	user = User.new
  	#user.profile_name = users(:konst).profile_name
  	user = users(:konst)
  	assert !user.save
  	puts user.errors.inspect
  	assert !user.errors[:profile_name].empty?
  end

    test "a user must have a unique profile name2" do
  	user = User.new
  	#user.profile_name = users(:konst).profile_name
  	user = users(:konst2)
  	assert !user.save
  	puts user.errors.inspect
  	assert !user.errors[:profile_name].empty?
  	assert user.errors[:profile_name].include?("has already been taken")
  end

  test "a user should have a profile name without spaces" do
  	user = User.new 	
  	#user.profile_name = users(:konst).profile_name
  	user = users(:konst)
  	user.profile_name = "konst konst"
  	assert !user.save  
  	puts user.errors.inspect + "profile validation"
  	assert !user.errors[:profile_name].empty?
  	assert user.errors[:profile_name].include?("Must be formatted correctly")
  end
end
