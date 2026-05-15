
import { test, describe } from 'node:test'
import { equal } from 'node:assert'


import { ErrorHandlingSDK } from '..'


describe('exists', async () => {

  test('test-mode', async () => {
    const testsdk = await ErrorHandlingSDK.test()
    equal(null !== testsdk, true)
  })

})
