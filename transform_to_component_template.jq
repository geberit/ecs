{
  _meta: {
    ecs_version: .mappings._meta.version,
    generated_at: $now,
    git_commit_hash: $git_commit_hash,
  },
  template: {
    mappings: .mappings | del(._meta),
  },
}
