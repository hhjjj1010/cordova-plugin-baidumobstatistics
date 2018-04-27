var exec = require('cordova/exec');

exports.onPageStart = function (pageName, success, error) {
    exec(success, error, "BaiduMobStatistics", "onPageStart", [pageName]);
};

exports.onPageEnd = function (pageName, success, error) {
    exec(success, error, "BaiduMobStatistics", "onPageEnd", [pageName]);
};

exports.onEvent = function (eventId, eventLabel, success, error) {
    exec(success, error, "BaiduMobStatistics", "onEvent", [eventId, eventLabel]);
};

exports.onEventWithAttributes = function (eventId, eventLabel, attributes, success, error) {
    exec(success, error, "BaiduMobStatistics", "onEventWithAttributes", [eventId, eventLabel, attributes]);
};

exports.onEventDuration = function (eventId, eventLabel, duration, success, error) {
    exec(success, error, "BaiduMobStatistics", "onEventDuration", [eventId, eventLabel, duration]);
};

exports.onEventDurationWithAttributes = function (eventId, eventLabel, duration, attributes, success, error) {
    exec(success, error, "BaiduMobStatistics", "onEventDurationWithAttributes", [eventId, eventLabel, duration, attributes]);
};

exports.onEventStart = function (eventId, eventLabel, success, error) {
    exec(success, error, "BaiduMobStatistics", "onEventStart", [eventId, eventLabel]);
};

exports.onEventEnd = function (eventId, eventLabel, success, error) {
    exec(success, error, "BaiduMobStatistics", "onEventEnd", [eventId, eventLabel]);
};

exports.onEventEndWithAttributes = function (eventId, eventLabel, attributes, success, error) {
    exec(success, error, "BaiduMobStatistics", "onEventEndWithAttributes", [eventId, eventLabel, attributes]);
};