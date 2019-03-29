//
//  NSString+ToAttribute.h
//  EpicSnG-ios
//
//  Created by Jun Wang - Vendor on 2018/7/26.
//  Copyright © 2018年 Chuanyong Jiang - Vendor. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface NSString (ToAttribute)
//
-(NSAttributedString *)toThroughAttributeWithRang:(NSRange)rang;
//
-(NSAttributedString *)toParaStyleWithLineSpace:(int)lineSpace rang:(NSRange)rang;
//
-(NSAttributedString *)toForegAttreWith:(UIColor *)fColor rang:(NSRange)rang;

-(NSMutableAttributedString *)toParaAndForeLineSpace:(int)lineSpace color:(UIColor *)color corlorRang:(NSRange)rang;
@end
