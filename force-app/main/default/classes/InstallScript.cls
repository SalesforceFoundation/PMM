/*
 *
 *  * Copyright (c) 2020, salesforce.com, inc.
 *  * All rights reserved.
 *  * SPDX-License-Identifier: BSD-3-Clause
 *  * For full license text, see the LICENSE file in the repo root or https://opensource.org/licenses/BSD-3-Clause
 *
 */

public without sharing class InstallScript implements InstallHandler {
    private static final String EMAIL_REPLY_TO = 'donotreply@salesforce.org';
    private static final String EMAIL_SUBJECT = 'PMM Install Errors';
    private static final String EMAIL_SENDER = 'PMM Install Script';
    private static final String EMAIL_MESSAGE = 'Org ID {0} encountered this error: {1}';
    private InstallContext context;
    @TestVisible
    private String emailTo = 'pmdm-errors@salesforce.com';

    @TestVisible
    private TelemetryService telemetryService {
        get {
            if (telemetryService == null) {
                telemetryService = new TelemetryService();
            }

            return telemetryService;
        }
        set;
    }

    public void onInstall(InstallContext context) {
        this.context = context;

        if (!isUpgrade()) {
            return;
        }

        sendUsageMetrics();
    }

    private Boolean isUpgrade() {
        return context.isUpgrade() || context.isPush();
    }

    @TestVisible
    private void sendUsageMetrics() {
        try {
            telemetryService.sendUsageMetrics();
        } catch (Exception ex) {
            // Email error and allow the install to continue.
            sendError(
                String.format(
                    EMAIL_MESSAGE,
                    new List<String>{ context.organizationId(), ex.getMessage() }
                )
            );
        }
    }

    private void sendError(String message) {
        try {
            Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();

            mail.setUseSignature(false);
            mail.setReplyTo(EMAIL_REPLY_TO);
            mail.setSenderDisplayName(EMAIL_SENDER);
            mail.setSubject(EMAIL_SUBJECT);
            mail.setToAddresses(new List<String>{ emailTo });
            mail.setPlainTextBody(message);

            Messaging.sendEmail(new List<Messaging.SingleEmailMessage>{ mail });
        } catch (Exception ex) {
            // We do not want to block install when the email cannot be sent, allow the install to continue.
        }
    }
}
