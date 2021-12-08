{
  _meta: {
    ecs_version: .mappings._meta.version,
    generated_at: $now,
    git_commit_hash: $git_commit_hash,
  },
  template: {
    settings: .settings,
    mappings: (.mappings
      | .dynamic_templates[0].strings_as_text = { "mapping": { "norms": false, "type": "text" }, "match_mapping_type": "string" }
      | del(.dynamic_templates[0].strings_as_keyword)
      | .properties.host.properties.domain.normalizer = "lowercase_normalizer"
      | .properties.host.properties.hostname.normalizer = "lowercase_normalizer"
      | .properties.host.properties.mac.normalizer = "uppercase_normalizer"
      | .properties.agent.properties.name.normalizer = "lowercase_normalizer"
      | .properties.user.properties.email.normalizer = "lowercase_normalizer"
      | .properties.user.properties.full_name.normalizer = "lowercase_normalizer"
      | .properties.user.properties.name.normalizer = "lowercase_normalizer"
      | .properties.client.properties.user.properties.email.normalizer = "lowercase_normalizer"
      | .properties.client.properties.user.properties.full_name.normalizer = "lowercase_normalizer"
      | .properties.client.properties.user.properties.name.normalizer = "lowercase_normalizer"
      | .properties.destination.properties.user.properties.email.normalizer = "lowercase_normalizer"
      | .properties.destination.properties.user.properties.full_name.normalizer = "lowercase_normalizer"
      | .properties.destination.properties.user.properties.name.normalizer = "lowercase_normalizer"
      | .properties.host.properties.user.properties.email.normalizer = "lowercase_normalizer"
      | .properties.host.properties.user.properties.full_name.normalizer = "lowercase_normalizer"
      | .properties.host.properties.user.properties.name.normalizer = "lowercase_normalizer"
      | .properties.server.properties.user.properties.email.normalizer = "lowercase_normalizer"
      | .properties.server.properties.user.properties.full_name.normalizer = "lowercase_normalizer"
      | .properties.server.properties.user.properties.name.normalizer = "lowercase_normalizer"
      | .properties.source.properties.user.properties.email.normalizer = "lowercase_normalizer"
      | .properties.source.properties.user.properties.full_name.normalizer = "lowercase_normalizer"
      | .properties.source.properties.user.properties.name.normalizer = "lowercase_normalizer"
      | .properties.user.properties.changes.properties.email.normalizer = "lowercase_normalizer"
      | .properties.user.properties.changes.properties.full_name.normalizer = "lowercase_normalizer"
      | .properties.user.properties.changes.properties.name.normalizer = "lowercase_normalizer"
      | .properties.user.properties.effective.properties.email.normalizer = "lowercase_normalizer"
      | .properties.user.properties.effective.properties.full_name.normalizer = "lowercase_normalizer"
      | .properties.user.properties.effective.properties.name.normalizer = "lowercase_normalizer"
      | .properties.user.properties.target.properties.email.normalizer = "lowercase_normalizer"
      | .properties.user.properties.target.properties.full_name.normalizer = "lowercase_normalizer"
      | .properties.user.properties.target.properties.name.normalizer = "lowercase_normalizer"
      | .properties.log.properties.level.normalizer = "lowercase_normalizer"

      # Filesystems on Unix are case sensitive. So we cannot convert to to lower case.
      # | .properties.log.properties.file.properties.name.normalizer = "lowercase_normalizer"
      # | .properties.log.properties.file.properties.path.normalizer = "lowercase_normalizer"

      | del(._meta)),
  },
}
