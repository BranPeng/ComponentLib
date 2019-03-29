//
//  UIButton+EpicActivityView.h
//  SamsNowiOS
//
//  Created by Binfeng Peng - Vendor on 2018/8/1.
//  Copyright © 2018 Binfeng Peng - Vendor. All rights reserved.
//

#import <UIKit/UIKit.h>

/*!
 @enum
 @brief    ActivityIndicatorView的位置
 @constant EPIC_Activity_Position_Left          左侧 -- 保留title
 @constant EPIC_Activity_Position_Right         右侧 -- 保留title
 @constant EPIC_Activity_Position_Center        中间 -- 隐藏title
 */
typedef enum{
    EPIC_Activity_Position_Left = 1,
    EPIC_Activity_Position_Right = 2,
    EPIC_Activity_Position_Center = 3
}EPIC_Activity_Position;

@interface UIButton (EpicActivityView)

@property (nonatomic, copy) NSString* savedButtonTitleString;
@property (nonatomic, copy) NSAttributedString* savedButtonTitleAttributedString;

- (void)startButtonActivityIndicatorViewWithPosition:(EPIC_Activity_Position)position;

- (void)endButtonActivityIndicatorView;

@end
