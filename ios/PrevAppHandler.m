// PrevAppHandler.m

#import "PrevAppHandler.h"

inline BOOL jumpBackToPreviousApp() {
    Ivar sysNavIvar = class_getInstanceVariable(UIApplication.class, "_systemNavigationAction");
    UIApplication* app = UIApplication.sharedApplication;
    UISystemNavigationAction* action = object_getIvar(app, sysNavIvar);
    if (!action) {
        return NO;
    }
    NSUInteger destination = action.destinations.firstObject.unsignedIntegerValue;
    return [action sendResponseForDestination:destination];
}


@implementation PrevAppHandler

RCT_EXPORT_MODULE()

RCT_EXPORT_METHOD(sampleMethod:(NSString *)stringArgument numberParameter:(nonnull NSNumber *)numberArgument callback:(RCTResponseSenderBlock)callback)
{
    // TODO: Implement some actually useful functionality
    NSBool response = [BOOL jumpBackToPreviousApp];
    callback(response);
}

@end