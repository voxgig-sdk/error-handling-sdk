# ErrorHandling SDK feature factory

require_relative 'feature/base_feature'
require_relative 'feature/test_feature'


module ErrorHandlingFeatures
  def self.make_feature(name)
    case name
    when "base"
      ErrorHandlingBaseFeature.new
    when "test"
      ErrorHandlingTestFeature.new
    else
      ErrorHandlingBaseFeature.new
    end
  end
end
