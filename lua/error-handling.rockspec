package = "voxgig-sdk-error-handling"
version = "0.0-1"
source = {
  url = "git://github.com/voxgig-sdk/error-handling-sdk.git"
}
description = {
  summary = "ErrorHandling SDK for Lua",
  license = "MIT"
}
dependencies = {
  "lua >= 5.3",
  "dkjson >= 2.5",
  "dkjson >= 2.5",
}
build = {
  type = "builtin",
  modules = {
    ["error-handling_sdk"] = "error-handling_sdk.lua",
    ["config"] = "config.lua",
    ["features"] = "features.lua",
  }
}
