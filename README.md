# ErrorHandling SDK

Generate neon-style text logos from the Abhi-API logo subset

> TypeScript, Python, PHP, Golang, Ruby, Lua SDKs, a CLI, an interactive REPL, and an MCP server for AI agents — all generated from one OpenAPI spec by [@voxgig/sdkgen](https://github.com/voxgig/sdkgen).

## About Error Handling API

This SDK wraps a small slice of [Abhi-API](https://abhi-api.vercel.app), a free public API by Abhishek Suresh that bundles many small endpoints across categories such as logo generation, search, downloaders, jokes, and utilities. The "Error Handling" slug groups the logo-generation endpoint that returns a generated image based on a `text` query parameter.

What you get from the API:

- A single `GET /api/logo/neon` endpoint that produces a neon-styled text logo from a `text` query string.
- Image output suitable for embedding directly in pages or downloading.

Operational notes: the upstream service is hosted on Vercel and has no documented authentication or rate limits. CORS is reported as disabled on the freepublicapis listing, so browser-side use may require a proxy. There is no formal SLA — treat the API as best-effort.

## Try it

**TypeScript**
```bash
npm install error-handling
```

**Python**
```bash
pip install error-handling-sdk
```

**PHP**
```bash
composer require voxgig/error-handling-sdk
```

**Golang**
```bash
go get github.com/voxgig-sdk/error-handling-sdk/go
```

**Ruby**
```bash
gem install error-handling-sdk
```

**Lua**
```bash
luarocks install error-handling-sdk
```

## 30-second quickstart

### TypeScript

```ts
import { ErrorHandlingSDK } from 'error-handling'

const client = new ErrorHandlingSDK({})

```

See the [TypeScript README](ts/README.md) for the
full guide, or scroll down for the same example in other languages.

## What's in the box

| Surface | Use it for | Path |
| --- | --- | --- |
| **SDK** (TypeScript, Python, PHP, Golang, Ruby, Lua) | App integration | `ts/` `py/` `php/` `go/` `rb/` `lua/` |
| **CLI** | Scripts, CI, ops, one-off API calls | `go-cli/` |
| **MCP server** | AI agents (Claude, Cursor, Cline) | `go-mcp/` |

## Use it from an AI agent (MCP)

The generated MCP server exposes every operation in this SDK as an
[MCP](https://modelcontextprotocol.io) tool that Claude, Cursor or Cline
can call directly. Build and register it:

```bash
cd go-mcp && go build -o error-handling-mcp .
```

Then add it to your agent's MCP config (Claude Desktop, Cursor, etc.):

```json
{
  "mcpServers": {
    "error-handling": {
      "command": "/abs/path/to/error-handling-mcp"
    }
  }
}
```

## Entities

The API exposes one entity:

| Entity | Description | API path |
| --- | --- | --- |
| **LogoGeneration** | Endpoint that renders a neon-styled text logo from a `text` query parameter, served at `GET /api/logo/neon`. | `/api/logo/neon` |

Each entity supports the following operations where available: **load**,
**list**, **create**, **update**, and **remove**.

## Quickstart in other languages

### Python

```python
from errorhandling_sdk import ErrorHandlingSDK

client = ErrorHandlingSDK({})


# Load a specific logogeneration
logogeneration, err = client.LogoGeneration(None).load(
    {"id": "example_id"}, None
)
```

### PHP

```php
<?php
require_once 'errorhandling_sdk.php';

$client = new ErrorHandlingSDK([]);


// Load a specific logogeneration
[$logogeneration, $err] = $client->LogoGeneration(null)->load(
    ["id" => "example_id"], null
);
```

### Golang

```go
import sdk "github.com/voxgig-sdk/error-handling-sdk/go"

client := sdk.NewErrorHandlingSDK(map[string]any{})

```

### Ruby

```ruby
require_relative "ErrorHandling_sdk"

client = ErrorHandlingSDK.new({})


# Load a specific logogeneration
logogeneration, err = client.LogoGeneration(nil).load(
  { "id" => "example_id" }, nil
)
```

### Lua

```lua
local sdk = require("error-handling_sdk")

local client = sdk.new({})


-- Load a specific logogeneration
local logogeneration, err = client:LogoGeneration(nil):load(
  { id = "example_id" }, nil
)
```

## Unit testing in offline mode

Every SDK ships a test mode that swaps the HTTP transport for an
in-memory mock, so unit tests run offline.

### TypeScript

```ts
const client = ErrorHandlingSDK.test()
const result = await client.LogoGeneration().load({ id: 'test01' })
// result.ok === true, result.data contains mock data
```

### Python

```python
client = ErrorHandlingSDK.test(None, None)
result, err = client.LogoGeneration(None).load(
    {"id": "test01"}, None
)
```

### PHP

```php
$client = ErrorHandlingSDK::test(null, null);
[$result, $err] = $client->LogoGeneration(null)->load(
    ["id" => "test01"], null
);
```

### Golang

```go
client := sdk.TestSDK(nil, nil)
result, err := client.LogoGeneration(nil).Load(
    map[string]any{"id": "test01"}, nil,
)
```

### Ruby

```ruby
client = ErrorHandlingSDK.test(nil, nil)
result, err = client.LogoGeneration(nil).load(
  { "id" => "test01" }, nil
)
```

### Lua

```lua
local client = sdk.test(nil, nil)
local result, err = client:LogoGeneration(nil):load(
  { id = "test01" }, nil
)
```

## How it works

Every SDK call runs the same five-stage pipeline:

1. **Point** — resolve the API endpoint from the operation definition.
2. **Spec** — build the HTTP specification (URL, method, headers, body).
3. **Request** — send the HTTP request.
4. **Response** — receive and parse the response.
5. **Result** — extract the result data for the caller.

A feature hook fires at each stage (e.g. `PrePoint`, `PreSpec`,
`PreRequest`), so features can inspect or modify the pipeline without
forking the SDK.

### Features

| Feature | Purpose |
| --- | --- |
| **TestFeature** | In-memory mock transport for testing without a live server |

Pass custom features via the `extend` option at construction time.

### Direct and Prepare

For endpoints the entity model doesn't cover, use the low-level methods:

- **`direct(fetchargs)`** — build and send an HTTP request in one step.
- **`prepare(fetchargs)`** — build the request without sending it.

Both accept a map with `path`, `method`, `params`, `query`,
`headers`, and `body`. See the [How-to guides](#how-to-guides) below.

## How-to guides

### Make a direct API call

When the entity interface does not cover an endpoint, use `direct`:

**TypeScript:**
```ts
const result = await client.direct({
  path: '/api/resource/{id}',
  method: 'GET',
  params: { id: 'example' },
})
console.log(result.data)
```

**Python:**
```python
result, err = client.direct({
    "path": "/api/resource/{id}",
    "method": "GET",
    "params": {"id": "example"},
})
```

**PHP:**
```php
[$result, $err] = $client->direct([
    "path" => "/api/resource/{id}",
    "method" => "GET",
    "params" => ["id" => "example"],
]);
```

**Go:**
```go
result, err := client.Direct(map[string]any{
    "path":   "/api/resource/{id}",
    "method": "GET",
    "params": map[string]any{"id": "example"},
})
```

**Ruby:**
```ruby
result, err = client.direct({
  "path" => "/api/resource/{id}",
  "method" => "GET",
  "params" => { "id" => "example" },
})
```

**Lua:**
```lua
local result, err = client:direct({
  path = "/api/resource/{id}",
  method = "GET",
  params = { id = "example" },
})
```

## Per-language documentation

- [TypeScript](ts/README.md)
- [Python](py/README.md)
- [PHP](php/README.md)
- [Golang](go/README.md)
- [Ruby](rb/README.md)
- [Lua](lua/README.md)

## Using the Error Handling API

- Upstream: [https://abhi-api.vercel.app](https://abhi-api.vercel.app)

- The Abhi-API service does not publish an explicit license.
- Created and maintained by Abhishek Suresh; treat the service as third-party hosted.
- No documented attribution requirement, but credit to the upstream project is good practice.
- Availability and behaviour can change at any time; do not rely on it for critical workloads.

---

Generated from the Error Handling API OpenAPI spec by [@voxgig/sdkgen](https://github.com/voxgig/sdkgen).
