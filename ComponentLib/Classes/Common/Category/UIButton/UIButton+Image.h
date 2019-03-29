//
//  UIButton+Image.h
//  SamsNowiOS
//
//  Created by Haitao Chen on 2018/8/10.
//  Copyright © 2018年 Binfeng Peng - Vendor. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <SDWebImage/UIButton+WebCache.h>
@interface UIButton (Image)
-(void)samsClub_setImageWithURL:(nullable NSURL *)url
                       forState:(UIControlState)state
               placeholderImage:(nullable UIImage *)placeholder
                      completed:(nullable SDExternalCompletionBlock)completedBlock;

-(void)samsClub_setBackgroundImageWithURL:(nullable NSURL *)url
                                 forState:(UIControlState)state
                         placeholderImage:(nullable UIImage *)placeholder
                                completed:(nullable SDExternalCompletionBlock)completedBlock;
@end
