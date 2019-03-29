//
//  NSString+Validation.m
//  sng
//
//  Created by Matthew Loflin - Vendor on 1/10/18.
//  Copyright © 2018 Wal-mart Stores, Inc. All rights reserved.
//

#import "NSString+Validation.h"

@implementation NSString (Validation)

+ (BOOL)isBlank:(nullable NSString *)string
{
    if (![string isKindOfClass:[NSString class]]) {
        return YES;
    }
    
    NSString *trimmedString = [string stringByTrimmingCharactersInSet:NSCharacterSet.whitespaceAndNewlineCharacterSet];
    return (trimmedString == nil) || (trimmedString.length == 0);
}

+ (BOOL)isAlphanumeric:(nullable NSString *)string {
    
    static dispatch_once_t onceToken;
    static NSMutableCharacterSet *blockedCharacters;
    dispatch_once(&onceToken, ^{
        blockedCharacters = [NSMutableCharacterSet alphanumericCharacterSet];
        [blockedCharacters addCharactersInString:@" '.-"];
        blockedCharacters = (NSMutableCharacterSet *)[blockedCharacters invertedSet];
    });
    
    return (string != nil && [string rangeOfCharacterFromSet:blockedCharacters].location == NSNotFound);
}

+ (BOOL)isAlphabetic:(nullable NSString *)string {
    
    static dispatch_once_t onceToken;
    static NSMutableCharacterSet *blockedCharacters;
    dispatch_once(&onceToken, ^{
        blockedCharacters = [NSMutableCharacterSet letterCharacterSet];
        [blockedCharacters addCharactersInString:@" '.-"];
        blockedCharacters = (NSMutableCharacterSet *)[blockedCharacters invertedSet];
    });
    
    return (string != nil && [string rangeOfCharacterFromSet:blockedCharacters].location == NSNotFound);
}

#pragma mark 判断邮箱

+ (BOOL)checkEmail:(NSString *)email{
    
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    
    BOOL validEmail = [emailTest evaluateWithObject:email];
    
    if (validEmail) {
        NSArray *mailComponents = [email componentsSeparatedByString:@"@"];
        NSString *localPart = [mailComponents firstObject];
        NSString *domainPart = [mailComponents lastObject];
        
        if (localPart.length > 64 || domainPart.length > 255) {
            return NO;
        } else {
            return YES;
        }
    } else {
        return NO;
    }
}

+ (void)checkPassword:(NSString *)password
{
    
}

+ (EPIC_String_Type)checkString:(NSString *)password
{
    NSInteger alength = [password length];
    BOOL contain = [NSString isStringContainSpecialWith:password];
    if (contain) {
        return EPIC_String_Special_Letter;
    }
    
    for (int i = 0; i<alength; i++) {
        char commitChar = [password characterAtIndex:i];
        NSString *temp = [password substringWithRange:NSMakeRange(i,1)];
        const char *u8Temp = [temp UTF8String];
        if (3==strlen(u8Temp)){
            
            NSLog(@"字符串中含有中文");
            return EPIC_String_Chinese_Letter;
        }else if((commitChar>64)&&(commitChar<91)){
            
            NSLog(@"字符串中含有大写英文字母");
            return EPIC_String_Upper_Letter;
        }else if((commitChar>96)&&(commitChar<123)){
            
            NSLog(@"字符串中含有小写英文字母");
            return EPIC_String_Lower_Letter;
        }else if((commitChar>47)&&(commitChar<58)){
            
            NSLog(@"字符串中含有数字");
            return EPIC_String_Number_Letter;
        }else{
            
            NSLog(@"字符串中含有非法字符");
            return EPIC_String_Special_Letter;
        }
    }
    
    return -1;
}

+ (BOOL)isStringContainSpecialWith:(NSString *)passWord {
    
    NSArray *array1 = [NSArray arrayWithObjects:passWord,nil];
    //查询出包含e这个字符的字符串
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF CONTAINS[cd] '@' "];
    NSArray *temp = [array1 filteredArrayUsingPredicate:predicate];
    NSPredicate *predicate1 = [NSPredicate predicateWithFormat:@"SELF CONTAINS[cd] '_' "];
    NSArray *temp1 = [array1 filteredArrayUsingPredicate:predicate1];
    NSPredicate *predicate2 = [NSPredicate predicateWithFormat:@"SELF CONTAINS[cd] '-' "];
    NSArray *temp2 = [array1 filteredArrayUsingPredicate:predicate2];
    NSPredicate *predicate3 = [NSPredicate predicateWithFormat:@"SELF CONTAINS[cd] '!' "];
    NSArray *temp3 = [array1 filteredArrayUsingPredicate:predicate3];
    NSPredicate *predicate4 = [NSPredicate predicateWithFormat:@"SELF CONTAINS[cd] '!' "];
    NSArray *temp4 = [array1 filteredArrayUsingPredicate:predicate4];
    if (temp.count > 0 || temp1.count > 0 || temp2.count > 0 || temp3.count > 0 || temp4.count > 0) {
        return YES;
    }
    return NO;
}

//直接调用这个方法就行

+(int)checkIsHaveNumAndLetter:(NSString*)password{
    
    //数字条件
    
    NSRegularExpression *tNumRegularExpression = [NSRegularExpression regularExpressionWithPattern:@"[0-9]" options:NSRegularExpressionCaseInsensitive error:nil];
    
    
    
    //符合数字条件的有几个字节
    
    NSUInteger tNumMatchCount = [tNumRegularExpression numberOfMatchesInString:password
                                 
                                                                       options:NSMatchingReportProgress
                                 
                                                                         range:NSMakeRange(0, password.length)];
    
    
    
    //英文字条件
    
    NSRegularExpression *tLetterRegularExpression = [NSRegularExpression regularExpressionWithPattern:@"[A-Za-z]" options:NSRegularExpressionCaseInsensitive error:nil];
    
    
    
    //符合英文字条件的有几个字节
    
    NSUInteger tLetterMatchCount = [tLetterRegularExpression numberOfMatchesInString:password options:NSMatchingReportProgress range:NSMakeRange(0, password.length)];
    
    
    
    if (tNumMatchCount == password.length) {
        
        //全部符合数字，表示沒有英文
        
        return 1;
        
    } else if (tLetterMatchCount == password.length) {
        
        //全部符合英文，表示沒有数字
        
        return 2;
        
    } else if (tNumMatchCount + tLetterMatchCount == password.length) {
        
        //符合英文和符合数字条件的相加等于密码长度
        
        return 3;
        
    } else {
        
        return 4;
        
        //可能包含标点符号的情況，或是包含非英文的文字，这里再依照需求详细判断想呈现的错误
        
    }
    
    
    
}

@end
