//
//  HintTextAnimatedView.m
//  SamsNowiOS
//
//  Created by Weijian Ping - Vendor on 2018/9/27.
//  Copyright © 2018 Binfeng Peng - Vendor. All rights reserved.
//

#import "HintTextAnimatedView.h"

@interface HintTextAnimatedView ()

@property (nonatomic) NSTimer     *timer;

@end

@implementation HintTextAnimatedView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

- (void)drawRect:(CGRect)rect
{
    [super drawRect:rect];
    
    CGFloat radius = self.frame.size.width * 0.4;
    CGFloat startAngle = 0;
    CGFloat endAngle = 2 * M_PI;
    //中心点
    CGPoint center = CGPointMake(self.frame.size.width*0.25, self.frame.size.height*0.25);
    //画圆
    UIBezierPath *bezierPath = [UIBezierPath bezierPathWithArcCenter:center radius:radius startAngle:startAngle endAngle:endAngle clockwise:YES];
    //生成layer对象
    CAShapeLayer *shapeLayer = [[CAShapeLayer alloc] init];
    shapeLayer.path = bezierPath.CGPath;//设置path
    shapeLayer.strokeColor = [UIColor clearColor].CGColor;//圆边框颜色
    shapeLayer.fillColor = [UIColor colorWithRed:25/255.0 green:119/255.0 blue:211/255.0 alpha:0.35].CGColor;//圆填充颜色
    //添加layer对象
    [self.layer addSublayer:shapeLayer];
}

@end
