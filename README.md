# Elastic Common Schema (ECS)

The Elastic Common Schema (ECS) defines a common set of fields for
ingesting data into Elasticsearch. A common schema helps you correlate
data from sources like logs and metrics or IT operations
analytics and security analytics.

## Documentation

The ECS reference is published on the main Elastic documentation website.
Visit [the official ECS Reference Documentation](https://www.elastic.co/guide/en/ecs/current/index.html).

## Getting Started

Please review the [tooling usage guide](USAGE.md) to get started using the tools provided in this repo.

## Contributing

If you're looking to contribute to ECS, you're invited to look at our
[contribution guide](CONTRIBUTING.md). Substantial changes to ECS are completed
through our [RFC process](./rfcs/README.md).

## Organization internal use of ECS

### Development model

The development model of custom changes to ECS is to carry them ontop of the
latest stable ECS releases using `git rebase`. This approach is for example
used by Android custom ROMs successfully.

To rebase onto the latest release, do something like this:

```Shell
# Review changes up to latest version:
git fetch origin --tags
git diff v1.8.0..v1.9.0 -- schemas/ docs/ scripts/

# Archive customizations:
git branch -c custom custom-1.8
git push -u "$org_internal" custom-1.8

# Cherry-pick custom patchset onto latest release:
git reset --hard v1.9.0
git cherry-pick v1.8.0..custom-1.8

# Rebase cannot be used because elastic/ecs maintainers use a different git release process than Android Open Source Project (AOSP). If Elastic would use a cleaner release processes, the cherry-pick section could be replaced by this:
git rebase v1.9.0

# Push the updated custom branch.
git push -f
```

### Naming convention

To make organization specific changes visible to end users, the phrase "our
organization" should be mentioned in field descriptions for example. This
specific phrase should be used to allow users to search for it. The name of the
organization is not used directly to allow to cherry-pick custom changes across
organizations. For example: `At our organization`

If changes are made that should not be published, the name of the organization
should be included in the text to signal a change specific to the organization
which makes the above reason invalid. For example: `At our organization <name_of_org>`

## Generated artifacts

Various kinds of files or programs can be generated based on ECS.
You can learn more in [generated/README.md](generated)

## Releases of ECS

The master branch of this repository should never be considered an
official release of ECS. You can browse official releases of ECS
[here](https://github.com/elastic/ecs/releases).

The ECS team publishes improvements to the schema by following
[Semantic Versioning](https://semver.org/).
Generally major ECS releases are planned to be aligned with major Elastic Stack releases.
