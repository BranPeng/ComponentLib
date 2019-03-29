//
//  UIView+EpicConvenience.h
//  EpicSnG-ios
//
//  Created by Binfeng Peng - Vendor on 2018/7/25.
//  Copyright © 2018 Chuanyong Jiang - Vendor. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (EpicConvenience)

@property (nonatomic, assign) CGFloat x;
@property (nonatomic, assign) CGFloat y;
@property (nonatomic, assign) CGFloat width;
@property (nonatomic, assign) CGFloat height;

@property (nonatomic) CGFloat centerX;
@property (nonatomic) CGFloat centerY;
@property (nonatomic) CGPoint origin;
@property (nonatomic) CGSize size;
@property (nonatomic) CGFloat right;
@property (nonatomic) CGFloat bottom;

/**
 *  创建圆角
 */
- (void)cornerRadius;

- (void)layerAnimation;

- (BOOL)containsSubView:(UIView *)subView;

@end
