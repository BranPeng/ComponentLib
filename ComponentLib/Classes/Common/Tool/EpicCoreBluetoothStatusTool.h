//
//  EpicCoreBluetoothStatusTool.h
//  SamsNowiOS
//
//  Created by Binfeng Peng - Vendor on 2018/8/31.
//  Copyright © 2018 Binfeng Peng - Vendor. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreBluetooth/CoreBluetooth.h>
#import "Singleton.h"

NS_ASSUME_NONNULL_BEGIN
@interface EpicCoreBluetoothStatusTool : NSObject <CBCentralManagerDelegate, CBPeripheralManagerDelegate>
singleton_interface(EpicCoreBluetoothStatusTool)


// 蓝牙检测  centralManager.state 获取蓝牙状态
@property (nonatomic, strong) CBCentralManager *centralManager;

@property (nonatomic,strong) CBPeripheralManager *manager;

@property (nonatomic, copy, nullable) void(^epic_BluetoothStatusChanged)(void);

/**
 *  打开蓝牙设置
 */
- (void)openBluetoothSetting;


/**
 *  打开定位服务
 */
- (void)openLocationService;

/**
 *  打开定位服务
 */
- (void)openLocationPermissions;
/**
 *  打开wifi
 */
- (void)openWifi;
@end
NS_ASSUME_NONNULL_END
