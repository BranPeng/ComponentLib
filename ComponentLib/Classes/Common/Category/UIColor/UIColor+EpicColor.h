//
//  UIColor+EpicColor.h
//  EpicSnG-ios
//
//  Created by Chuanyong Jiang - Vendor on 2018/7/23.
//  Copyright © 2018年 Chuanyong Jiang - Vendor. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (EpicColor)

+ (UIColor *)colorWithRGBHex:(UInt32)hex;

+ (UIColor *)colorWithHexString:(NSString *)color;

//从十六进制字符串获取颜色，
//color:支持@“#123456”、 @“0X123456”、 @“123456”三种格式
+ (UIColor *)colorWithHexString:(NSString *)color alpha:(CGFloat)alpha;



@end
