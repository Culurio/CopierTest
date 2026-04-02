# Infrastructure Template for [[ repository_name ]]

Starter structure for infrastructure projects that bundles documentation, automation, and Infrastructure as Code assets.

## Default configuration

- Azure DevOps service connection: `[[ service_connection ]]`
- Pipeline templates ref: `[[ pipeline_templates_ref ]]`
- Environments:
[% for env in environments %]
  - [[ env.name ]]
[% if env.has_dr %]
  - dr-[[ env.name ]]
[% endif %]
[% endfor %]

## Repository layout

- `docs/` – central documentation such as ADRs, runbooks, and onboarding guides.
- `ansible/` – configuration management assets with dedicated `playbooks/` and `roles/`.
- `.azure-pipelines/` – YAML pipelines plus shared `templates/` for Azure DevOps CI/CD.
- `scripts/` – helper scripts grouped by language (e.g., `bash/`, `python/`, `powershell/`).
- `terraform/` – Terraform entry points and reusable `modules/`.
- `tests/` – automated checks validating infrastructure definitions and tooling.

Each folder already contains a short README describing how to use it so teams can quickly onboard and extend the template.
