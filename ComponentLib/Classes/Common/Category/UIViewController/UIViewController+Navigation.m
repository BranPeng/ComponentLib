//
//  UIViewController+Navigation.m
//  SamsNowiOS
//
//  Created by Binfeng Peng - Vendor on 2018/8/21.
//  Copyright © 2018 Binfeng Peng - Vendor. All rights reserved.
//

#import "UIViewController+Navigation.h"

@implementation UIViewController (Navigation)

/**
 * pop 到指定controller页面
 */
- (void)popToViewController:(Class)controllerClass
{
    for(UIViewController*temp in self.navigationController.viewControllers) {
        
        if([temp isKindOfClass:controllerClass]) {
            
            [self.navigationController popToViewController:temp animated:NO];
            break;
        }
        
    }
}

- (UIViewController *)getViewController:(Class)controllerClass
{
    for(UIViewController*temp in self.navigationController.viewControllers) {
        
        if([temp isKindOfClass:controllerClass]) {
            
            return temp;
            break;
            
        }
        
    }
    
    return nil;
}

/**
 * 是否包含指定controller页面
 */
- (BOOL)isContainViewController:(Class)controllerClass
{
    BOOL isContain = NO;
    
    for(UIViewController*temp in self.navigationController.viewControllers) {
        
        if([temp isKindOfClass:controllerClass]) {
            
            isContain = YES;
            
            break;
        }
        
    }
    
    return isContain;
}


@end
