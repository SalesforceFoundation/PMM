# pmdm

Program Management Data Model package for non-profit organizations.

## Development

Use the following commands to create a PMDM scratch org with or without the following options:
- PMDM only: `cci flow run dev_org --org dev`
- PMDM namespaced only: `cci flow run dev_org_namespaced --org dev_namespaced`
- PMDM + NPSP: `cci flow run dev_org --org npsp`
- PMDM namespaced + NPSP: `cci flow run dev_org_namespaced --org npsp_namespaced`
- PMDM + Case Management: `cci flow run caseman_org --org caseman`
- PMDM namespaced + Case Management: `cci flow run caseman_org_namespaced --org caseman_namespaced`
- PMDM + NPSP + Case Management: `cci flow run caseman_org --org caseman_npsp`
- PMDM namespaced + NPSP + Case Management: `cci flow run caseman_org_namespaced --org caseman_npsp_namespaced`