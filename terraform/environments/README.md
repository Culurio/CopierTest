# Environments

Variable files and environment-specific overrides consumed by Terraform.

## Default tfvars

[% for env in environments %]

- `terraform/environments/[[ env.name ]].tfvars`
[% if env.has_dr %]
- `terraform/environments/[[ env.name ]].active.tfvars`
- `terraform/environments/[[ env.name ]].standby.tfvars`
[% endif %]
[% endfor %]
