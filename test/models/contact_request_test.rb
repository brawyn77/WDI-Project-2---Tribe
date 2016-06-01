require 'test_helper'

class ContactRequestTest < ActiveSupport::TestCase
  def setup
    @contact_request = ContactRequest.new(from: "dawyn", to: "brawyn", request: "connect", permission: true)
  end

  test "from should be present" do
    @contact_request.from = ""
    assert_not @contact_request.valid?
  end

  test "from should be less than 50 characters" do
    @contact_request.from = "a" * 51
    assert_not @contact_request.valid?
  end

  test "to should be present" do
    @contact_request.to = ""
    assert_not @contact_request.valid?
  end

  test "to should be less than 50 characters" do
    @contact_request.to = "a" * 51
    assert_not @contact_request.valid?
  end

  test "request should be present" do
    @contact_request.request = ""
    assert_not @contact_request.valid?
  end

  test "message should be less than 100 characters" do
    @contact_request.request = "a" * 101
    assert_not @contact_request.valid?
  end

  test "permission should be present" do
    @contact_request.permission = ""
    assert_not @contact_request.valid?
  end

  test "permission should be less than 100 characters" do
    @contact_request.permission = "a" * 101
    assert_not @contact_request.valid?
  end
end
