//
//  NSDictionary+JSON.h
//  SamsNowiOS
//
//  Created by Binfeng Peng - Vendor on 2018/8/1.
//  Copyright © 2018 Binfeng Peng - Vendor. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (JSON)

/**
 *  转换成JSON串字符串（没有可读性）
 *
 *  @return JSON字符串
 */
- (NSString *)toJSONString;

/**
 *  转换成JSON串字符串（有可读性）
 *
 *  @return JSON字符串
 */
- (NSString *)toReadableJSONString;

/**
 *  转换成JSON数据
 *
 *  @return JSON数据
 */
- (NSData *)toJSONData;

/**
 *  读取本地JSON文件
 *
 *  @return 字典对象
 */
+ (NSDictionary *)readLocalFileWithName:(NSString *)name;

@end
