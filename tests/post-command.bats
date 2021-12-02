#!/usr/bin/env bats

load '/usr/local/lib/bats/load.bash'

# Uncomment the following line to debug stub failures
# export BUILDKITE_AGENT_STUB_DEBUG=/dev/tty

@test "When mkdocs.yml does exist, it should pass." {
  run echo hello world >> mkdocs.test
  run test -f mkdocs.test

  assert_success

  rm mkdocs.test
}

@test "When mkdocs.yml does not exist, it should fail." {
  run rm mkdocs.yml
  run test -f mkdocs.yml

  assert_failure
}

@test "When a BUCKET is set, it does not use the default bucket name." {
  export BUILDKITE_PLUGIN_BACKSTAGE_DOCS_SYNCER_BUCKET=test-bucket
  run bash -c "echo $BUILDKITE_PLUGIN_BACKSTAGE_DOCS_SYNCER_BUCKET"
  [ "$output" = "test-bucket" ]

  assert_success
}

@test "When BACKSTAGE_BUCKET_NAME is not set, it should use sensible defaults." {
  export BUCKET="${BUILDKITE_PLUGIN_BACKSTAGE_DOCS_SYNCER_BUCKET:-platform-backstage-docs-bucket}"
  run bash -c "echo $BUCKET"
  [ "$output" = "platform-backstage-docs-bucket" ]

  assert_success
}

@test "When BACKSTAGE_NAMESPACE is not set, it should use sensible defaults." {
  export NAMESPACE="${BUILDKITE_PLUGIN_BACKSTAGE_DOCS_SYNCER_NAMESPACE:-default}"
  run bash -c "echo $NAMESPACE"
  [ "$output" = "default" ]

  assert_success
}