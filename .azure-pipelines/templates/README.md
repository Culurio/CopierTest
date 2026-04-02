# Pipeline Templates

The templates folder keeps reusable building blocks that pipelines import. Organize them by scope so consumers can quickly locate the right abstraction level:

- `stages/` – multi-job stages encapsulating full phases (e.g., `build.yml`, `deploy.yml`).
- `jobs/` – single job definitions with agent/strategy metadata (e.g., `terraform-plan.yml`).
- `steps/` – discrete task sequences (install, lint, publish, etc.).
- `variables/` – parameterized variable templates or variable groups.

## Authoring Guidelines

1. Require parameters for anything configurable; do not read repo secrets directly inside templates.
2. Provide sane defaults and document parameters at the top of the file.
3. Keep templates idempotent and avoid stateful scripts unless necessary.
4. Include examples in comments that show how to call the template from a pipeline.

## Consuming Templates

```yaml
stages:
- stage: Build
  jobs:
  - template: jobs/dotnet-build.yml
    parameters:
      project: src/MyApp/MyApp.csproj
```

Prefer referencing templates relative to the `.azure-pipelines/templates` folder to avoid brittle paths.

When you need organization-wide helpers, you can also bring in templates from the central `pipeline-templates` repository by declaring it under `resources.repositories` and pointing `template:` references to that repo.
