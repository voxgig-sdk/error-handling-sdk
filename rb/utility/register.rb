# ErrorHandling SDK utility registration
require_relative '../core/utility_type'
require_relative 'clean'
require_relative 'done'
require_relative 'make_error'
require_relative 'feature_add'
require_relative 'feature_hook'
require_relative 'feature_init'
require_relative 'fetcher'
require_relative 'make_fetch_def'
require_relative 'make_context'
require_relative 'make_options'
require_relative 'make_request'
require_relative 'make_response'
require_relative 'make_result'
require_relative 'make_point'
require_relative 'make_spec'
require_relative 'make_url'
require_relative 'param'
require_relative 'prepare_auth'
require_relative 'prepare_body'
require_relative 'prepare_headers'
require_relative 'prepare_method'
require_relative 'prepare_params'
require_relative 'prepare_path'
require_relative 'prepare_query'
require_relative 'result_basic'
require_relative 'result_body'
require_relative 'result_headers'
require_relative 'transform_request'
require_relative 'transform_response'

ErrorHandlingUtility.registrar = ->(u) {
  u.clean = ErrorHandlingUtilities::Clean
  u.done = ErrorHandlingUtilities::Done
  u.make_error = ErrorHandlingUtilities::MakeError
  u.feature_add = ErrorHandlingUtilities::FeatureAdd
  u.feature_hook = ErrorHandlingUtilities::FeatureHook
  u.feature_init = ErrorHandlingUtilities::FeatureInit
  u.fetcher = ErrorHandlingUtilities::Fetcher
  u.make_fetch_def = ErrorHandlingUtilities::MakeFetchDef
  u.make_context = ErrorHandlingUtilities::MakeContext
  u.make_options = ErrorHandlingUtilities::MakeOptions
  u.make_request = ErrorHandlingUtilities::MakeRequest
  u.make_response = ErrorHandlingUtilities::MakeResponse
  u.make_result = ErrorHandlingUtilities::MakeResult
  u.make_point = ErrorHandlingUtilities::MakePoint
  u.make_spec = ErrorHandlingUtilities::MakeSpec
  u.make_url = ErrorHandlingUtilities::MakeUrl
  u.param = ErrorHandlingUtilities::Param
  u.prepare_auth = ErrorHandlingUtilities::PrepareAuth
  u.prepare_body = ErrorHandlingUtilities::PrepareBody
  u.prepare_headers = ErrorHandlingUtilities::PrepareHeaders
  u.prepare_method = ErrorHandlingUtilities::PrepareMethod
  u.prepare_params = ErrorHandlingUtilities::PrepareParams
  u.prepare_path = ErrorHandlingUtilities::PreparePath
  u.prepare_query = ErrorHandlingUtilities::PrepareQuery
  u.result_basic = ErrorHandlingUtilities::ResultBasic
  u.result_body = ErrorHandlingUtilities::ResultBody
  u.result_headers = ErrorHandlingUtilities::ResultHeaders
  u.transform_request = ErrorHandlingUtilities::TransformRequest
  u.transform_response = ErrorHandlingUtilities::TransformResponse
}
