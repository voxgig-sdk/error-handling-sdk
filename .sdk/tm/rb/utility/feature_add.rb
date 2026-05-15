# ErrorHandling SDK utility: feature_add
module ErrorHandlingUtilities
  FeatureAdd = ->(ctx, f) {
    ctx.client.features << f
  }
end
