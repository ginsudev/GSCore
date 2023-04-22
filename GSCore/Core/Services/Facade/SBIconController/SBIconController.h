//
//  SBIconController.h
//  GSCore
//
//  Created by Noah Little on 22/4/2023.
//

#ifndef SBIconController_h
#define SBIconController_h

#import <UIKit/UIKit.h>

struct SBIconImageInfo {
    struct CGSize size;
    double scale;
    double continuousCornerRadius;
};

// MARK: - Underlying

@interface SBIcon : NSObject
@end

@interface SBIconModel : NSObject
@end

@interface SBIconController : NSObject
@end

// MARK: - Facade

@interface _SBIcon : NSObject
- (UIImage *)generateIconImageWithInfo:(struct SBIconImageInfo)arg1;
@end

@interface _SBIconModel : NSObject
- (_SBIcon *)expectedIconForDisplayIdentifier:(id)arg1;
@end

@interface _SBIconController : NSObject
@property (nonatomic,retain) _SBIconModel * model;
+ (instancetype)sharedInstanceIfExists;
@end

#endif /* SBIconController_h */
