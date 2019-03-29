//
//  UILabel+Extension.m
//  SamsNowiOS
//
//  Created by Binfeng Peng - Vendor on 2018/7/29.
//  Copyright © 2018 Binfeng Peng - Vendor. All rights reserved.
//

#import "UILabel+Extension.h"
#import <CoreText/CoreText.h>

@implementation UILabel (Extension)

- (void)setColumnSpace:(CGFloat)columnSpace
{
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithAttributedString:self.attributedText];
    //调整间距
    [attributedString addAttribute:(__bridge NSString *)kCTKernAttributeName value:@(columnSpace) range:NSMakeRange(0, [attributedString length])];
    self.attributedText = attributedString;
}

- (void)setRowSpace:(CGFloat)rowSpace
{
    self.numberOfLines = 0;
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithAttributedString:self.attributedText];
    //调整行距
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.lineSpacing = rowSpace;
    paragraphStyle.baseWritingDirection = NSWritingDirectionLeftToRight;
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [self.text length])];
    self.attributedText = attributedString;
}

/**
 设置行距
 */
+ (void)changeLineSpaceForLabel:(UILabel *)label WithSpace:(float)space {
    
    NSString *labelText = label.text;
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:labelText];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:space];
    paragraphStyle.baseWritingDirection = NSWritingDirectionLeftToRight;
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [labelText length])];
    label.attributedText = attributedString;
    [label sizeToFit];
}

//  获取一行的宽度
- (CGFloat)getLineWidth {
    NSString *text = self.text;
    CGSize textSize = [text sizeWithAttributes:@{ NSFontAttributeName : self.font }];
    return textSize.width + 2;
}

+ (CGFloat)getLabelWidthWith:(NSString *)text andLabelFont:(UIFont *)font {
    UILabel *label = [UILabel new];
    label.text = text;
    label.font = font;
    return [label getLineWidth];
}

- (CGSize)getSizeWithLabel:(CGFloat)width
{
    CGSize textBlockMinSize = {width, CGFLOAT_MAX};
    CGSize size;
    static float systemVersion;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        systemVersion = [[[UIDevice currentDevice] systemVersion] floatValue];
    });
    if (systemVersion >= 7.0) {
        NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
        size = [self.text boundingRectWithSize:textBlockMinSize options:NSStringDrawingUsesLineFragmentOrigin
                                    attributes:@{
                                                 NSFontAttributeName:self.font,
                                                 NSParagraphStyleAttributeName:paragraphStyle
                                                 }
                                       context:nil].size;
    }else{
        size = [self.text sizeWithFont:self.font
                     constrainedToSize:textBlockMinSize
                         lineBreakMode:NSLineBreakByCharWrapping];
    }
    
    return size;
}


/**
 根据宽度判断label是否能一行显示
 */
- (BOOL)isOneLineWithLabel:(CGFloat)width {
    UILabel *oneLineLabel = [[UILabel alloc] init];
    oneLineLabel.text = @" ";
    oneLineLabel.font = self.font;
    CGSize oneLineSize = [oneLineLabel getSizeWithLabel:width];
    CGSize lineSize = [self getSizeWithLabel:width];
    BOOL isOneLine = false;
    if (lineSize.height <= oneLineSize.height) {
        isOneLine = true;
    }
    return isOneLine;
}


+ (NSArray *)getSeparatedLinesFromLabel:(UILabel *)label
{
    NSString *text = [label text];
    UIFont   *font = [label font];
    CGRect    rect = [label frame];
    
    CTFontRef myFont = CTFontCreateWithName((__bridge CFStringRef)([font fontName]), [font pointSize], NULL);
    NSMutableAttributedString *attStr = [[NSMutableAttributedString alloc] initWithString:text];
    [attStr addAttribute:(NSString *)kCTFontAttributeName value:(__bridge id)myFont range:NSMakeRange(0, attStr.length)];
    
    CTFramesetterRef frameSetter = CTFramesetterCreateWithAttributedString((__bridge CFAttributedStringRef)attStr);
    
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathAddRect(path, NULL, CGRectMake(0,0,rect.size.width,100000));
    
    CTFrameRef frame = CTFramesetterCreateFrame(frameSetter, CFRangeMake(0, 0), path, NULL);
    
    NSArray *lines = (__bridge NSArray *)CTFrameGetLines(frame);
    NSMutableArray *linesArray = [[NSMutableArray alloc]init];
    
    for (id line in lines)
    {
        CTLineRef lineRef = (__bridge CTLineRef )line;
        CFRange lineRange = CTLineGetStringRange(lineRef);
        NSRange range = NSMakeRange(lineRange.location, lineRange.length);
        
        NSString *lineString = [text substringWithRange:range];
        [linesArray addObject:lineString];
    }
    
    CFRelease(frame);
    CFRelease(path);
    CFRelease(frameSetter);
    CFRelease(myFont);
    return (NSArray *)linesArray;
}

- (void)addMiddleLine
{
    NSString *textStr = self.text;
    
    //中划线
    NSDictionary *attribtDic = @{NSStrikethroughStyleAttributeName: [NSNumber numberWithInteger:NSUnderlineStyleSingle]};
    NSMutableAttributedString *attribtStr = [[NSMutableAttributedString alloc]initWithString:textStr attributes:attribtDic];
    
    // 赋值
    self.attributedText = attribtStr;
}

- (void)addUnderLine
{
    NSString *textStr = self.text;
    
    // 下划线
    NSDictionary *attribtDic = @{NSUnderlineStyleAttributeName: [NSNumber numberWithInteger:NSUnderlineStyleSingle]};
    NSMutableAttributedString *attribtStr = [[NSMutableAttributedString alloc]initWithString:textStr attributes:attribtDic];
    
    //赋值
    self.attributedText = attribtStr;
}

- (void)colorWithString:(NSString *)text fullMsg:(NSString *)fullMsg color:(UIColor *)color
{
    if (!fullMsg) {
        fullMsg = @" ";
    }
    NSMutableAttributedString *AttributedStr = [[NSMutableAttributedString alloc]initWithString:fullMsg];
    NSRange range = [fullMsg rangeOfString:text];
    [AttributedStr addAttribute:NSForegroundColorAttributeName
     
                          value:color
     
                          range:range];
    
    self.attributedText = AttributedStr;
}

- (void)fontWithString:(NSString *)text fullMsg:(NSString *)fullMsg font:(UIFont *)font{
    if (!fullMsg) {
        fullMsg = @" ";
    }
    NSMutableAttributedString *AttributedStr = [[NSMutableAttributedString alloc]initWithString:fullMsg];
    NSRange range = [fullMsg rangeOfString:text];
    [AttributedStr addAttribute:NSFontAttributeName
     
                          value:font
     
                          range:range];
    
    self.attributedText = AttributedStr;
}

- (void)verticalWithString:(NSString *)text fullMsg:(NSString *)fullMsg
{
    if (!fullMsg) {
        fullMsg = @" ";
    }
    NSMutableAttributedString *AttributedStr = [[NSMutableAttributedString alloc]initWithString:fullMsg];
    NSRange range = [fullMsg rangeOfString:text];
    [AttributedStr addAttribute:NSBaselineOffsetAttributeName
     
                          value:@5
     
                          range:range];
    
    self.attributedText = AttributedStr;
}

@end
