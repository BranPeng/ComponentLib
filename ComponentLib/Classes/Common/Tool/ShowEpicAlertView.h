//
//  ShowEpicAlertView.h
//  SamsNowiOS
//
//  Created by Weijian Ping - Vendor on 2018/10/2.
//  Copyright © 2018 Binfeng Peng - Vendor. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface ShowEpicAlertView : NSObject

typedef void(^alertState)(NSString *state);

+(void)showEpicAlertView:(NSString *)titleString DetailString:(NSString *)detailString TyeAlertString:(NSString *)typeAlertString CancleString:(NSString *)cancleString SureString:(NSString *)sureString OkString:(NSString *)okString alertStateBlock:(alertState)stateBlock;

@end

