-- ErrorHandling SDK error

local ErrorHandlingError = {}
ErrorHandlingError.__index = ErrorHandlingError


function ErrorHandlingError.new(code, msg, ctx)
  local self = setmetatable({}, ErrorHandlingError)
  self.is_sdk_error = true
  self.sdk = "ErrorHandling"
  self.code = code or ""
  self.msg = msg or ""
  self.ctx = ctx
  self.result = nil
  self.spec = nil
  return self
end


function ErrorHandlingError:error()
  return self.msg
end


function ErrorHandlingError:__tostring()
  return self.msg
end


return ErrorHandlingError
