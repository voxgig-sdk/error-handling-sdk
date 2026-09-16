# ErrorHandling SDK feature factory

require_relative 'feature/base_feature'
require_relative 'feature/ratelimit_feature'
require_relative 'feature/retry_feature'
require_relative 'feature/test_feature'
require_relative 'feature/timeout_feature'


module ErrorHandlingFeatures
  def self.make_feature(name)
    case name
    when "base"
      ErrorHandlingBaseFeature.new
    when "ratelimit"
      ErrorHandlingRatelimitFeature.new
    when "retry"
      ErrorHandlingRetryFeature.new
    when "test"
      ErrorHandlingTestFeature.new
    when "timeout"
      ErrorHandlingTimeoutFeature.new
    else
      ErrorHandlingBaseFeature.new
    end
  end
end
