
import { Context } from './Context'


class ErrorHandlingError extends Error {

  isErrorHandlingError = true

  sdk = 'ErrorHandling'

  code: string
  ctx: Context

  constructor(code: string, msg: string, ctx: Context) {
    super(msg)
    this.code = code
    this.ctx = ctx
  }

}

export {
  ErrorHandlingError
}

