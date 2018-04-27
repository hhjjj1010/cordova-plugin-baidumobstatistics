### 前言：
百度移动统计官方有提供cordova插件，以及插件的使用Demo，具体请参看百度移动统计的开发文档。
官方提供的插件功能齐全，但是封装得还不够傻瓜化。插件安装之后还需要修改原生的一些文件才能使用，这对不懂原生的cordova和ionic developer来说是很不友好的。
该插件是基于官方提供的插件修改而来，开发者只需通过命令行安装即可使用。
###### ps: 该插件只支持基础分析

### 支持平台
#### iOS
iOS SDK v4.7.2

#### Android
Android SDK使用的是gradle上的最新版本，目前为v3.9.0.1。
因为使用了gradle上最新版本的原因，所以每次同步的时间会相对长一点，使用android studio打包apk的时候就会有最直观的感受。

### 安装
###### 在线安装
    cordova plugin add cordova-plugin-baidumobstatistics --variable IOSAPPID=[your iOS AppKey] --variable ANDROIDAPPID=[your Android AppKey]

    cordova plugin add https://github.com/hhjjj1010/cordova-plugin-baidumobstatistics.git --variable IOSAPPID=[your iOS AppKey] --variable ANDROIDAPPID=[your Android AppKey]

###### 本地安装
下载插件到本地

    cordova plugin add /your/local/path --variable IOSAPPID=[your iOS AppKey] --variable ANDROIDAPPID=[your Android AppKey]

### API
cordova.plugins.BaiduMobStatistics.onPageStart(pageName, successFn, errorFn)

cordova.plugins.BaiduMobStatistics.onPageEnd(pageName, successFn, errorFn)

cordova.plugins.BaiduMobStatistics.onEvent(eventId, eventLabel, successFn, errorFn)

cordova.plugins.BaiduMobStatistics.onEventWithAttributes(eventId, eventLabel, attributes, successFn, errorFn)

cordova.plugins.BaiduMobStatistics.onEventDuration(eventId, eventLabel, duration, successFn, errorFn)

cordova.plugins.BaiduMobStatistics.onEventDurationWithAttributes(eventId, eventLabel, duration, attributes, successFn, errorFn)

cordova.plugins.BaiduMobStatistics.onEventStart(eventId, eventLabel, successFn, errorFn) 

cordova.plugins.BaiduMobStatistics.onEventEnd(eventId, eventLabel, successFn, errorFn)

cordova.plugins.BaiduMobStatistics.onEventEndWithAttributes(eventId, eventLabel, attributes, successFn, errorFn)

### 使用示范
最简单的页面路径分析，在app.js里面添加$stateChangeStart监听即可实现

    $rootScope.$on('$stateChangeStart',  function (event, toState, toParams, fromState, fromParams) {
          cordova.plugins.BaiduMobStatistics.onPageStart(toPageName);
          cordova.plugins.BaiduMobStatistics.onPageEnd(fromPageName)；
    });
