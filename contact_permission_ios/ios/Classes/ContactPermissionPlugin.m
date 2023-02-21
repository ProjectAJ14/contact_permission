#import "ContactPermissionPlugin.h"

@implementation ContactPermissionPlugin

+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar> *)registrar {
  FlutterMethodChannel *channel =
      [FlutterMethodChannel methodChannelWithName:@"contact_permission_ios"
                                  binaryMessenger:registrar.messenger];
  [channel setMethodCallHandler:^(FlutterMethodCall *call, FlutterResult result) {
    if ([@"getPlatformName" isEqualToString:call.method]) {
      result(@"iOS");
    } else {
      result(FlutterMethodNotImplemented);
    }
  }];
}

@end