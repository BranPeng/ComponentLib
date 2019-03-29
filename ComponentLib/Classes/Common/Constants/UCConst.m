//
//  UCConst.m
//  SamsNowiOS
//
//  Created by Binfeng Peng - Vendor on 2018/7/29.
//  Copyright © 2018 Binfeng Peng - Vendor. All rights reserved.
//
#import "UCConst.h"

#pragma mark forgotpassword页面
// ForgotPassword页面 -- enterAccount
NSString * const textForgotPasswordMessages_enterAccount = @"Enter the email associated with your account";

// ForgotPassword页面 -- signIn

NSString * const textForgotPasswordMessages_signIn = @"Sign in to your Sam's Club account";
NSString * const textForgotEmailMessages_signIn = @"We found your email address";

NSString * const ScannerViewControllerTroubleScanningTitle = @"Trouble scanning?";
NSString * const ScannerViewControllerLookupItemBtnTitle = @"Look up item";
NSString * const ScannerViewControllerMembershipNumberInstead = @"Type membership number instead";

//RGB颜色

UIColor* ColorWithRGBA(CGFloat red,CGFloat green,CGFloat blue){
    
    return [UIColor colorWithRed:red/255.0f green:green/255.0f blue:blue/255.0f alpha:1.0];
}

UIColor * ColorWithRGBWithA(CGFloat red,CGFloat green,CGFloat blue,CGFloat a)
{
    return [UIColor colorWithRed:red/255.0f green:green/255.0f blue:blue/255.0f alpha:a];
}

NSDictionary * getSysInfo(){
    
    return [[NSBundle mainBundle] infoDictionary];
}
NSString * const noFirstBoot = @"noFirstBoot";
NSString * const savingsShowHintText = @"savingsShowHintText";
NSString * const featuredShowHintText = @"featuredShowHintText";
NSString * const searchShowHintText = @"searchShowHintText";
NSString * const upShoppingListShowHintText = @"upShoppingListShowHintText";
NSString * const middleShoppingListShowHintText = @"middleShoppingListShowHintText";
NSString * const downShoppingListShowHintText = @"downShoppingListShowHintText";


