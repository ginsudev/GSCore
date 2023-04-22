//
//  _SBIconController.m
//  GSCore
//
//  Created by Noah Little on 22/4/2023.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>
#include "SBIconController.h"

#pragma clang diagnostic ignored "-Wincomplete-implementation"
@implementation _SBIconController

+ (instancetype)sharedInstanceIfExists {
    return [objc_getClass("SBIconController") sharedInstanceIfExists];
}

@end

@implementation _SBIconModel

- (instancetype)init {
    return [[objc_getClass("SBIconModel") alloc] init];
}

@end

@implementation _SBIcon

- (instancetype)init {
    return [[objc_getClass("SBIcon") alloc] init];
}

@end
