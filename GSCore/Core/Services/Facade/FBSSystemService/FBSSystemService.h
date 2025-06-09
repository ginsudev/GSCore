//
//  FBSSystemService.h
//  GSCore
//
//  Created by Noah Little on 18/4/2023.
//

#ifndef FBSSystemService_h
#define FBSSystemService_h

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_OPTIONS(NSUInteger, SBSRelaunchActionOptions) {
    SBSRelaunchActionOptionsNone,
    SBSRelaunchActionOptionsRestartRenderServer = 1 << 0,
    SBSRelaunchActionOptionsSnapshotTransition = 1 << 1,
    SBSRelaunchActionOptionsFadeToBlackTransition = 1 << 2
};

// MARK: - Facade

@interface _SBSRelaunchAction : NSObject
+ (instancetype)actionWithReason:(NSString *)reason options:(SBSRelaunchActionOptions)options targetURL:(nullable NSURL *)url;
@end

@interface _FBSSystemService : NSObject
+ (instancetype)sharedService;
- (void)openApplication:(NSString *)app options:(NSDictionary *)options withResult:(void (^)(void))result;
- (void)sendActions:(NSSet<_SBSRelaunchAction *> *)actions withResult:(nullable /*^block*/id)result;
@end

NS_ASSUME_NONNULL_END

#endif /* FBSystemService_h */
