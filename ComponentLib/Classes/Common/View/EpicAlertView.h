//
//  EpicAlertView.h
//  SamsNowiOS
//
//  Created by Weijian Ping - Vendor on 2018/9/30.
//  Copyright © 2018 Binfeng Peng - Vendor. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN


@interface EpicAlertView : UIView

@property (nonatomic,strong) NSString *titleString;
@property (nonatomic,strong) NSString *detailString;

@property (nonatomic,strong) NSString *cancelButtonString;
@property (nonatomic,strong) NSString *sureButtonString;
@property (nonatomic,strong) NSString *okButtonString;

@property (nonatomic,assign) NSString *typeAlert;


@property (nonatomic, copy) void (^didClickCancel)(UIButton *button);
@property (nonatomic, copy) void (^didClickSure)(UIButton *button);
@property (nonatomic, copy) void (^didClickOk)(UIButton *button);

@end

NS_ASSUME_NONNULL_END
