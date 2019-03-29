//
//  IDCardEngine.h
//  SamsNowiOS
//
//  Created by Yuqi Zhang on 8/15/18.
//  Copyright © 2018 Binfeng Peng - Vendor. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YMIDCardEngine.h"

@interface IDCardEngine : NSObject
@property(strong, nonatomic, readonly) YMIDCardEngine *engine;
@property (assign, nonatomic) NSInteger scanType;
+ (IDCardEngine *)sharedManager;
@end
