require 'test_helper'

class PostTest < ActiveSupport::TestCase
  def setup
    @post = Post.new(user_from: "dawyn", user_to: "brawyn", message: "Hi dude")
  end

  test "user_from should be present" do
    @post.user_from = ""
    assert_not @post.valid?
  end

  test "user_from should be less than 50 characters" do
    @post.user_from = "a" * 51
    assert_not @post.valid?
  end

  test "user_to should be present" do
    @post.user_to = ""
    assert_not @post.valid?
  end

  test "user_to should be less than 50 characters" do
    @post.user_to = "a" * 51
    assert_not @post.valid?
  end

  test "message should be present" do
    @post.message = ""
    assert_not @post.valid?
  end

  test "message should be less than 1000 characters" do
    @post.message = "a" * 1001
    assert_not @post.valid?
  end
end
