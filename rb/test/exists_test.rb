# ErrorHandling SDK exists test

require "minitest/autorun"
require_relative "../ErrorHandling_sdk"

class ExistsTest < Minitest::Test
  def test_create_test_sdk
    testsdk = ErrorHandlingSDK.test(nil, nil)
    assert !testsdk.nil?
  end
end
