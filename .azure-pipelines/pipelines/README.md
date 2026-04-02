# Pipeline Definitions

This directory hosts the YAML pipelines that Azure DevOps consumes from this repository. Each file represents a complete multi-stage pipeline that can be referenced by the root `azure-pipelines.yml`.

## Adding a Pipeline

1. Create a new YAML file under this folder (`pipelines/<name>.yml`).
2. Reference it from `azure-pipelines.yml` via `extends` or `resources.repositories`.
3. Build your stages/jobs from the shared templates in `../templates` to reduce duplication.
4. Describe the pipeline intent, required service connections, and secrets in comments at the top of the file.

## Conventions

- Use kebab-case filenames such as `pipelines/infra-plan-apply.yml`.
- Include `trigger` and `pr` blocks so Azure DevOps knows when to run the pipeline.
- Scope variables and parameters to the smallest unit that needs them.
- Prefer runtime parameters when user input should be validated.

## Defaults From Template

- Variable group naming: `vg-[[ repository_name ]]`
- Service connection: `[[ service_connection ]]`
- Templates ref: `[[ pipeline_templates_ref ]]` (pin to a tag/branch, e.g. `refs/tags/v1.2.3`)

## Testing

Test pipeline changes through Azure DevOps pull-request validations or the [Pipeline Preview](https://learn.microsoft.com/azure/devops/pipelines/yaml-schema/preview-yaml) feature before merging.
