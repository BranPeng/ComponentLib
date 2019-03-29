//
//  NSString+ToAttribute.m
//  EpicSnG-ios
//
//  Created by Jun Wang - Vendor on 2018/7/26.
//  Copyright © 2018年 Chuanyong Jiang - Vendor. All rights reserved.
//

#import "NSString+ToAttribute.h"

@implementation NSString (ToAttribute)

-(NSAttributedString *)toThroughAttributeWithRang:(NSRange)rang{
    NSMutableAttributedString *attrStr = [[NSMutableAttributedString alloc] initWithString:self];
    [attrStr addAttribute:NSStrikethroughStyleAttributeName value:@(NSUnderlineStyleSingle|NSUnderlinePatternSolid)  range:rang];
    return attrStr;
}
-(NSAttributedString *)toParaStyleWithLineSpace:(int)lineSpace rang:(NSRange)rang{
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.lineSpacing = lineSpace;
    paragraphStyle.lineBreakMode = NSLineBreakByCharWrapping;
    paragraphStyle.alignment = NSTextAlignmentCenter;
    NSMutableAttributedString *attrStr = [[NSMutableAttributedString alloc] initWithString:self];
    [attrStr addAttribute:NSParagraphStyleAttributeName value:paragraphStyle  range:rang];
    
    return attrStr;
}
-(NSAttributedString *)toForegAttreWith:(UIColor *)fColor rang:(NSRange)rang{
    NSMutableAttributedString *attrStr = [[NSMutableAttributedString alloc] initWithString:self];
    [attrStr addAttribute:NSForegroundColorAttributeName value:fColor range:rang];
    return attrStr;
}

-(NSMutableAttributedString *)toParaAndForeLineSpace:(int)lineSpace color:(UIColor *)color corlorRang:(NSRange)rang{
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.lineSpacing = lineSpace;
    paragraphStyle.lineBreakMode = NSLineBreakByCharWrapping;
    paragraphStyle.alignment = NSTextAlignmentCenter;
    NSMutableAttributedString *attrStr = [[NSMutableAttributedString alloc] initWithString:self];
    [attrStr addAttribute:NSParagraphStyleAttributeName value:paragraphStyle  range:NSMakeRange(0, self.length)];
    [attrStr addAttribute:NSForegroundColorAttributeName value:color range:rang];
    return  attrStr;
}


@end
