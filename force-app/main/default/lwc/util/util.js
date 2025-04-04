/*
 *
 *  * Copyright (c) 2020, salesforce.com, inc.
 *  * All rights reserved.
 *  * SPDX-License-Identifier: BSD-3-Clause
 *  * For full license text, see the LICENSE file in the repo root or https://opensource.org/licenses/BSD-3-Clause
 *
 */

import { ShowToastEvent } from "lightning/platformShowToastEvent";
import unknownErrorLabel from "@salesforce/label/c.Util_Unknown_Error";
import errorLabel from "@salesforce/label/c.Util_Error";
import ISCLIENT_FIELD from "@salesforce/schema/Contact.IsClient__c";

/**
 * Returns if value is a string literal or String instance
 * @param {*} value - Anything
 */
const isString = value => {
    return typeof value === "string" || value instanceof String;
};

const debug = (...args) => {
    let title;
    let valuesByName = {};

    if (args.length === 1) {
        valuesByName = args[0];
    } else if (args.length === 2) {
        if (isString(args[0])) {
            title = args[0];
            valuesByName = args[1];
        } else {
            valuesByName = args[0];
            title = args[1];
        }
    }

    let debugs = [];
    if (title) {
        debugs.push("======  " + title + "  =====");
    }
    for (let name in valuesByName) {
        if (Object.prototype.hasOwnProperty.call(valuesByName, name)) {
            debugs.push(`${name}: ${JSON.stringify(valuesByName[name], null, 2)}`);
        }
    }

    // eslint-disable-next-line no-console
    console.log(debugs.join("\n"));
};

const showToast = (title, message, variant, mode = "pester") => {
    const toast = new ShowToastEvent({
        title,
        message,
        variant,
        mode,
    });
    dispatchEvent(toast);
};

/**
 * Returns if value equals undefinied or null
 * @param {*} value - Anything
 */
const isNull = value => {
    return value === undefined || value === null;
};

/**
 * Returns if isNull(value) is true or if value is a string and is empty or all whitespace
 * @param {*} value
 */
const isBlank = value => {
    return isNull(value) || (typeof value === "string" && value.match(/^\s*$/));
};

const isEmpty = obj => {
    return Object.keys(obj).length === 0;
};

/**
 *
 * @param {Array} objects - Array of Objects
 * @param {string} attribute - attribute shared by all objects to sort by
 * @param {string} direction - asc or desc
 * @param {boolean} isNullsLast - If truthy, orders by NULLS LAST using isNull(value)
 */
const sortObjectsByAttribute = (objects, attribute, direction = "desc", isNullsLast) => {
    if (objects && attribute) {
        let aBeforeB, bBeforeA;
        {
            let sortDirectionMultiplier = direction.toLowerCase() === "desc" ? -1 : 1;

            aBeforeB = -1 * sortDirectionMultiplier;
            bBeforeA = 1 * sortDirectionMultiplier;
        }

        const attributes = attribute.split(".");

        return objects.slice().sort((a, b) => {
            if (isNull(a)) {
                if (isNull(b)) {
                    return 0;
                }
                return isNullsLast ? bBeforeA : aBeforeB;
            }
            if (isNull(b)) {
                return isNullsLast ? aBeforeB : bBeforeA;
            }

            attributes.forEach(attr => {
                a = a[attr];
                b = b[attr];
            });

            if (isNull(a)) {
                if (isNull(b)) {
                    return 0;
                }
                return isNullsLast ? bBeforeA : aBeforeB;
            }
            if (isNull(b)) {
                return isNullsLast ? aBeforeB : bBeforeA;
            }
            if (a < b) {
                return aBeforeB;
            }
            if (b < a) {
                return bBeforeA;
            }
            return 0;
        });
    }
    return objects;
};

/**
 * Reduces one or more LDS errors into a string[] of error messages.
 * @param {FetchResponse|FetchResponse[]} errors
 * @return {String[]} Error messages
 */
const reduceErrors = errors => {
    if (!Array.isArray(errors)) {
        errors = [errors];
    }

    return (
        errors
            // Remove null/undefined items
            .filter(error => !!error)
            // Extract an error message
            .map(error => {
                // UI API read errors
                if (Array.isArray(error.body)) {
                    return error.body.map(e => e.message);
                }
                // UI API DML, Apex and network errors
                else if (error.body && typeof error.body.message === "string") {
                    return error.body.message;
                }
                // JS errors
                else if (typeof error.message === "string") {
                    return error.message;
                }
                // Unknown error shape so try HTTP status text
                return error.statusText;
            })
            // Flatten
            .reduce((prev, curr) => prev.concat(curr), [])
            // Remove empty strings
            .filter(message => !!message)
    );
};

const handleError = (error, fireShowToast = true, showToastMode, returnAsArray) => {
    let message = unknownErrorLabel;

    // error.body is the error from apex calls
    // error.detail.output.errors is the error from record-edit-forms
    if (typeof error === "string" || error instanceof String) {
        message = error;
    } else if (error) {
        if (Array.isArray(error.body)) {
            message = error.body.map(e => e.message).join(", ");
        } else if (error.body && typeof error.body.message === "string") {
            message = error.body.message;
        } else if (Array.isArray(error)) {
            // database save result errors
            message = error.map(e => {
                return (e.fields?.length > 0 ? e.fields.join() + ": " : "") + e.message;
            });
            if (!returnAsArray || fireShowToast) {
                message.join("; ");
            }
        } else if (
            error.detail &&
            error.detail.output &&
            (Array.isArray(error.detail.output.errors) || error.detail.output.fieldErrors)
        ) {
            let errors = [];
            // first catch any top-of-page errors
            if (Array.isArray(error.detail.output.errors)) {
                errors = errors.concat(error.detail.output.errors);
            }
            // then also catch any field-level errors
            if (error.detail.output.fieldErrors) {
                // TODO: loop the fields, then loop each field's errors
                Object.values(error.detail.output.fieldErrors).forEach(fieldErrors => {
                    errors = errors.concat(fieldErrors);
                });
            }
            debug({ errors: errors });
            message = errors.map(e => {
                // TODO: add special nicer handling for "errorCode":"DUPLICATE_VALUE"
                // TODO: add special nicer handling for duplicateRecordError; this might be the same as above
                // TODO: consider trigger errors, etc? general exception AND field-level error sd.Name.addError('msg') https://developer.salesforce.com/docs/atlas.en-us.apexcode.meta/apexcode/apex_methods_system_sobject.htm#apex_System_SObject_addError
                return (e.fieldLabel ? e.fieldLabel + ": " : "") + e.message;
            });

            if (!returnAsArray || fireShowToast) {
                message.join("; ");
            }
        }
    }
    debug(
        {
            error: message,
        },
        "handleError"
    );
    if (fireShowToast) {
        showToast(errorLabel, message, "error", showToastMode);
    }

    return message;
};

/**
 * @param string       If replacements is an Array, reference replacements by index,
 *                     e.g. {0}, {1}, similar to Apex's String.format(...).
 *                     Else if replacements is an Object, reference replacements
 *                     via key, e.g. {firstName}.
 * @param replacements Typically, an Array or Object
 */
const format = (string, replacements) => {
    let formattedString = isNull(string) ? "" : string;
    if (replacements) {
        let t = typeof replacements;
        let key;
        let args =
            "string" === t || "number" === t
                ? Array.prototype.slice.call(replacements)
                : replacements;
        for (key in args) {
            if (Object.prototype.hasOwnProperty.call(args, key)) {
                formattedString = formattedString.replace(
                    new RegExp("\\{" + key + "\\}", "gi"),
                    args[key]
                );
            }
        }
    }

    return formattedString;
};

// This is necessary because of namespacing.
const getChildObjectByName = (object, property) => {
    if (object) {
        if (Object.prototype.hasOwnProperty.call(object, property)) {
            return object[property];
        }
        let namespacedProperty = "pmdm__" + property;
        if (Object.prototype.hasOwnProperty.call(object, namespacedProperty)) {
            return object[namespacedProperty];
        }
    }
    return null;
};

const debouncify = (anyFunction, wait) => {
    let timeoutId;

    return (...argsFromLastCall) => {
        window.clearTimeout(timeoutId);

        return new Promise(resolve => {
            // eslint-disable-next-line @lwc/lwc/no-async-operation
            timeoutId = window.setTimeout(() => {
                resolve(anyFunction(...argsFromLastCall));
            }, wait);
        });
    };
};

//This below function can be used to create unique ids when trying to add new rows to a datatable
const createUUID = () => {
    let currentTime = new Date().getTime();
    let uuid = "xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx".replace(/[xy]/g, function(char) {
        let randomNumber = (currentTime + Math.random() * 16) % 16 | 0;
        currentTime = Math.floor(currentTime / 16);
        return (char === "x" ? randomNumber : (randomNumber & 0x3) | 0x8).toString(16);
    });
    return uuid;
};

const prefixNamespace = value => {
    let namespace = ISCLIENT_FIELD.fieldApiName.substring(
        0,
        ISCLIENT_FIELD.fieldApiName.indexOf("IsClient__c")
    );

    return namespace + value;
};

const formatTime = value => {
    let ms = value % 1000;
    value = (value - ms) / 1000;
    let secs = value % 60;
    value = (value - secs) / 60;
    let mins = value % 60;
    let hrs = (value - mins) / 60;
    hrs = hrs < 10 ? "0" + hrs : hrs;
    mins = mins < 10 ? "0" + mins : mins;
    value = hrs + ":" + mins + ":00.000Z";

    return value;
};

export {
    isString,
    showToast,
    isNull,
    isBlank,
    isEmpty,
    sortObjectsByAttribute,
    reduceErrors,
    handleError,
    format,
    debug,
    getChildObjectByName,
    debouncify,
    createUUID,
    prefixNamespace,
    formatTime,
};
