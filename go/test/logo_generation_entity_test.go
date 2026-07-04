package sdktest

import (
	"encoding/json"
	"os"
	"path/filepath"
	"runtime"
	"strings"
	"testing"
	"time"

	sdk "github.com/voxgig-sdk/error-handling-sdk/go"
	"github.com/voxgig-sdk/error-handling-sdk/go/core"

	vs "github.com/voxgig-sdk/error-handling-sdk/go/utility/struct"
)

func TestLogoGenerationEntity(t *testing.T) {
	t.Run("instance", func(t *testing.T) {
		testsdk := sdk.TestSDK(nil, nil)
		ent := testsdk.LogoGeneration(nil)
		if ent == nil {
			t.Fatal("expected non-nil LogoGenerationEntity")
		}
	})

	t.Run("basic", func(t *testing.T) {
		setup := logo_generationBasicSetup(nil)
		// Per-op sdk-test-control.json skip — basic test exercises a flow
		// with multiple ops; skipping any op skips the whole flow.
		_mode := "unit"
		if setup.live {
			_mode = "live"
		}
		for _, _op := range []string{"load"} {
			if _shouldSkip, _reason := isControlSkipped("entityOp", "logo_generation." + _op, _mode); _shouldSkip {
				if _reason == "" {
					_reason = "skipped via sdk-test-control.json"
				}
				t.Skip(_reason)
				return
			}
		}
		// The basic flow consumes synthetic IDs from the fixture. In live mode
		// without an *_ENTID env override, those IDs hit the live API and 4xx.
		if setup.syntheticOnly {
			t.Skip("live entity test uses synthetic IDs from fixture — set ERRORHANDLING_TEST_LOGO_GENERATION_ENTID JSON to run live")
			return
		}
		client := setup.client

		// Bootstrap entity data from existing test data (no create step in flow).
		logoGenerationRef01DataRaw := vs.Items(core.ToMapAny(vs.GetPath("existing.logo_generation", setup.data)))
		var logoGenerationRef01Data map[string]any
		if len(logoGenerationRef01DataRaw) > 0 {
			logoGenerationRef01Data = core.ToMapAny(logoGenerationRef01DataRaw[0][1])
		}
		// Discard guards against Go's unused-var check when the flow's steps
		// happen not to consume the bootstrap data (e.g. list-only flows).
		_ = logoGenerationRef01Data

		// LOAD
		logoGenerationRef01Ent := client.LogoGeneration(nil)
		logoGenerationRef01MatchDt0 := map[string]any{}
		logoGenerationRef01DataDt0Loaded, err := logoGenerationRef01Ent.Load(logoGenerationRef01MatchDt0, nil)
		if err != nil {
			t.Fatalf("load failed: %v", err)
		}
		if logoGenerationRef01DataDt0Loaded == nil {
			t.Fatal("expected load result to be non-nil")
		}

	})
}

func logo_generationBasicSetup(extra map[string]any) *entityTestSetup {
	loadEnvLocal()

	_, filename, _, _ := runtime.Caller(0)
	dir := filepath.Dir(filename)

	entityDataFile := filepath.Join(dir, "..", "..", ".sdk", "test", "entity", "logo_generation", "LogoGenerationTestData.json")

	entityDataSource, err := os.ReadFile(entityDataFile)
	if err != nil {
		panic("failed to read logo_generation test data: " + err.Error())
	}

	var entityData map[string]any
	if err := json.Unmarshal(entityDataSource, &entityData); err != nil {
		panic("failed to parse logo_generation test data: " + err.Error())
	}

	options := map[string]any{}
	options["entity"] = entityData["existing"]

	client := sdk.TestSDK(options, extra)

	// Generate idmap via transform, matching TS pattern.
	idmap := vs.Transform(
		[]any{"logo_generation01", "logo_generation02", "logo_generation03"},
		map[string]any{
			"`$PACK`": []any{"", map[string]any{
				"`$KEY`": "`$COPY`",
				"`$VAL`": []any{"`$FORMAT`", "upper", "`$COPY`"},
			}},
		},
	)

	// Detect ENTID env override before envOverride consumes it. When live
	// mode is on without a real override, the basic test runs against synthetic
	// IDs from the fixture and 4xx's. Surface this so the test can skip.
	entidEnvRaw := os.Getenv("ERRORHANDLING_TEST_LOGO_GENERATION_ENTID")
	idmapOverridden := entidEnvRaw != "" && strings.HasPrefix(strings.TrimSpace(entidEnvRaw), "{")

	env := envOverride(map[string]any{
		"ERRORHANDLING_TEST_LOGO_GENERATION_ENTID": idmap,
		"ERRORHANDLING_TEST_LIVE":      "FALSE",
		"ERRORHANDLING_TEST_EXPLAIN":   "FALSE",
	})

	idmapResolved := core.ToMapAny(env["ERRORHANDLING_TEST_LOGO_GENERATION_ENTID"])
	if idmapResolved == nil {
		idmapResolved = core.ToMapAny(idmap)
	}

	if env["ERRORHANDLING_TEST_LIVE"] == "TRUE" {
		mergedOpts := vs.Merge([]any{
			map[string]any{
			},
			extra,
		})
		client = sdk.NewErrorHandlingSDK(core.ToMapAny(mergedOpts))
	}

	live := env["ERRORHANDLING_TEST_LIVE"] == "TRUE"
	return &entityTestSetup{
		client:        client,
		data:          entityData,
		idmap:         idmapResolved,
		env:           env,
		explain:       env["ERRORHANDLING_TEST_EXPLAIN"] == "TRUE",
		live:          live,
		syntheticOnly: live && !idmapOverridden,
		now:           time.Now().UnixMilli(),
	}
}
