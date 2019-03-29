//
//  EpicGlobalConstants.swift
//  SamsNowiOS
//
//  Created by Jun Wang - Vendor on 2018/7/29.
//  Copyright © 2018年 Binfeng Peng - Vendor. All rights reserved.
//

import UIKit
import ClubDetectionService
import SamsModule

@objc class EpicGlobalConstants: NSObject {
    //
    @objc static let NavgationClubId = "09QT03"
    @objc static let EpicScreenWidth:CGFloat = UIScreen.main.bounds.size.width;
    //
    @objc  static let EpicScreenHeight:CGFloat = UIScreen.main.bounds.size.height;
    
    @objc static let EpicNavAndStatusHeight:CGFloat = navHeight();
    
    @objc static let EpicTabbarHeight:CGFloat = tabbarHeight();
    
    @objc static let EpicNavTitleFont = UIFont.systemFont(ofSize:UIScreen.pxByWidthRatio(value: 17));
    
    @objc static let EpicTabbarContentHeight:CGFloat = EpicGlobalConstants.EpicScreenHeight-EpicGlobalConstants.EpicNavAndStatusHeight-EpicGlobalConstants.EpicTabbarHeight;
    
    @objc static let epicNavContentHeight = EpicGlobalConstants.EpicScreenHeight-EpicGlobalConstants.EpicNavAndStatusHeight;
    
    @objc static let EpicNomalBlackTextColor = ColorWithRGBA(66,66,66)
    
    @objc static let EpicLightBlckTextColor = ColorWithRGBA(107, 107, 107);
    
    @objc static let epicBgBlackColor = ColorWithRGBA(86, 90, 83);
    
    @objc static let epicErrorBgColor = ColorWithRGBWithA(236, 4, 57, 0.1);
    @objc static let EpicNomalFont  = UIFont.systemFont(ofSize: UIScreen.pxByWidthRatio(value: 14));
    
    @objc static let epic12Font = UIFont.systemFont(ofSize: UIScreen.pxByWidthRatio(value: 12));
    @objc static let epic16Font = UIFont.systemFont(ofSize: UIScreen.pxByWidthRatio(value: 16));
    
    @objc static let epic13Font = UIFont.systemFont(ofSize: 13);
    
    @objc static let epic18BoldFont = UIFont.boldSystemFont(ofSize: 18);
    
    @objc static let epic19Font = UIFont.systemFont(ofSize: 19);
    
    @objc static let epic18Font = UIFont.systemFont(ofSize: 18);
    
    @objc static let epicBold14Font = UIFont.boldSystemFont(ofSize: 14);
    
    @objc static let epicBold16Font = UIFont.boldSystemFont(ofSize: 16)
    
    @objc static let epicBold12Fonrt = UIFont.boldSystemFont(ofSize: 12);
    
    @objc static let EpicLightWhite = ColorWithRGBA(248, 248, 248);
    
    @objc static let epicLineColor = ColorWithRGBWithA(66, 66, 66, 0.4);
    
    @objc static let edg = UIScreen.pxBy375Ratio(value: 16);
    
    @objc static let epicGreenColor = ColorWithRGBA(76, 169, 11);
    
    @objc static let black77Color = ColorWithRGBA(77, 77, 77);
    
    @objc static let black77LightColor = ColorWithRGBWithA(77,77,77,0.78);
    
    @objc static let epicRedColor = ColorWithRGBA(236, 6, 57);
    
    @objc static let epicNavColor = ColorWithRGBA(25, 119, 211);
    
    @objc static let epic74TextColor = ColorWithRGBA(74, 74, 74);
    
    @objc static let epic246Color = ColorWithRGBA(246, 246, 246);
    
    @objc static let EpicAccountTurnOn = "Turn on auto-renew";
    
    @objc static let EpicAccountSuccessNoti = "EpicAccountSuccessNoti";
    
    @objc static let EpicTranShoppingListNoti = "EpicTranShoppingListNoti";
    
    @objc static let EpicTranHomeNoti = "EpicTranHomeNoti";
    
    @objc static let EpicSignOutNotification = "EpicSignOutNotification";
    
    @objc static let EpicFogPwdNotification = "EpicFogPwdNotification";
    
    @objc static let epicBold20Font = UIFont.boldSystemFont(ofSize: 20);
    @objc static let epic20Font = UIFont.systemFont(ofSize: 20);
    @objc static let epicAddFont = UIFont.boldSystemFont(ofSize: 24)
    @objc static let RemoveColor = ColorWithRGBA(23, 120, 211);
    @objc static let epicPurchaseHistory = "Purchase history";
    
    @objc static let epicOrderPendingAuditApproval = "Order pending audit approval";
    
    @objc  static let epicPaymentMethods = "Payment methods";
    
    @objc static let epic236RedColor = ColorWithRGBA(236, 4, 57);
    
    @objc static let epicGrayColor = ColorWithRGBWithA(66, 66, 66, 0.8);
    
    @objc static let epicOrangeColor = ColorWithRGBWithA(250, 229, 176, 1.0)
    
    @objc static let epicSetting = "Settings";
    // create your account
    @objc static let tfswuAlert = "Thanks for shopping with us";
    
    @objc static let setupAlert = "Set up your account to check out faster next time";
    
    @objc static let alertPwdAndAccount = "Just enter a password to set up your account";
    
    @objc static let accountAttetion = "Your password must be at least 7 characters and contain at least 1 number and 1 letter";
    
    //    @objc static let ContinueNoSignIn = "ContinueNoSignIn";
    //
    //    @objc static let MembershipNumberGlobal = "membershipNumberGlobal"
    
    @objc static let createStr = "Create";
    
    @objc static let noRightNowStr = "Not right now";
    
    @objc static let forgetPwdStr = "Forgot password";
    
    @objc static let noStoreStr = "We won\'t store this card";
    @objc static let secCryStr = "Secure encrypted connection";
    
    @objc static let utcStr = "Use this card";
    //Rate the app
    @objc static let rateAppTitle = "Any thoughts or comments to share?";
    
    @objc static let addCommStr = "Comments(optional)";
    
    @objc static let aboutThisAppStr = "About this app"
    
    @objc static let giveFeedback = "Give feedback";
    
    @objc static let needHelp = "Help";
    
    @objc static let signOut = "Sign out";
    
    //    @objc static let CreateSuccNotifi = "CreateSuccNotifi"
    
    // Settings
    @objc static let kEnableEmailReceipts = "EnableEmailReceipts"
    @objc static let kDateOfBirth = "DateOfBirth"
    @objc static let kReceiptEmailAddress = "ReceiptEmailAddress"
    
    // Auto sign in
    @objc static let kAutoMembershipSignInMemberInfo = "AutoMembershipSignInMemberInfo"
    @objc static let kAutoSignInMemberInfo = "AutoSignInMemberInfo"
    @objc static let kAuthToken = "AuthToken"
    @objc static let kIsGuestLogIn = "IsGuestLogIn"
    @objc static let kAccountSignedIn = "AccountSignedIn"
    @objc static let kMembershipSignedIn = "MembershipSignedIn"
    
    // Scan
    @objc static let kCameraFirstTime = "cameraFirstTime"
    
    // login 文本
    // sign页面 -- newUser
    @objc static let loginChoiceMessages_newUser = "Sign in to save time when you check out";
    
    // sign页面 -- hasGuest
    @objc static let loginChoiceMessages_hasGuest = "With an account you can check out faster";
    
    // sign页面 -- hasDotcom
    @objc static let loginChoiceMessages_hasDotcom = "Your account already exists";
    
    // sign页面 -- hasGuestAndDotcom
    @objc static let loginChoiceMessages_hasGuestAndDotcom = "Sign in to save time when you check out";
    
    // sign页面 -- disabled
    @objc static let loginChoiceMessages_disabled = "Sign in to Scan and Go";
    
    // sign页面 -- sign in
    @objc static let login_signIn = "Sign in";
    
    //sign页面 -- Become our member
    @objc static let login_becomeMember = "Become our member";
    
    //sign页面 -- Continue without signing in
    @objc static let login_continue = "Continue without signing in";
    
    //sign页面 -- Sign in to your Sam's Club account
    @objc static let login_club = "Sign in to your Sam's Club account";
    
    // sign页面 -- Forgot Password
    @objc static let login_forgot_password = "Forgot password";
    
    // sign页面 -- Forgot Password
    @objc static let login_forgot_email = "Forgot email";
    
    // sign页面 -- Already a Member, but new to Sam's Club apps?
    @objc static let login_already_member = "Already have a membership";
    
    // sign页面 -- Create your account
    @objc static let login_create_account = "Create your account";
    
    // sign页面 -- Questions? Call us 1.888.746.7726
    @objc static let login_questions = "Questions? Call us 1.888.746.7726";
    
    @objc static let EpicNotifCartData = "EpicNotifCartData";
    
    // CreateAccount页面 -- newUser
    @objc static let create_account_messages_newUser = "Set up your account to check out faster next time";
    
    // CreateAccount页面 -- hasGuest
    @objc static let create_account_messages_hasGuest = "Store your preferred cards and checkout faster with an account";
    
    // CreateAccount页面 -- menuReceipts
    @objc static let create_account_messages_menuReceipts = "Create an account to access your Sam's Club receipts";
    @objc static let sign_in_messages_menuReceipts = "Sign in to easily access your receipts";
    
    // CreateAccount页面 -- menuPayments
    @objc static let create_account_messages_menuPayments = "Create an account to easily access your payment methods";
    @objc static let sign_in_messages_menuPayments = "Sign in to add your payment methods"
    
    // CreateAccount -- settings
    @objc static let create_account_messages_menuSettings = "Create an account to give us your feedback"
    @objc static let sign_in_messages_menuSettings = "Sign in to give us your feedback"
    
    
    // login 字体大小
    @objc static let login_button_style1 = UIScreen.pxByWidthRatio(value: 16);
    @objc static let login_button_style2 = UIScreen.pxByWidthRatio(value: 14);
    @objc static let login_label_style1 = UIScreen.pxByWidthRatio(value: 16);
    @objc static let login_label_style2 = UIScreen.pxByWidthRatio(value: 14);
    
    // 通知
    // login页面
    @objc static let login_success = "EpicLoginSuccess";
    
    // navigation页面 -- 添加购物车成功
    @objc static let navigation_addToCart_success = "EpicNavigationAddToCartSuccess";
    
    @objc static let close_gift_view = "EpicCloseGiftView";
    
    // Voice Search
    @objc static let voice_search_start_delay = 5.0
    @objc static let voice_search_after_delay = 0.8
    @objc static let voice_search_single_delay = 0.8
    @objc static var voice_stop_flag = false
    
    // Feedback Navigation Delay
    @objc static let feedback_navigation_delay = 0.5
    
    // Feedback to Homepage Notification Name
    //    @objc static let feedback_Homepage = Notification.Name("feedbackToHomepage")
    // Feedback to Homepage Flag
    @objc static var feedback_should_popup = false
    
    @objc static var feedback_auto_popped = false
    @objc static var signIn_should_popup = false
    
    
    // API
//#if DEBUG // 判断是否在调试环境下
//
//    // Domain
//    @objc static let api_domain = Bundle.main.infoDictionary?["Orchestrator Host"] as! String
//
//    // Membership API Domain
//    @objc static let membership_api_domain = Bundle.main.infoDictionary?["Membership Host"] as! String
//
//    // Image URL
//    @objc static let imageURLPrefix = Bundle.main.infoDictionary?["Image URL"] as! String
//
//    // Restriction description
//    @objc static let firebaseURL = Bundle.main.infoDictionary?["Firebase Domain"] as! String
//    @objc static let restrictionsFireBaseURL = "https://threadstone-4f20f.firebaseio.com/en/clubs/info/\(EpicGlobalConstants.theEpicClubId)/v1/restrictions.json"
//
//    // Search Domain
//    @objc static let search_domain = Bundle.main.infoDictionary?["Search Engine Host"] as! String
//
//    #else
//
//    // Domain
//    @objc static let api_domain = Bundle.main.infoDictionary?["Orchestrator Host"] as! String
//
//    // Membership API Domain
//    @objc static let membership_api_domain = Bundle.main.infoDictionary?["Membership Host"] as! String
//
//    // Image URL
//    @objc static let imageURLPrefix = Bundle.main.infoDictionary?["Image URL"] as! String
//
//    // Restriction description
//    @objc static let firebaseURL = Bundle.main.infoDictionary?["Firebase Domain"] as! String
//    @objc static let restrictionsFireBaseURL = "\(EpicGlobalConstants.firebaseURL)/en/clubs/info/\(EpicGlobalConstants.theEpicClubId)/v1/restrictions.json"
//
//    // Search Domain
//    @objc static let search_domain = Bundle.main.infoDictionary?["Search Engine Host"] as! String
//
//
//#endif
    
    // Domain
    @objc static let api_domain = Bundle.main.infoDictionary?["Orchestrator Host"] as! String
    
    // Membership API Domain
    @objc static let membership_api_domain = Bundle.main.infoDictionary?["Membership Host"] as! String
    
    // Image URL
    @objc static let imageURLPrefix = Bundle.main.infoDictionary?["Image URL"] as! String
    
    // Restriction description
    @objc static let firebaseURL = Bundle.main.infoDictionary?["Firebase Domain"] as! String
    @objc static let restrictionsFireBaseURL = "\(EpicGlobalConstants.firebaseURL)/en/clubs/info/\(EpicGlobalConstants.theEpicClubId)/v1/restrictions.json"
    
    // Search Domain
    @objc static let search_domain = Bundle.main.infoDictionary?["Search Engine Host"] as! String
    
    //websocket url
    @objc static let wsHost = Bundle.main.infoDictionary?["Orchestrator WebSocket Host"] as! String
    
    //vavaldiTender
    @objc static let vavaldiBase = Bundle.main.infoDictionary?["Vivaldi Host"] as! String
    
    @objc static let epicPrivacyPolicyUrl = "https://corporate.samsclub.com/sams-club-privacy-policy"
    @objc static let epicTermsOfServiceUrl = "https://epic.samsclubsng.com/terms-and-conditions.html"

    @objc static let theEpicClubId: String = "6372"
    
    static let taxExemptDisclaimer: String = "I hereby certify under penalty of perjury that I am registered with the state and local taxing authorities, that I am exempt from state and local sales and use tax as indicated by my exemption certificate and that all merchandise purchased tax free will be resold in the normal course of my business, used in operation of an exempt organization, or that I am engaged in farming or ranching and the property purchased will be used only in my farming or ranching operation. I further certify that if any property purchased tax free is used or consumed in a manner which would make it subject to sales or use tax, I will pay the tax direct to the proper taxing authorities."
    
    /**********   一般只有API的域名中不同环境的服务器会不一样，其它接口API是不会变的   ************/
    // Log in
    @objc static let login_signin = "/api/v1/auth/login";
    
    // Start Checkout
    @objc static let startCheckout = "/api/v1/checkouts"
    
    // Checkout last event
    @objc static let lastEventPrefix = "/api/v1/checkouts/"
    @objc static let lastEventSuffix = "/lastEvent"
    
    // Forgot email
    @objc static let forgotEmail = "/api/v1/auth/recovery/email"
    
    // Forgot password
    @objc static let forgotPassword = "/api/v1/auth/recovery/password"
    
    // Log out
    @objc static let logOut = "/api/v1/auth/logout"
    
    // Membership log in
    @objc static let membershipLogIn = "/api/v1/auth/membershipLogin"
    
    // Membership sign up token generation
    @objc static let tokenGeneration = "/membership-api/v1/oauth/token?grant_type=client_credentials&scope=/membership-api/v1"
    
    // Membership sign up create membership
    @objc static let createMembership = "/membership-api/v1/memberships"
    
    // Get membership info
    @objc static let getMembership = "/membership-api/v1/memberships/"
    
    // Verify email uniqueness
    @objc static let getProfile = "/membership-api/v1/profile/services/v2/profiles?email="
    
    // Register
    @objc static let register = "/api/v1/auth/register"
    
    // Verify auth
    @objc static let verifyAuth = "/api/v1/verifyAuth"
    
    // Membership signup checkout membership
    @objc static let checkoutMembershipPrefix = "/membership-api/v1/memberships/"
    @objc static let checkoutMembershipSuffix = "/checkout"
    
    // Auto Renew
    @objc static let autoRenewPrefix = "/api/v1/memberships/"
    @objc static let autoRenewSuffix = "/enroll/autorenew"
    @objc static let unenrollPrefix = "/api/v1/memberships/"
    @objc static let unenrollSuffix = "/unenroll/autorenew"
    
    // Receipts
    @objc static let getClubId = "/api/v1/clubs/"
    @objc static let getReceipts = "/api/v1/receipts"
    
    @objc static let globalDeviceID = UIDevice.current.deviceId()
    
    @objc static func isIphoneX()-> Bool{
        let KISIphoneX = (__CGSizeEqualToSize(CGSize(width:375,height:812),UIScreen.main.bounds.size) || __CGSizeEqualToSize(CGSize(width:812, height: 375), UIScreen.main.bounds.size))
        return KISIphoneX;
    }
    
    @objc static func navHeight()->CGFloat{
        if isIphoneX(){
            return 84;
        }
        return 64;
    }
    
    @objc static func tabbarHeight()->CGFloat{
        if isIphoneX() {
            return 49+34;
        }
        return 49;
    }
    
    @objc static func iphonxBottom()->CGFloat{
        if isIphoneX(){
            return 34;
        }
        return 0;
    }
    @objc static func statesHeight() -> CGFloat{
        if isIphoneX() {
            return 40;
        }
        return 20;
    }
    
    @objc static func checkEmail(_ email:String?) -> Bool{
        guard let len = email?.lengthOfBytes(using: .utf8), len>0 else {
            return false;
        }
        let regex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
        let predicate = NSPredicate(format: "SELF MATCHES %@", regex);
        let isPre =  predicate.evaluate(with: email);
        return isPre;
    }
    
    @objc static func checkPassword(_ pwd:String?) -> Bool{
        guard let len = pwd?.lengthOfBytes(using: .utf8),len>0 else {
            return false;
        }
        let regex = "(?=.*[A-Za-z])(?=.*?[0-9])[A-Za-z\\d$@$!%*#?&]{7,}";
        let predicate = NSPredicate(format: "SELF MATCHES %@", regex);
        return  predicate.evaluate(with: pwd);
    }
    
    @objc static func checkNumber(_ number:String?) -> Bool{
        guard let len = number?.lengthOfBytes(using: .utf8),len>0 else {
            return false;
        }
        let regex = "[0-9]*";
        let predicate = NSPredicate(format: "SELF MATCHES %@", regex);
        return  predicate.evaluate(with: number);
    }
    
    // Express Return API
    @objc static let express_return_api_domain = Bundle.main.infoDictionary?["Express Return Host"] as! String
    
    @objc static let express_return_get_reasons = "/v1/returns/reasons"
    
    @objc static let express_return_get_transaction = "/v1/transactions/sales/transaction?tcNbr="
    
    @objc static let express_return_calculate_refund = "/v1/transactions/returns/calculateRefund"
    
    @objc static let express_return_create_return = "/v1/transactions/returns/create"
}
