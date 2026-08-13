# ErrorHandling SDK utility: make_context

from errorhandling_sdk.core.context import ErrorHandlingContext


def make_context_util(ctxmap, basectx):
    return ErrorHandlingContext(ctxmap, basectx)
