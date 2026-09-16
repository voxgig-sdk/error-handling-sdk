# ErrorHandling SDK feature factory

from errorhandling_sdk.feature.base_feature import ErrorHandlingBaseFeature
from errorhandling_sdk.feature.ratelimit_feature import ErrorHandlingRatelimitFeature
from errorhandling_sdk.feature.retry_feature import ErrorHandlingRetryFeature
from errorhandling_sdk.feature.test_feature import ErrorHandlingTestFeature
from errorhandling_sdk.feature.timeout_feature import ErrorHandlingTimeoutFeature


_FEATURES = {
    "base": lambda: ErrorHandlingBaseFeature(),
    "ratelimit": lambda: ErrorHandlingRatelimitFeature(),
    "retry": lambda: ErrorHandlingRetryFeature(),
    "test": lambda: ErrorHandlingTestFeature(),
    "timeout": lambda: ErrorHandlingTimeoutFeature(),
}


def _make_feature(name):
    factory = _FEATURES.get(name)
    if factory is not None:
        return factory()
    return _FEATURES["base"]()


# True when this SDK was generated with the named feature class - the
# constructor's tolerance for extend-carried features reads this (an
# active name with no generated class must not become a BaseFeature
# stray when an extend instance carries it).
def _has_feature(name):
    return name in _FEATURES
