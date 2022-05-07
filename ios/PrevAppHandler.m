// PrevAppHandler.m

#import "PrevAppHandler.h"
@import UIKit;
@import ObjectiveC.runtime;

@interface UISystemNavigationAction : NSObject
@property(nonatomic, readonly, nonnull) NSArray<NSNumber*>* destinations;
-(BOOL)sendResponseForDestination:(NSUInteger)destination;
@end

@implementation PrevAppHandler

RCT_EXPORT_MODULE()

RCT_EXPORT_METHOD(minimize:(RCTPromiseResolveBlock)resolve:(RCTPromiseRejectBlock)reject)
{
    Ivar sysNavIvar = class_getInstanceVariable(UIApplication.class, "_systemNavigationAction");
    UIApplication* app = UIApplication.sharedApplication;
    UISystemNavigationAction* action = object_getIvar(app, sysNavIvar);
    if (!action) {
        reject(@"error", @"Navigation error", nil);
        return;
    }
    NSUInteger destination = action.destinations.firstObject.unsignedIntegerValue;
    [action sendResponseForDestination:destination];
    resolve(@"Navigation completed successfully!");
}

@end
