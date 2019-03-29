//
//  UIImageView+Image.h
//  SamsNowiOS
//
//  Created by Haitao Chen on 2018/8/10.
//  Copyright © 2018年 Binfeng Peng - Vendor. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <SDWebImage/UIImageView+WebCache.h>
@interface UIImageView (Image)
-(void)samsClub_setImageWithURL:(nullable NSURL *)url
               placeholderImage:(nullable UIImage *)placeholder
                      completed:(nullable SDExternalCompletionBlock)completedBlock;
@end
