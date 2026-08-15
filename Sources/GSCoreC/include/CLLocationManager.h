//
//  CLLocationManager.h
//  GSCore
//
//  Created by Noah Little on 15/7/2023.
//

#ifndef CLLocationManager_h
#define CLLocationManager_h

#import <CoreLocation/CoreLocation.h>

@interface CLLocationManager (GSCore)
- (instancetype)initWithEffectiveBundleIdentifier:(NSString *)bundleIdentifier;
@end

#endif /* CLLocationManager_h */
