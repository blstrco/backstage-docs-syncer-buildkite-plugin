# Backstage Docs Syncer
[Backstage](https://backstage.io/) allows the addition of techdocs, using
MkDocs as the orchestrating file for `docs/` within a repository. The aim of
this plugin is to remove the need of a `docker-compose` service and instead
perform the syncronisation as a plugin when required.

## Example Use

```yaml
steps:
  - command: ls
    plugins:
      - docker-compose#v3.7.0:
          run: app
          volumes:
            - "./:/app"
      - mcncl/backstage-docs-syncer#v0.1.1:
          kind: Componenent
          entity_name: Example
          bucket: docs-hub
          namespace: secret-app
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

