//
//  Constants.h
//  EpicSnG-ios
//
//  Created by Chuanyong Jiang - Vendor on 2018/7/24.
//  Copyright © 2018年 Chuanyong Jiang - Vendor. All rights reserved.
//

#ifndef Constants_h
#define Constants_h


#define UIColorFromRGB(r,g,b) [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:1.0]

#define UIColorFromRGBA(r,g,b,a) [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:a]
//#pragma mark - 16进制色值转RGBa
#define UIColorFromRGBHex(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

// UIScreen width.
#define  kScreenWidth   [UIScreen mainScreen].bounds.size.width

// UIScreen height.

#define  kScreenHeight  [UIScreen mainScreen].bounds.size.height


// Status bar height.

#define  kStatusBarHeight      (kIsiPhoneX ? 44.f : 20.f)



// Navigation bar height.

#define  kNavigationBarHeight  44.f


#define kViewSafeAreInsets(view) ({UIEdgeInsets insets; if(@available(iOS 11.0, *)) {insets = view.safeAreaInsets;} else {insets = UIEdgeInsetsZero;} insets;})

#define kEpicFontSize(value) UIScreen.mainScreen.bounds.size.width*(value/1125)

#define kEpicFont(fontSize) [UIFont fontWithName:@"HelveticaNeue-Light" size:fontSize]

// 自定义Log
#ifdef DEBUG
#define EpicLog(...) NSLog(__VA_ARGS__)
#else
#define EpicLog(...)
#endif

// 用宏定义检测block是否可用!
#define EPIC_BLOCK_EXEC(block, ...) if (block) { block(__VA_ARGS__); };

#define RGBACOLOR(r,g,b,a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)]

//RGB颜色
#define random(r, g, b, a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)/255.0]
//随机色
#define randomColor random(arc4random_uniform(256), arc4random_uniform(256), arc4random_uniform(256), arc4random_uniform(256))

#define CHATVIEWBACKGROUNDCOLOR [UIColor colorWithRed:0.936 green:0.932 blue:0.907 alpha:1]


#define DevNSStringIsEmpty(str) ((str==nil)||[str isEqualToString:@"(null)"]||([str length]==0)||[str isEqualToString:@""])
#define DevNSArrayIsEmpty(arr) ((arr==nil)||([arr count]==0))

// block self
#define WEAKSELF typeof(self) __weak weakSelf = self;
#define STRONGSELF typeof(weakSelf) __strong strongSelf = weakSelf;


//当前设备的ios版本
#define IOS_VERSION [[[UIDevice currentDevice] systemVersion] floatValue]
#define iOS7 ([[UIDevice currentDevice].systemVersion doubleValue] >= 7.0)
#define iOS8 ([[UIDevice currentDevice].systemVersion doubleValue] >= 8.0)
#define iOS9 ([[UIDevice currentDevice].systemVersion doubleValue] >= 9.0)
#define iOS10 ([[UIDevice currentDevice].systemVersion doubleValue] >= 10.0)
#define iOS11 ([[UIDevice currentDevice].systemVersion doubleValue] >= 11.0)

// 获得RGB颜色
#define IWColor(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]

#define kCommonLabelColor  [UIColor colorWithRed:0.553 green:0.545 blue:0.545 alpha:1.000]

#define kCommonLabelFont [UIFont systemFontOfSize:15]

#define  iPhone4     ([[UIScreen mainScreen] bounds].size.height==480)
#define  iPhone5     ([[UIScreen mainScreen] bounds].size.height==568)
#define  iPhone6     ([[UIScreen mainScreen] bounds].size.height==667)
#define  iPhone6plus ([[UIScreen mainScreen] bounds].size.height==736)
#define  iPhoneX ([[UIScreen mainScreen] bounds].size.height==812)

#define kCustomSafeNavigationBarHeight (iPhoneX ? 88 : 64)//导航栏安全距离
#define kCustomSafeBottomHeight (iPhoneX ? 34 : 0)//底部安全距离
#define  kCustomSafeTopHeight      (iPhoneX ? 24.f : 0)
#define  kCustomSafeTabbarHeight         (iPhoneX ? (49.f+34.f) : 49.f)
// 底部宏
#define SafeAreaBottomHeight (kScreenHeight == 812.0 ? 34 : 0)
#define SafeAreaTopHeight (kScreenHeight == 812.0 ? 88 : 64)


#endif /* Constants_h */
