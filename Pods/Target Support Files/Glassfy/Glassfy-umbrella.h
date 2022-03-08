#ifdef __OBJC__
#import <UIKit/UIKit.h>
#else
#ifndef FOUNDATION_EXPORT
#if defined(__cplusplus)
#define FOUNDATION_EXPORT extern "C"
#else
#define FOUNDATION_EXPORT extern
#endif
#endif
#endif

#import "Glassfy.h"
#import "GYError.h"
#import "GYOffering.h"
#import "GYOfferings.h"
#import "GYPermission.h"
#import "GYPermissions.h"
#import "GYPurchaseDelegate.h"
#import "GYSku.h"
#import "GYTransaction.h"
#import "GYTypes.h"
#import "GYUserProperties.h"

FOUNDATION_EXPORT double GlassfyVersionNumber;
FOUNDATION_EXPORT const unsigned char GlassfyVersionString[];

