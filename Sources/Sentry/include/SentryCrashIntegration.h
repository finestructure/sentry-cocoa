#import "SentryBaseIntegration.h"
#import "SentryDefines.h"
#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class SentryScope, SentryCrashWrapper;

static NSString *const SentryDeviceContextFreeMemoryKey = @"free_memory";
static NSString *const SentryDeviceContextAppMemoryKey = @"app_memory";

@interface SentryCrashIntegration : SentryBaseIntegration

SENTRY_NO_INIT

+ (void)enrichScope:(SentryScope *)scope crashWrapper:(SentryCrashWrapper *)crashWrapper;

/**
 * Needed for testing.
 */
+ (void)sendAllSentryCrashReports;

@end

NS_ASSUME_NONNULL_END
