//
//  ShowEpicAlertView.m
//  SamsNowiOS
//
//  Created by Weijian Ping - Vendor on 2018/10/2.
//  Copyright © 2018 Binfeng Peng - Vendor. All rights reserved.
//

#import "ShowEpicAlertView.h"
#import "PBFPopupTool.h"


@implementation ShowEpicAlertView

+(void)showEpicAlertView:(NSString *)titleString DetailString:(NSString *)detailString TyeAlertString:(NSString *)typeAlertString CancleString:(NSString *)cancleString SureString:(NSString *)sureString OkString:(NSString *)okString alertStateBlock:(alertState)stateBlock {
    CGFloat viewW = [UIScreen pxBy375RatioWithValue:272];
    CGFloat view1h = [self getLabelHeightWithText:titleString width:[UIScreen pxBy375RatioWithValue:238] font:[UIScreen pxBy375RatioWithValue:17]];
    CGFloat view2h = 0.0;
    if (![detailString isEqualToString:@""] &&(detailString != nil)) {
        view2h = [self getLabelHeightWithText:detailString width:[UIScreen pxBy375RatioWithValue:238] font:[UIScreen pxBy375RatioWithValue:13]] + [UIScreen pxBy375RatioWithValue:8];
    }
    CGFloat viewH  = [UIScreen pxBy375RatioWithValue:20+20+1+44] + view1h + view2h ;
    
    EpicAlertView *signView = [[EpicAlertView alloc] init];
    signView.frame = CGRectMake(0, 0, viewW, viewH);
    
    signView.typeAlert = typeAlertString;
    signView.titleString = titleString;
    signView.detailString = detailString;
    signView.cancelButtonString = cancleString;
    signView.sureButtonString = sureString;
    signView.okButtonString = okString;
    
    WEAKSELF
    signView.didClickCancel = ^(UIButton * _Nonnull button) {
        EpicLog(@"didClickCancel");
        stateBlock(@"cancel");
        [weakSelf.sl_popupController dismiss];
    };
    
    signView.didClickSure = ^(UIButton * _Nonnull button) {
        EpicLog(@"didClickSure");
        stateBlock(@"sure");
        [weakSelf.sl_popupController dismiss];
    };
    signView.didClickOk = ^(UIButton * _Nonnull button) {
        EpicLog(@"didClickOk");
        stateBlock(@"ok");
        [weakSelf.sl_popupController dismiss];
    };
    
    self.sl_popupController = [[PBFPopupTool alloc] init];
    self.sl_popupController.dismissOnMaskTouched = NO;
    self.sl_popupController.maskType = PopupMaskTypeDefault;
    self.sl_popupController.layoutType = PopupLayoutTypeCenter;
    self.sl_popupController.transitStyle = PopupTransitStyleSlightScale;
    [self.sl_popupController presentContentView:signView duration:0.4 elasticAnimated:YES];
}

+ (CGFloat)getLabelHeightWithText:(NSString *)text width:(CGFloat)width font: (CGFloat)font
{
    CGRect rect = [text boundingRectWithSize:CGSizeMake(width, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:font]} context:nil];
    return rect.size.height;
    
}
@end
