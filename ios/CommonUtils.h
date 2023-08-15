
#ifdef RCT_NEW_ARCH_ENABLED
#import "RNCommonUtilsSpec.h"

@interface CommonUtils : NSObject <NativeCommonUtilsSpec>
#else
#import <React/RCTBridgeModule.h>

@interface CommonUtils : NSObject <RCTBridgeModule>
#endif

@end
