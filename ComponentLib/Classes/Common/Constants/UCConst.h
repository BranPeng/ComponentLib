//
//  UCConst.h
//  SamsNowiOS
//
//  Created by Binfeng Peng - Vendor on 2018/7/29.
//  Copyright © 2018 Binfeng Peng - Vendor. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#pragma mark 使用的文本 -- Account

#pragma mark 登陆页面
// sign页面 -- newUser
extern NSString * const LoginChoiceMessages_newUser;

// sign页面 -- hasGuest
extern NSString * const LoginChoiceMessages_hasGuest;

// sign页面 -- hasDotcom
extern NSString * const LoginChoiceMessages_hasDotcom;

// sign页面 -- hasGuestAndDotcom
extern NSString * const LoginChoiceMessages_hasGuestAndDotcom;

// sign页面 -- disabled
extern NSString * const LoginChoiceMessages_disabled;

// sign页面 -- sign in
extern NSString * const Login_signIn;

//sign页面 -- Become our member
extern NSString * const Login_becomeMember;

//sign页面 -- Continue without signing in
extern NSString * const Login_continue;

//sign页面 -- Sign in to your Sam's Club account
extern NSString * const Login_club;

// sign页面 -- Forgot Password
extern NSString * const Login_forgot;

// sign页面 -- Already a Member, but new to Sam's Club apps?
extern NSString * const Login_already_member;

// sign页面 -- Create your account
extern NSString * const Login_create_account;

// sign页面 -- Questions? Call us 1.888.746.7726
extern NSString * const Login_questions;

#pragma mark 创建account页面
// CreateAccount页面 -- newUser
extern NSString * const textCreateAccountMessages_newUser;

// CreateAccount页面 -- hasGuest
extern NSString * const textCreateAccountMessages_hasGuest;

// CreateAccount页面 -- menuReceipts
extern NSString * const textCreateAccountMessages_menuReceipts;

// CreateAccount页面 -- menuPayments
extern NSString * const textCreateAccountMessages_menuPayments;


extern NSString * const ScannerViewControllerTroubleScanningTitle;
extern NSString * const ScannerViewControllerLookupItemBtnTitle;
extern NSString * const ScannerViewControllerMembershipNumberInstead;
//rgb颜色
extern UIColor * ColorWithRGBA(CGFloat red,CGFloat green,CGFloat blue);
extern UIColor * ColorWithRGBWithA(CGFloat red,CGFloat green,CGFloat blue,CGFloat a);

extern NSDictionary * getSysInfo(void);

#pragma mark forgotpassword页面
// ForgotPassword页面 -- enterAccount
extern NSString * const textForgotPasswordMessages_enterAccount;

// ForgotPassword页面 -- signIn

extern NSString * const textForgotPasswordMessages_signIn;
extern NSString * const textForgotEmailMessages_signIn;



//是否第一次启动
extern NSString * const noFirstBoot;

// savingsShowHintText
extern NSString * const savingsShowHintText;
// featuredShowHintText
extern NSString * const featuredShowHintText;
// searchShowHintText
extern NSString * const searchShowHintText;
// upShoppingListShowHintText
extern NSString * const upShoppingListShowHintText;
// middleShoppingListShowHintText
extern NSString * const middleShoppingListShowHintText;
// downShoppingListShowHintText
extern NSString * const downShoppingListShowHintText;

