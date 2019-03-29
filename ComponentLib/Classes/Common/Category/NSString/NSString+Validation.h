//
//  NSString+Validation.h
//  sng
//
//  Created by Matthew Loflin - Vendor on 1/10/18.
//  Copyright © 2018 Wal-mart Stores, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

/*!
 @enum
 @brief    字符串是否包含 大小写英文字母、中文、数字、特殊字符
 @constant EPIC_String_Lower_Letter        小写英文字母
 @constant EPIC_String_Upper_Letter        大写英文字母
 @constant EPIC_String_Number_Letter       中文
 @constant EPIC_String_Special_Letter      数字
 @constant EPIC_String_Chinese_Letter      特殊字符
 */
typedef enum{
    EPIC_String_Lower_Letter = 1,
    EPIC_String_Upper_Letter = 2,
    EPIC_String_Number_Letter = 3,
    EPIC_String_Special_Letter = 4,
    EPIC_String_Chinese_Letter = 5,
}EPIC_String_Type;
@interface NSString (Validation)
+ (BOOL)isBlank:(nullable NSString *)string;
+ (BOOL)isAlphanumeric:(nullable NSString *)string;
+ (BOOL)isAlphabetic:(nullable NSString *)string;
/*
 判断邮箱
*/
+ (BOOL)checkEmail:(NSString *)email;
/*
 判断密码
 */
+ (EPIC_String_Type)checkString:(NSString *)password;
+(int)checkIsHaveNumAndLetter:(NSString*)password;
@end
