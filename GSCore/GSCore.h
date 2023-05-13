//
//  GSCore.h
//  GSCore
//
//  Created by Noah Little on 16/4/2023.
//

#ifndef GSCore_h
#define GSCore_h

#import <UIKit/UIKit.h>

@interface UIDevice (GSCore)
+ (BOOL)_hasHomeButton;
+ (BOOL)currentIsIPad;
@end

#endif /* GSCore_h */
