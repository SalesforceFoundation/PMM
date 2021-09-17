/*
 *
 *  * Copyright (c) 2021, salesforce.com, inc.
 *  * All rights reserved.
 *  * SPDX-License-Identifier: BSD-3-Clause
 *  * For full license text, see the LICENSE file in the repo root or https://opensource.org/licenses/BSD-3-Clause
 *
 */

public without sharing class CampaignService {
    private List<CampaignMember> stagedCampaignMembers = new List<CampaignMember>();

    public Campaign createCampaign(
        String campaignName,
        Set<String> campaignMemberStatuses
    ) {
        Campaign newCampaign = new Campaign(Name = campaignName);
        insert newCampaign;

        List<CampaignMemberStatus> oldCampaignMemberStatuses = [
            SELECT Id, Label, isDefault, CampaignId
            FROM CampaignMemberStatus
            WHERE CampaignId = :newCampaign.Id
        ];

        List<CampaignMemberStatus> oldCampaignMemberStatusesToDelete = new List<CampaignMemberStatus>();

        if (campaignMemberStatuses != null && !campaignMemberStatuses.isEmpty()) {
            Boolean hasDefault = true;
            for (CampaignMemberStatus oldStatus : oldCampaignMemberStatuses) {
                // if this status from previously existing is duplicated in the new statuses, remove from the list to delete
                if (!campaignMemberStatuses.contains(oldStatus.Label)) {
                    oldCampaignMemberStatusesToDelete.add(oldStatus);
                    if (oldStatus.IsDefault) {
                        hasDefault = false;
                    }
                } else {
                    campaignMemberStatuses.remove(oldStatus.Label);
                }
            }

            List<CampaignMemberStatus> newCampaignMemberStatuses = new List<CampaignMemberStatus>();
            for (String campaignMemberStatusName : campaignMemberStatuses) {
                CampaignMemberStatus cms = new CampaignMemberStatus(
                    CampaignId = newCampaign.Id,
                    Label = campaignMemberStatusName
                );
                if (newCampaignMemberStatuses.isEmpty()) {
                    if (!hasDefault)
                        cms.IsDefault = true;
                    cms.HasResponded = true;
                }
                newCampaignMemberStatuses.add(cms);
            }

            if (!newCampaignMemberStatuses.isEmpty()) {
                insert newCampaignMemberStatuses;
            }

            if (!oldCampaignMemberStatusesToDelete.isEmpty()) {
                delete oldCampaignMemberStatusesToDelete;
            }
        }

        return newCampaign;
    }

    public void stageCampaignMember(
        Contact newMember,
        Campaign targetCampaign,
        String memberStatus
    ) {
        CampaignMember newCampaignMember = new CampaignMember(
            ContactId = newMember.Id,
            CampaignId = targetCampaign.Id,
            Status = memberStatus
        );

        stagedCampaignMembers.add(newCampaignMember);
    }

    public void commitCampaignMembers() {
        insert stagedCampaignMembers;
        stagedCampaignMembers = new List<CampaignMember>();
    }
}
