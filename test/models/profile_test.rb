require 'test_helper'

class ProfileTest < ActiveSupport::TestCase
  def setup
    @profile = Profile.new(username: "pwyn", address: "10 chetwynd st", suburb: "North Melbourne", postcode: "3051", search_radius: "2", age: 25, sex: "M", interests: " Kayaking, Swimming")
  end

  # test "profile should be valid" do
  #   assert @profile.valid?
  # end

  test "username should be present" do
    @profile.username = ""
    assert_not @profile.valid?
  end

  test "username should be less than 50 characters" do
    @profile.username = "a" * 51
    assert_not @profile.valid?
  end

  test "address should be present" do
    @profile.address = ""
    assert_not @profile.valid?
  end

  test "address should be less than 50 characters" do
    @profile.address = "a" * 51
    assert_not @profile.valid?
  end

  test "suburb should be present" do
    @profile.suburb = ""
    assert_not @profile.valid?
  end

  test "suburb should be less than 30 characters" do
    @profile.suburb = "a" * 31
    assert_not @profile.valid?
  end

  test "postcode should be present" do
    @profile.postcode = ""
    assert_not @profile.valid?
  end

  test "postcode should be less than 5 characters" do
    @profile.postcode = "a" * 5
    assert_not @profile.valid?
  end

  test "search_radius should be present" do
    @profile.search_radius = ""
    assert_not @profile.valid?
  end

  test "search_radius should be less than 2000" do
    @profile.search_radius = "a" * 5
    assert_not @profile.valid?
  end

  test "age should be present" do
    @profile.age = ""
    assert_not @profile.valid?
  end

  test "age should be less than 130" do
    @profile.age = "a" * 4
    assert_not @profile.valid?
  end

  test "sex should be present" do
    @profile.sex = ""
    assert_not @profile.valid?
  end

  test "sex should be less than 5 characters" do
    @profile.sex = "a" * 5
    assert_not @profile.valid?
  end

  test "interests should be present" do
    @profile.interests = ""
    assert_not @profile.valid?
  end

  test "interests should be less than 100 characters" do
    @profile.interests = "a" * 101
    assert_not @profile.valid?
  end
end
