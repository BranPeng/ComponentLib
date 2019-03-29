//
//  UIViewController+Navigation.h
//  SamsNowiOS
//
//  Created by Binfeng Peng - Vendor on 2018/8/21.
//  Copyright © 2018 Binfeng Peng - Vendor. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (Navigation)

/**
 * pop 到指定controller页面
 */
- (void)popToViewController:(Class)controllerClass;

/**
 * 获取导航控制器堆栈中指定controller页面
 */
- (UIViewController *)getViewController:(Class)controllerClass;

/**
 * 导航控制器堆栈中是否包含指定controller页面
 */
- (BOOL)isContainViewController:(Class)controllerClass;

@end
