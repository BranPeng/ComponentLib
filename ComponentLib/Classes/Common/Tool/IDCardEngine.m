//
//  IDCardEngine.m
//  SamsNowiOS
//
//  Created by Yuqi Zhang on 8/15/18.
//  Copyright © 2018 Binfeng Peng - Vendor. All rights reserved.
//

#import "IDCardEngine.h"
@interface IDCardEngine() {
    YMIDCardEngine *_engine;
}
@end
@implementation IDCardEngine

static IDCardEngine *sharedInstance = nil;
+ (IDCardEngine *)sharedManager {
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        sharedInstance = [[self alloc] init];
    });
    
    return sharedInstance;
}

-(instancetype)init {
    self = [super init];
    if (self) {
        _engine = [[YMIDCardEngine alloc] init];
    }
    return self;
}

-(YMIDCardEngine *)engine {
    return _engine;
}

@end
