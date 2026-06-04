# LogoGeneration entity test

require "minitest/autorun"
require "json"
require_relative "../ErrorHandling_sdk"
require_relative "runner"

class LogoGenerationEntityTest < Minitest::Test
  def test_create_instance
    testsdk = ErrorHandlingSDK.test(nil, nil)
    ent = testsdk.LogoGeneration(nil)
    assert !ent.nil?
  end

  def test_basic_flow
    setup = logo_generation_basic_setup(nil)
    # Per-op sdk-test-control.json skip.
    _live = setup[:live] || false
    ["load"].each do |_op|
      _should_skip, _reason = Runner.is_control_skipped("entityOp", "logo_generation." + _op, _live ? "live" : "unit")
      if _should_skip
        skip(_reason || "skipped via sdk-test-control.json")
        return
      end
    end
    # The basic flow consumes synthetic IDs from the fixture. In live mode
    # without an *_ENTID env override, those IDs hit the live API and 4xx.
    if setup[:synthetic_only]
      skip "live entity test uses synthetic IDs from fixture — set ERRORHANDLING_TEST_LOGO_GENERATION_ENTID JSON to run live"
      return
    end
    client = setup[:client]

    # Bootstrap entity data from existing test data.
    logo_generation_ref01_data_raw = Vs.items(Helpers.to_map(
      Vs.getpath(setup[:data], "existing.logo_generation")))
    logo_generation_ref01_data = nil
    if logo_generation_ref01_data_raw.length > 0
      logo_generation_ref01_data = Helpers.to_map(logo_generation_ref01_data_raw[0][1])
    end

    # LOAD
    logo_generation_ref01_ent = client.LogoGeneration(nil)
    logo_generation_ref01_match_dt0 = {}
    logo_generation_ref01_data_dt0_loaded, err = logo_generation_ref01_ent.load(logo_generation_ref01_match_dt0, nil)
    assert_nil err
    assert !logo_generation_ref01_data_dt0_loaded.nil?

  end
end

def logo_generation_basic_setup(extra)
  Runner.load_env_local

  entity_data_file = File.join(__dir__, "..", "..", ".sdk", "test", "entity", "logo_generation", "LogoGenerationTestData.json")
  entity_data_source = File.read(entity_data_file)
  entity_data = JSON.parse(entity_data_source)

  options = {}
  options["entity"] = entity_data["existing"]

  client = ErrorHandlingSDK.test(options, extra)

  # Generate idmap via transform.
  idmap = Vs.transform(
    ["logo_generation01", "logo_generation02", "logo_generation03"],
    {
      "`$PACK`" => ["", {
        "`$KEY`" => "`$COPY`",
        "`$VAL`" => ["`$FORMAT`", "upper", "`$COPY`"],
      }],
    }
  )

  # Detect ENTID env override before envOverride consumes it. When live
  # mode is on without a real override, the basic test runs against synthetic
  # IDs from the fixture and 4xx's. Surface this so the test can skip.
  entid_env_raw = ENV["ERRORHANDLING_TEST_LOGO_GENERATION_ENTID"]
  idmap_overridden = !entid_env_raw.nil? && entid_env_raw.strip.start_with?("{")

  env = Runner.env_override({
    "ERRORHANDLING_TEST_LOGO_GENERATION_ENTID" => idmap,
    "ERRORHANDLING_TEST_LIVE" => "FALSE",
    "ERRORHANDLING_TEST_EXPLAIN" => "FALSE",
  })

  idmap_resolved = Helpers.to_map(
    env["ERRORHANDLING_TEST_LOGO_GENERATION_ENTID"])
  if idmap_resolved.nil?
    idmap_resolved = Helpers.to_map(idmap)
  end

  if env["ERRORHANDLING_TEST_LIVE"] == "TRUE"
    merged_opts = Vs.merge([
      {
      },
      extra || {},
    ])
    client = ErrorHandlingSDK.new(Helpers.to_map(merged_opts))
  end

  live = env["ERRORHANDLING_TEST_LIVE"] == "TRUE"
  {
    client: client,
    data: entity_data,
    idmap: idmap_resolved,
    env: env,
    explain: env["ERRORHANDLING_TEST_EXPLAIN"] == "TRUE",
    live: live,
    synthetic_only: live && !idmap_overridden,
    now: (Time.now.to_f * 1000).to_i,
  }
end
