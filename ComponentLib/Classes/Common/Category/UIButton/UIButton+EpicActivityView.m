//
//  UIButton+EpicActivityView.m
//  SamsNowiOS
//
//  Created by Binfeng Peng - Vendor on 2018/8/1.
//  Copyright © 2018 Binfeng Peng - Vendor. All rights reserved.
//

#import "UIButton+EpicActivityView.h"
#import <objc/runtime.h>

static NSUInteger const indicatorViewSize = 20;
static NSUInteger const indicatorViewTag  = 999;

static char *TitleStringKey = "TitleStringKey";
static char *TitleAttributedStringKey = "TitleAttributedStringKey";


@implementation UIButton (EpicActivityView)

- (void)setSavedButtonTitleString:(NSString *)savedButtonTitleString
{
    /*
     objc_AssociationPolicy参数使用的策略：
     OBJC_ASSOCIATION_ASSIGN;            //assign策略
     OBJC_ASSOCIATION_COPY_NONATOMIC;    //copy策略
     OBJC_ASSOCIATION_RETAIN_NONATOMIC;  // retain策略
     
     OBJC_ASSOCIATION_RETAIN;
     OBJC_ASSOCIATION_COPY;
     */
    /*
     关联方法：
     objc_setAssociatedObject(id object, const void *key, id value, objc_AssociationPolicy policy);
     
     参数：
     * id object 给哪个对象的属性赋值
     const void *key 属性对应的key
     id value  设置属性值为value
     objc_AssociationPolicy policy  使用的策略，是一个枚举值，和copy，retain，assign是一样的，手机开发一般都选择NONATOMIC
     */
    
    objc_setAssociatedObject(self, TitleStringKey, savedButtonTitleString, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

-  (NSString *)savedButtonTitleString{
    return objc_getAssociatedObject(self, TitleStringKey);
}

- (void)setSavedButtonTitleAttributedString:(NSString *)savedButtonTitleAttributedString
{
    objc_setAssociatedObject(self, TitleAttributedStringKey, savedButtonTitleAttributedString, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (NSString *)savedButtonTitleAttributedString{
    return objc_getAssociatedObject(self, TitleAttributedStringKey);
}

- (void)startButtonActivityIndicatorViewWithPosition:(EPIC_Activity_Position)position
{
    self.backgroundColor = [self.backgroundColor colorWithAlphaComponent:0.4];
    self.enabled = NO;
    UIActivityIndicatorView *indicatorView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    
    self.savedButtonTitleString = [self titleForState:self.state];
    self.savedButtonTitleAttributedString = [self attributedTitleForState:self.state];
    
    if (position == EPIC_Activity_Position_Left) {
        CGRect rect = [self.currentTitle boundingRectWithSize:CGSizeMake(self.bounds.size.width, self.bounds.size.height) options:(NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading) attributes:@{NSFontAttributeName:self.titleLabel.font} context:nil];
        CGSize p = CGRectIntegral(rect).size;
        
        
        indicatorView.frame = CGRectMake(self.bounds.size.width/2 - p.width/2 - indicatorViewSize - 5, self.bounds.size.height/2 - indicatorViewSize/2, indicatorViewSize, indicatorViewSize);
    } else if (position == EPIC_Activity_Position_Right) {
        CGRect rect = [self.currentTitle boundingRectWithSize:CGSizeMake(self.bounds.size.width, self.bounds.size.height) options:(NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading) attributes:@{NSFontAttributeName:self.titleLabel.font} context:nil];
        CGSize p = CGRectIntegral(rect).size;
        
        
        indicatorView.frame = CGRectMake(self.bounds.size.width/2 + p.width/2 + 5, self.bounds.size.height/2 - indicatorViewSize/2, indicatorViewSize, indicatorViewSize);
    } else if (position == EPIC_Activity_Position_Center) {
        CGFloat indicatorViewX = (self.bounds.size.width - indicatorViewSize) / 2;
        indicatorView.frame = CGRectMake(indicatorViewX, self.bounds.size.height/2 - indicatorViewSize/2, indicatorViewSize, indicatorViewSize);
        
        [self setTitle:@" " forState:UIControlStateNormal];
        [self setAttributedTitle:[[NSAttributedString alloc] initWithString:@" "] forState:UIControlStateNormal];
    }

    indicatorView.tag = indicatorViewTag;
    indicatorView.hidesWhenStopped = YES;
    [self addSubview:indicatorView];
    [indicatorView startAnimating];
}

- (void)endButtonActivityIndicatorView
{
    UIActivityIndicatorView *indicatorView = (UIActivityIndicatorView *)[self viewWithTag:indicatorViewTag];
    [indicatorView removeFromSuperview];
    self.enabled = YES;
    self.backgroundColor = [self.backgroundColor colorWithAlphaComponent:0.4*(5/2)];
    [self setTitle:self.savedButtonTitleString forState:UIControlStateNormal];
    [self setAttributedTitle:self.savedButtonTitleAttributedString forState:UIControlStateNormal];
}

@end
