

import Path from 'node:path'
import * as Fs from 'node:fs'

import { test, describe, afterEach } from 'node:test'
import assert from 'node:assert'
import { createLiveTransport } from '../../live-runner'
import { runLiveEntity } from '../../live-entity'


import { ErrorHandlingSDK, BaseFeature, stdutil } from '../../..'

import {
  envOverride,
  liveClientOptions,
  liveDelay,
  loadEnvLocal,
  makeCtrl,
  makeMatch,
  makeReqdata,
  makeStepData,
  makeValid,
  maybeSkipControl,
} from '../../utility'


// AFTER the imports on purpose: TypeScript hoists `import` above any
// statement in the emitted CommonJS, so a loader placed above them would
// run only after every imported module had already been evaluated - and
// anything reading process.env at module scope would miss these values.
loadEnvLocal(__dirname + '/../../../.env.local')


describe('LogoGenerationEntity', async () => {

  // Per-test live pacing. Delay is read from sdk-test-control.json's
  // `test.live.delayMs`; only sleeps when ERROR_HANDLING_TEST_LIVE=TRUE.
  afterEach(liveDelay('ERROR_HANDLING_TEST_LIVE'))

  test('instance', async () => {
    const testsdk = ErrorHandlingSDK.test()
    const ent = testsdk.LogoGeneration()
    assert(null != ent)
  })


  test('basic', async (t) => {

    const live = 'TRUE' === process.env.ERROR_HANDLING_TEST_LIVE
    for (const op of ['load']) {
      if (!live && maybeSkipControl(t, 'entityOp', 'logo_generation.' + op, live)) return
    }

    
    const setup = basicSetup()
    if (setup.live) {
      return runLiveEntity(setup, {"active":true,"alias":{"field":{}},"fields":[],"name":"logo_generation","op":{"load":{"input":"data","name":"load","points":[{"active":true,"args":{"query":[{"active":true,"example":"Hello","kind":"query","name":"text","orig":"text","reqd":true,"type":"`$STRING`","index$":0}]},"contract":{"id":"GET /api/logo/neon","json":"{\"operationId\":\"getNeonLogo\",\"parameters\":[{\"description\":\"Text to display in the neon logo\",\"example\":\"Hello\",\"in\":\"query\",\"name\":\"text\",\"required\":true,\"schema\":{\"minLength\":1,\"type\":\"string\"}}],\"protocol\":\"http\",\"responses\":{\"200\":{\"content\":{\"image/png\":{\"schema\":{\"format\":\"binary\",\"type\":\"string\"}}},\"description\":\"Successfully generated neon logo\"},\"400\":{\"content\":{\"application/json\":{\"examples\":{\"emptyText\":{\"summary\":\"Empty text parameter\",\"value\":{\"error\":\"Invalid parameter value\",\"message\":\"The 'text' parameter cannot be empty\",\"statusCode\":400}},\"missingText\":{\"summary\":\"Missing text parameter\",\"value\":{\"error\":\"Missing required parameter: text\",\"message\":\"The 'text' query parameter is required to generate a neon logo\",\"statusCode\":400}}},\"schema\":{\"properties\":{\"error\":{\"description\":\"Short error description\",\"type\":\"string\"},\"message\":{\"description\":\"Detailed error message explaining the issue\",\"type\":\"string\"},\"statusCode\":{\"description\":\"HTTP status code\",\"type\":\"integer\"}},\"required\":[\"error\",\"statusCode\",\"message\"],\"type\":\"object\"}}},\"description\":\"Bad request - missing or invalid text parameter\"},\"500\":{\"content\":{\"application/json\":{\"example\":{\"error\":\"Internal server error\",\"message\":\"An unexpected error occurred while processing your request\",\"statusCode\":500},\"schema\":{\"properties\":{\"error\":{\"description\":\"Short error description\",\"type\":\"string\"},\"message\":{\"description\":\"Detailed error message explaining the issue\",\"type\":\"string\"},\"statusCode\":{\"description\":\"HTTP status code\",\"type\":\"integer\"}},\"required\":[\"error\",\"statusCode\",\"message\"],\"type\":\"object\"}}},\"description\":\"Internal server error\"}},\"securitySource\":\"unspecified\"}","source":"openapi3","version":1},"kind":"http","method":"GET","orig":"/api/logo/neon","segments":[{"lit":"api"},{"lit":"logo"},{"lit":"neon"}],"select":{"exist":["text"]},"transform":{"req":"`reqdata`","res":"`body`"},"index$":0}],"key$":"load"}},"relations":{"ancestors":[]},"key$":"logo_generation","name__orig":"logo_generation","Name":"LogoGeneration","name_":"logo_generation","name-":"logo-generation","NAME":"LOGO_GENERATION","index$":0}, {"active":true,"entity":"logo_generation","key$":"BasicLogoGenerationFlow","kind":"basic","name":"BasicLogoGenerationFlow","param":{},"step":[{"active":true,"data":{},"input":{"ref":"logo_generation_ref01","srcdatavar":"logo_generation_ref01_data","suffix":"_dt0"},"match":{},"op":"load","spec":[],"valid":[{"apply":"TextFieldMark","def":{"mark":"Mark01-logo_generation_ref01"}}],"index$":0}]}, 'LogoGeneration')
    }
    const client = setup.client
    const struct = setup.struct

    const isempty = struct.isempty
    const select = struct.select

    let logo_generation_ref01_data = Object.values(setup.data.existing.logo_generation)[0] as any

    // LOAD
    const logo_generation_ref01_ent = client.LogoGeneration()
    const logo_generation_ref01_match_dt0: any = {}
    const logo_generation_ref01_data_dt0 = (await logo_generation_ref01_ent.load(logo_generation_ref01_match_dt0)).data()
    assert(null != logo_generation_ref01_data_dt0)


  })
})



function basicSetup(extra?: any) {
  // TODO: fix test def options
  const options: any = {} // null

  // TODO: needs test utility to resolve path
  const entityDataFile =
    Path.resolve(__dirname, 
      '../../../../.sdk/test/entity/logo_generation/LogoGenerationTestData.json')

  // TODO: file ready util needed?
  const entityDataSource = Fs.readFileSync(entityDataFile).toString('utf8')

  // TODO: need a xlang JSON parse utility in voxgig/struct with better error msgs
  const entityData = JSON.parse(entityDataSource)

  options.entity = entityData.existing

  let client = ErrorHandlingSDK.test(options, extra)
  const struct = client.utility().struct
  const merge = struct.merge
  const transform = struct.transform

  let idmap = transform(
    ['logo_generation01','logo_generation02','logo_generation03'],
    {
      '`$PACK`': ['', {
        '`$KEY`': '`$COPY`',
        '`$VAL`': ['`$FORMAT`', 'upper', '`$COPY`']
      }]
    })

  const env = envOverride({
    'ERROR_HANDLING_TEST_LOGO_GENERATION_ENTID': idmap,
    'ERROR_HANDLING_TEST_LIVE': 'FALSE',
    'ERROR_HANDLING_TEST_EXPLAIN': 'FALSE',
  })

  idmap = env['ERROR_HANDLING_TEST_LOGO_GENERATION_ENTID']

  const live = 'TRUE' === env.ERROR_HANDLING_TEST_LIVE

  const transport = createLiveTransport()
  if (live) {
    const rawIds = process.env['ERROR_HANDLING_TEST_LOGO_GENERATION_ENTID']
    idmap = rawIds && rawIds.trim() ? JSON.parse(rawIds) : {}
    if (!idmap || Array.isArray(idmap) || typeof idmap !== 'object') {
      throw new Error('Live ENTID must be a JSON object')
    }
    client = new ErrorHandlingSDK(merge([
      // FIRST, so the generated fields below win: sdk-test-control.json's
      // test.client.options adds to the live client, it does not redirect it.
      liveClientOptions(),
      {
      },
      // 'extra || {}', not a bare 'extra': struct.merge returns UNDEFINED when the
      // last entry is undefined, and basicSetup is normally called with no
      // argument at all - so a bare 'extra' silently discarded the apikey
      // and server values above and handed the SDK undefined. Harmless
      // while there was nothing in that object; not harmless now.
      extra || {},
      { system: { fetch: transport.fetch } }
    ]))
  }

  const setup = {
    idmap,
    env,
    options,
    client,
    struct,
    data: entityData,
    explain: 'TRUE' === env.ERROR_HANDLING_TEST_EXPLAIN,
    live,
    transport,
    now: Date.now(),
  }

  return setup
}
  
