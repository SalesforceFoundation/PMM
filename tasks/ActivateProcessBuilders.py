from cumulusci.tasks.salesforce import BaseSalesforceApiTask
import json

class activateProcessBuilderProcesses(BaseSalesforceApiTask):
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

            #print(allflows["LatestVersion"]["VersionNumber"])
            #try:
            #response = self.sf.restful(
                #path, 
                #method="PATCH",
                #json=data
            #)
            #self.logger.info()
            #except:       
                #print('Error')