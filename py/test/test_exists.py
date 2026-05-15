# ProjectName SDK exists test

import pytest
from errorhandling_sdk import ErrorHandlingSDK


class TestExists:

    def test_should_create_test_sdk(self):
        testsdk = ErrorHandlingSDK.test(None, None)
        assert testsdk is not None
