/********* BaiduMobStatistics.m Cordova Plugin Implementation *******/

#import <Cordova/CDV.h>
#import "BaiduMobStat.h"

@interface CDVBaiduMobStatistics : CDVPlugin {
  // Member variables go here.
    NSString* APP_ID;
}

- (void)onPageStart:(CDVInvokedUrlCommand*)command;
@end

@implementation CDVBaiduMobStatistics

- (void)pluginInitialize {
    [self.commandDelegate runInBackground:^{
        CDVViewController *viewController = (CDVViewController *)self.viewController;
        APP_ID = [viewController.settings objectForKey:@"appid"];
        [self initBaiduMobStat];
    }];
}

- (void)initBaiduMobStat {
    [[BaiduMobStat defaultStat] startWithAppId:APP_ID];
    [[BaiduMobStat defaultStat] setEnableDebugOn:YES];
}

- (void)onPageStart:(CDVInvokedUrlCommand*)command
{
    [self.commandDelegate runInBackground:^{
        CDVPluginResult* result= nil;
        NSArray* args=command.arguments;
        
        if (args.count != 1) {
            result = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"please pass page name"];
        }
        else {
            [[BaiduMobStat defaultStat] pageviewStartWithName:[command argumentAtIndex:0]];
            result = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
        }
        
        [self.commandDelegate sendPluginResult:result callbackId:command.callbackId];
    }];
}

- (void)onPageEnd:(CDVInvokedUrlCommand *)command {
    [self.commandDelegate runInBackground:^{
        CDVPluginResult* result= nil;
        NSArray* args=command.arguments;
        
        if (args.count != 1) {
            result = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"please pass page name"];
        }
        else {
            [[BaiduMobStat defaultStat] pageviewEndWithName:[command argumentAtIndex:0]];
            result = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
        }
        [self.commandDelegate sendPluginResult:result callbackId:command.callbackId];
    }];
}

-(void)onEvent:(CDVInvokedUrlCommand *)command {
    CDVPluginResult* result= nil;
    NSArray* args=command.arguments;
    
    if (args.count != 2) {
        result = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"please pass event and label"];
    }
    else {
        [[BaiduMobStat defaultStat] logEvent:[command argumentAtIndex:0] eventLabel:[command argumentAtIndex:1]];
        result = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
    }
    
    [self.commandDelegate sendPluginResult:result callbackId:command.callbackId];
}

-(void)onEventWithAttributes:(CDVInvokedUrlCommand*)command {
    CDVPluginResult* result= nil;
    NSArray* args=command.arguments;
    
    if (args.count != 3) {
        result = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"please pass event and label with attributes"];
    }
    else {
        [[BaiduMobStat defaultStat] logEvent:[command argumentAtIndex:0] eventLabel:[command argumentAtIndex:1] attributes:[command argumentAtIndex:2]];
        result = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
    }
    
    [self.commandDelegate sendPluginResult:result callbackId:command.callbackId];
}

-(void)onEventDuration:(CDVInvokedUrlCommand *)command {
    CDVPluginResult* result= nil;
    NSArray* args=command.arguments;
    
    if (args.count != 3) {
        result = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"please pass event, label and duration"];
    }
    else {
        [[BaiduMobStat defaultStat] logEventWithDurationTime:[command argumentAtIndex:0] eventLabel:[command argumentAtIndex:1] durationTime:(unsigned long)[command argumentAtIndex:2 withDefault:0]];
        result = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
    }
    
    [self.commandDelegate sendPluginResult:result callbackId:command.callbackId];
    
}

-(void)onEventDurationWithAttributes:(CDVInvokedUrlCommand *)command {
    CDVPluginResult* result= nil;
    NSArray* args=command.arguments;
    
    if (args.count != 4) {
        result = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"please pass event, label and duration with attributes"];
    }
    else {
        [[BaiduMobStat defaultStat] logEventWithDurationTime:[command argumentAtIndex:0] eventLabel:[command argumentAtIndex:1] durationTime:(unsigned long)[command argumentAtIndex:2 withDefault:0] attributes:[command argumentAtIndex:3]];
        result = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
    }
    
    [self.commandDelegate sendPluginResult:result callbackId:command.callbackId];
}

-(void)onEventStart:(CDVInvokedUrlCommand *)command {
    CDVPluginResult* result= nil;
    NSArray* args=command.arguments;
    
    if (args.count != 2) {
        result = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"please pass event and label"];
    }
    else {
        [[BaiduMobStat defaultStat] eventStart:[command argumentAtIndex:0] eventLabel:[command argumentAtIndex:1]];
        result = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
    }
    
    [self.commandDelegate sendPluginResult:result callbackId:command.callbackId];
    
}


-(void)onEventEnd:(CDVInvokedUrlCommand *)command {
    CDVPluginResult* result= nil;
    NSArray* args=command.arguments;
    
    if (args.count != 2) {
        result = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"please pass event and label"];
    }
    else {
        [[BaiduMobStat defaultStat] eventEnd:[command argumentAtIndex:0] eventLabel:[command argumentAtIndex:1]];
        result = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
    }
    [self.commandDelegate sendPluginResult:result callbackId:command.callbackId];
}


-(void)onEventEndWithAttributes:(CDVInvokedUrlCommand *)command {
    CDVPluginResult* result= nil;
    NSArray* args=command.arguments;
    
    if (args.count != 3) {
        result = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"please pass event and label with attributes"];
    }
    else {
        [[BaiduMobStat defaultStat] eventEnd:[command argumentAtIndex:0] eventLabel:[command argumentAtIndex:1] attributes:[command argumentAtIndex:2]];
        result = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
    }
    [self.commandDelegate sendPluginResult:result callbackId:command.callbackId];
}

@end
