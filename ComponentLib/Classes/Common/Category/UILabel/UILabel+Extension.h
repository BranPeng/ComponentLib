//
//  UILabel+Extension.h
//  SamsNowiOS
//
//  Created by Binfeng Peng - Vendor on 2018/7/29.
//  Copyright © 2018 Binfeng Peng - Vendor. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (Extension)

/**
 *  设置字间距
 */
- (void)setColumnSpace:(CGFloat)columnSpace;
/**
 *  设置行距
 */
- (void)setRowSpace:(CGFloat)rowSpace;
/**
 设置行距
 */
+ (void)changeLineSpaceForLabel:(UILabel *)label WithSpace:(float)space;

/**
 *  用这个方法就可以得到UILabel的最后一行文字，那样就可以计算得UILabel最后一行文字的宽度，就可以定位到最后一个文字的位置。这样的话，就可以应付变态的产品经理了，比如可以在文字的后面紧跟着贴一个icon什么的了。
 */
+ (NSArray *)getSeparatedLinesFromLabel:(UILabel *)label;


/**
 获取一行的宽度
 */
- (CGFloat)getLineWidth;
+ (CGFloat)getLabelWidthWith:(NSString *)text andLabelFont:(UIFont *)font;

/**
 根据宽度获取label高度
 */
- (CGSize)getSizeWithLabel:(CGFloat)width;

/**
 根据宽度判断label是否能一行显示
 */
- (BOOL)isOneLineWithLabel:(CGFloat)width;

//添加中划线
- (void)addMiddleLine;

//添加下划线
- (void)addUnderLine;

/**
 改变部分文字的颜色
 */
- (void)colorWithString:(NSString *)text fullMsg:(NSString *)fullMsg color:(UIColor *)color;
/**
 改变部分文字的大小
 */
- (void)fontWithString:(NSString *)text fullMsg:(NSString *)fullMsg font:(UIFont *)font;
/**
 改变部分文字的位置居顶
 */
- (void)verticalWithString:(NSString *)text fullMsg:(NSString *)fullMsg;

@end
