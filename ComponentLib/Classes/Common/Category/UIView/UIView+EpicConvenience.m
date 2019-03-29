//
//  UIView+EpicConvenience.m
//  EpicSnG-ios
//
//  Created by Binfeng Peng - Vendor on 2018/7/25.
//  Copyright © 2018 Chuanyong Jiang - Vendor. All rights reserved.
//

#import "UIView+EpicConvenience.h"

@implementation UIView (EpicConvenience)

- (void)setX:(CGFloat)x
{
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}

- (CGFloat)x
{
    return self.frame.origin.x;
}

- (void)setY:(CGFloat)y
{
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}

- (CGFloat)y
{
    return self.frame.origin.y;
}

- (void)setWidth:(CGFloat)width
{
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}

- (CGFloat)width
{
    return self.frame.size.width;
}

- (void)setHeight:(CGFloat)height
{
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}

- (CGFloat)height
{
    return self.frame.size.height;
}

- (CGFloat)right {
    return self.frame.origin.x + self.frame.size.width;
}

- (void)setRight:(CGFloat)right {
    CGRect frame = self.frame;
    frame.origin.x = right - frame.size.width;
    self.frame = frame;
}

- (CGFloat)bottom {
    return self.frame.origin.y + self.frame.size.height;
}

- (void)setBottom:(CGFloat)bottom {
    CGRect frame = self.frame;
    frame.origin.y = bottom - frame.size.height;
    self.frame = frame;
}

- (CGFloat)centerX {
    return self.center.x;
}

- (void)setCenterX:(CGFloat)centerX {
    self.center = CGPointMake(centerX, self.center.y);
}

- (CGFloat)centerY {
    return self.center.y;
}

- (void)setCenterY:(CGFloat)centerY {
    self.center = CGPointMake(self.center.x, centerY);
}

- (CGPoint)origin {
    return self.frame.origin;
}

- (void)setOrigin:(CGPoint)origin {
    CGRect frame = self.frame;
    frame.origin = origin;
    self.frame = frame;
}

- (CGSize)size {
    return self.frame.size;
}

- (void)setSize:(CGSize)size {
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
}

/**
 *  创建圆角
 */
- (void)cornerRadius
{
    [self.layer setMasksToBounds:NO];
    [self.layer setCornerRadius:2.0];//设置矩形四个圆角半径
    
    /*
     [view.layer setBorderWidth:1.0];//边框宽度
     */
    
    self.layer.shadowOffset = CGSizeMake(0, 2.5); //设置阴影的偏移量
    self.layer.shadowRadius = 2.0;  //设置阴影的半径
    self.layer.shadowColor = [UIColor colorWithHexString:@"#acacac"].CGColor; //设置阴影的颜色为黑色
    self.layer.shadowOpacity = 0.9f; //设置阴影的不透明度
}

- (void)layerAnimation
{
    CATransition *myTransition = [CATransition animation];//创建CATransition
    myTransition.duration = 0.3;//持续时长0.3秒
    myTransition.timingFunction = UIViewAnimationCurveEaseInOut;//计时函数，从头到尾的流畅度
    myTransition.type=@"rippleEffect";//动画类型
    //    myTransition.subtype=@"rippleEffect";//子类型
    
    
    [ self.layer addAnimation:myTransition forKey:nil ];
}

- (BOOL)containsSubView:(UIView *)subView
{
    for (UIView *view in [self subviews]) {
        if ([view isEqual:subView]) {
            return YES;
        }
    }
    return NO;
}

@end
