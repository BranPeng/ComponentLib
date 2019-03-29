//
//  NSObject+Helper.h
//  sng
//
//  Created by Matthew Loflin - Vendor on 11/9/17.
//  Copyright © 2017 Wal-mart Stores, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (Helper)
- (nullable NSString *)localizedTextWithKey:(nonnull NSString *)key value:(nonnull NSString *)value;
@end
