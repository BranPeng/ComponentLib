//
//  NSObject+Helper.m
//  sng
//
//  Created by Matthew Loflin - Vendor on 11/9/17.
//  Copyright © 2017 Wal-mart Stores, Inc. All rights reserved.
//

#import "NSObject+Helper.h"

@implementation NSObject (Helper)

#pragma mark - Localization

- (nullable NSString *)localizedTextWithKey:(nonnull NSString *)key value:(nonnull NSString *)value
{
    NSBundle * bundle = [NSBundle bundleForClass:self.class];
    return NSLocalizedStringWithDefaultValue(key, nil, bundle, value, value);
}

@end
