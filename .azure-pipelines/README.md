# .azure-pipelines

Hidden folder that holds every Azure DevOps pipeline definition and the reusable template library inside this repo. Keeping these assets under `.azure-pipelines/` mirrors the default filename (`azure-pipelines.yml`) that Azure DevOps expects at the repo root.

## Folder Structure

```
.azure-pipelines/
  pipelines/       # Concrete pipeline YAML files referenced by azure-pipelines.yml
  templates/       # Shared stages, jobs, steps, and variables
```

## Working With Pipelines

- Place each pipeline under `pipelines/` and reference it from a lightweight `azure-pipelines.yml` at the repository root via `extends` or `resources.repositories`.
- Keep one file per pipeline (`pipelines/<name>.yml`) and document triggers, variable groups, and parameters near the top through YAML comments.
- Compose your pipelines from the templates found in `templates/` to keep logic consistent and easy to update.
- Validate changes locally with `az pipelines preview` or through Azure DevOps pull-request validation pipelines before merging.

## Defaults From Template

- Variable group naming: `vg-[[ repository_name ]]`
- Service connection: `[[ service_connection ]]`
- Templates ref: `[[ pipeline_templates_ref ]]` (pin to a tag/branch, e.g. `refs/tags/v1.2.3`)

## Reusable Templates

Templates live under `templates/` and are grouped by scope:

- `steps/` – focused operations such as linting, testing, or publishing artifacts.
- `jobs/` – single-job definitions that include agent metadata and call step templates.
- `stages/` – multi-job phases like `Build`, `Deploy`, or `Release`.
- `variables/` – shared parameterized variable files or variable-group references.

Reference templates via the `template:` keyword and prefer explicit parameters to keep pipelines declarative and self-documenting.

> Tip: you can also reference centralized templates from the shared `pipeline-templates` repo using `resources.repositories` when you need to consume org-wide building blocks.
