/*
 *
 *  * Copyright (c) 2020, salesforce.com, inc.
 *  * All rights reserved.
 *  * SPDX-License-Identifier: BSD-3-Clause
 *  * For full license text, see the LICENSE file in the repo root or https://opensource.org/licenses/BSD-3-Clause
 *
 */

public inherited sharing class Finder {
    private QueryBuilder queryBuilder;

    public Finder(QueryBuilder queryBuilder) {
        this.queryBuilder = queryBuilder;
    }

    public Integer findCount() {
        if (queryBuilder == null) {
            return null;
        }

        return Database.countQuery(queryBuilder.buildCountQuery());
    }

    public List<SObject> findRecords() {
        if (queryBuilder == null) {
            return null;
        }

        return Database.query(queryBuilder.buildSoqlQuery());
    }
}
