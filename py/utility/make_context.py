# ErrorHandling SDK utility: make_context

from core.context import ErrorHandlingContext


def make_context_util(ctxmap, basectx):
    return ErrorHandlingContext(ctxmap, basectx)
