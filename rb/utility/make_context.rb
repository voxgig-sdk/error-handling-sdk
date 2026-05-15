# ErrorHandling SDK utility: make_context
require_relative '../core/context'
module ErrorHandlingUtilities
  MakeContext = ->(ctxmap, basectx) {
    ErrorHandlingContext.new(ctxmap, basectx)
  }
end
