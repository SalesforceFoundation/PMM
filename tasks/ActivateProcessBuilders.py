from cumulusci.tasks.salesforce import BaseSalesforceApiTask

class ActivateProcessBuilderProcesses(BaseSalesforceApiTask):
    def _run_task(self):
        res = self.tooling.query("SELECT Id,ActiveVersion.VersionNumber,LatestVersion.VersionNumber,DeveloperName FROM FlowDefinition") 

        for allflows in res['records']:
            path = "tooling/sobjects/FlowDefinition/{0}".format(allflows["Id"])
            urlpath = self.sf.base_url + path
            data = {"Metadata": 
                        {
                            "activeVersionNumber": allflows["LatestVersion"]["VersionNumber"]
                        }
                    }

            response = self.tooling._call_salesforce(
                "PATCH", 
                urlpath, 
                json = data
            )