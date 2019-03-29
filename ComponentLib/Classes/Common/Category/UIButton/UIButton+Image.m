//
//  UIButton+Image.m
//  SamsNowiOS
//
//  Created by Haitao Chen on 2018/8/10.
//  Copyright © 2018年 Binfeng Peng - Vendor. All rights reserved.
//

#import "UIButton+Image.h"

@implementation UIButton (Image)
-(void)samsClub_setImageWithURL:(nullable NSURL *)url
                       forState:(UIControlState)state
               placeholderImage:(nullable UIImage *)placeholder
                      completed:(nullable SDExternalCompletionBlock)completedBlock {
    
    [self sd_setImageWithURL:url forState:state placeholderImage:placeholder completed:completedBlock];
}

-(void)samsClub_setBackgroundImageWithURL:(nullable NSURL *)url
                       forState:(UIControlState)state
               placeholderImage:(nullable UIImage *)placeholder
                      completed:(nullable SDExternalCompletionBlock)completedBlock {
    [self sd_setBackgroundImageWithURL:url forState:state placeholderImage:placeholder completed:completedBlock];
}


@end
