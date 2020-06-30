**To add a new unpackaged metadata bundle...**

1. Create a new folder for the bundle under `unpackaged/post` (e.g., `reports/` for shipping unpackaged reports).
2. Place all the metadata files you want to ship in this bundle under that folder.
   - Metadata files must be in their metadata api naming format and metadata api folder structure. The `npsp` repo is a good example since it is still in metadata api format. For example, report files' suffixes are simply `.report`, and they must live in a `reports/` subdirectory.
   - These files must have `%%%NAMESPACE%%%` tokens prepending any references to custom packaged metadata from the repo's package. Note that Record Type references need namespace tokens, but aren't easily found with a `__c` search.
3. Construct and place a `package.xml` file in the bundle folder that will gather up all your metadata files.
4. In `cumulusci.yml`, find the `deploy_post` task definition (near or at the end of the file) and add a new entry in the `ui_options` section. See the `reports:` entry below as an example. The name of the `ui_options` entry must match the folder name under `unpackaged/post` (e.g., `reports`). Give the step a name that describes what your bundle contains.
```
            4:
                task: deploy_post
                ui_options:
                    reports:
                        name: "Deploy Folder of Unmanaged Reports"
```
5. Ask the team's embedded release engineer to set up a staging installer to test that the new deploy_post step appears correctly.