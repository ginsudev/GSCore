//
//  UIDevice.h
//  GSCore
//
//  Created by Noah Little on 15/8/2026.
//

#ifndef UIDevice_h
#define UIDevice_h

#import <UIKit/UIKit.h>

@interface UIDevice (GSCore)
+ (BOOL)_hasHomeButton;
+ (BOOL)currentIsIPad;
@end

#endif /* UIDevice_h */
