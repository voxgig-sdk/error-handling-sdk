-- ProjectName SDK exists test

local sdk = require("error-handling_sdk")

describe("ErrorHandlingSDK", function()
  it("should create test SDK", function()
    local testsdk = sdk.test(nil, nil)
    assert.is_not_nil(testsdk)
  end)
end)
