# backstage-docs-syncer-buildkite-plugin
A plugin to assist in syncing Backstage documents to S3.

## Example Use

```yaml
steps:
  - command: ls
    plugins:
      - docker-compose#v3.7.0:
          run: app
          volumes:
            - "./:/app"
      - mcncl/backstage-docs-syncer#v0.1.0:
          kind: Componenent
          entity_name: Example
```

## Configuration
### `kind` (Required, string)

### `entity_name` (Required, string)

### `bucket` (Optional, string)

### `namespace` (Optional, string)
