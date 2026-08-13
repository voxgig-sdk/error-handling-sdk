# ErrorHandling SDK feature factory

from errorhandling_sdk.feature.base_feature import ErrorHandlingBaseFeature
from errorhandling_sdk.feature.test_feature import ErrorHandlingTestFeature


def _make_feature(name):
    features = {
        "base": lambda: ErrorHandlingBaseFeature(),
        "test": lambda: ErrorHandlingTestFeature(),
    }
    factory = features.get(name)
    if factory is not None:
        return factory()
    return features["base"]()
