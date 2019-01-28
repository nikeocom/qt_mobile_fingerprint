#include "qtfingerprint.h"

#import <LocalAuthentication/LocalAuthentication.h>
#import "UIKit/UIKit.h"
#import "Foundation/Foundation.h"

void QtFingerprint::start(const QString &reason)
{
    LAContext *context = [[LAContext alloc] init];
    //Hide "Enter Password" button
    context.localizedFallbackTitle = @"";

    NSError *error = nil;
    if ([context canEvaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics error:&error])
    {
        [context evaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics localizedReason:reason.toNSString() reply:^(BOOL success, NSError *error)
         {
             if (error)
             {
                 switch ([error code])
                 {
                     case kLAErrorTouchIDNotEnrolled://Authentication could not start because Touch ID has no enrolled fingers
                     case kLAErrorTouchIDNotAvailable://"TouchID is not available on the device"
                     {
                         success =  FALSE;
                         emit unsupported();
                         break;
                     }
                     case kLAErrorAuthenticationFailed://"The user failed to provide valid credentials"
                     case kLAErrorInvalidContext://"The context is invalid"
                     case kLAErrorTouchIDLockout://"Too many failed attempts."
                     case kLAErrorPasscodeNotSet://"Passcode is not set on the device" (should not happened)
                     case kLAErrorUserFallback://"The user chose to use the fallback" (should not happened, means user wanna type a passcode)
                     default:
                     {
                         success =  FALSE;
                         NSLog(@"ERROR: %ld", (long)[error code]);
                         emit notauthorized();
                         break;
                     }
                     case kLAErrorAppCancel://"Authentication was cancelled by application"
                     case kLAErrorSystemCancel://"Authentication was cancelled by the system"
                     case kLAErrorUserCancel://"The user did cancel"
                     {
                         success =  FALSE;
                         emit notauthorized();
                         break;
                     }
                 }
             }

             if (success)
             {
                 emit authorized();
             }
         }];

    }
    else
    {
        emit unsupported();
    }
}
