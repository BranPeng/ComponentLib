//
//  UIViewController+ShareApp.m
//  sng
//
//  Created by Berk Atikoglu on 12/6/15.
//  Copyright © 2015 Wal-mart Stores, Inc. All rights reserved.
//

#import "UIViewController+ShareApp.h"

@implementation UIViewController (ShareApp)

- (void)shareAppFromTrigger:(NSString *)trigger
{
    NSString *shareText = @"Beat the line - try Sam’s Club Scan & Go: http://sams.co/sng";
    UIActivityViewController *activityViewController = [[UIActivityViewController alloc] initWithActivityItems:@[shareText] applicationActivities:nil];
    
    [activityViewController setValue:@"Sam's Club Scan & Go app" forKey:@"subject"];
    NSArray *excludeActivities = @[
                                   UIActivityTypePostToWeibo,
                                   UIActivityTypePrint,
                                   UIActivityTypeAssignToContact,
                                   UIActivityTypeSaveToCameraRoll,
                                   UIActivityTypeAddToReadingList,
                                   UIActivityTypePostToFlickr,
                                   UIActivityTypePostToVimeo,
                                   UIActivityTypePostToTencentWeibo,
                                   UIActivityTypeAirDrop];
    
    activityViewController.excludedActivityTypes = excludeActivities;
    [self presentViewController:activityViewController animated:YES completion:nil];
}

@end
