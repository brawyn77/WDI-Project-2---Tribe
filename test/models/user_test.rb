require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(first_name: "Peter", last_name: "Wynter", email: "peter@example.com", password: "password", password_confirmation: "password")
  end

  test "user should be valid" do
    assert @user.valid?
  end

  test "first_name should be present" do
    @user.first_name = ""
    assert_not @user.valid?
  end

  test "first name should be less than 50 characters" do
    @user.first_name = "a" * 51
    assert_not @user.valid?
  end

  test "last_name should be present" do
    @user.last_name = ""
    assert_not @user.valid?
  end

  test "last name should be less than 50 characters" do
    @user.last_name = "a" * 51
    assert_not @user.valid?
  end

test "email should be present" do
    @user.email = ""
    assert_not @user.valid?
  end

  test "email should be less than 50 characters" do
    @user.email = "a" * 51
    assert_not @user.valid?
  end

  test "password should be present" do
    @user.password = ""
    assert_not @user.valid?
  end

  test "password should be less than 50 characters" do
    @user.password = "a" * 51
    assert_not @user.valid?
  end

  test "password should be greater than 8 characters" do
    @user.password = "a" * 7
    assert_not @user.valid?
  end
  test "password_confirmation should be present" do
    @user.password_confirmation = ""
    assert_not @user.valid?
  end

  test "password_confirmation should be less than 50 characters" do
    @user.password_confirmation = "a" * 51
    assert_not @user.valid?
  end

  test "password_confirmation should be greater than 8 characters" do
    @user.password_confirmation = "a" * 7
    assert_not @user.valid?
  end

end
