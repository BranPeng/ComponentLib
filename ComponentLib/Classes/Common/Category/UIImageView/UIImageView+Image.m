//
//  UIImageView+Image.m
//  SamsNowiOS
//
//  Created by Haitao Chen on 2018/8/10.
//  Copyright © 2018年 Binfeng Peng - Vendor. All rights reserved.
//

#import "UIImageView+Image.h"

@implementation UIImageView (Image)
-(void)samsClub_setImageWithURL:(nullable NSURL *)url
         placeholderImage:(nullable UIImage *)placeholder
                completed:(nullable SDExternalCompletionBlock)completedBlock {
    [self sd_setImageWithURL:url placeholderImage:placeholder completed:completedBlock];
    
}
@end
