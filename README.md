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
The _Kind_ of the component. For more information on Kinds, visit the official
documention for [Backstage descriptor
formats](https://backstage.io/docs/features/software-catalog/descriptor-format)

### `entity_name` (Required, string)
A recognisable name for your Entity, this needs to follow some conventions set
out in the [official
documentation](https://backstage.io/docs/features/software-catalog/descriptor-format#name-required), but it should be something helpful that
teammates can understand.

### `bucket` (Optional, string)
The name of the S3 bucket you wish to sync the docs to, this will default to
`backstage-docs-bucket` if not set.

### `namespace` (Optional, string)
The ID of the `namespace` that the Entity belongs to, this will default to
`default` if not set.

