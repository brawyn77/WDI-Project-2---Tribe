require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(first_name: "Peter", last_name: "Wynter", email: "peter@example.com", password_digest: "password")
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

end
