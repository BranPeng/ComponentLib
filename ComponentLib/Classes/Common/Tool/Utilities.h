//
//  Utilities.h
//  SamsNowiOS
//
//  Created by Ping Zhang - Vendor on 2018/8/2.
//  Copyright © 2018年 Binfeng Peng - Vendor. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Utilities : NSObject
#pragma mark - 生成条形码
//Avilable in iOS 8.0 and later
+ (UIImage *)barcodeImageWithContent:(NSString *)content
                       codeImageSize:(CGSize)size
                                 red:(CGFloat)red
                               green:(CGFloat)green
                                blue:(CGFloat)blue;
@end
