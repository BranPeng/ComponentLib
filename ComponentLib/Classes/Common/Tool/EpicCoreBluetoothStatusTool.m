//
//  EpicCoreBluetoothStatusTool.m
//  SamsNowiOS
//
//  Created by Binfeng Peng - Vendor on 2018/8/31.
//  Copyright © 2018 Binfeng Peng - Vendor. All rights reserved.
//

#import "EpicCoreBluetoothStatusTool.h"

@implementation EpicCoreBluetoothStatusTool
singleton_implementation(EpicCoreBluetoothStatusTool)

- (instancetype)init
{
    if (!self) {
        self = [super init];
    }
    
    // 蓝牙检测
    self.centralManager = [[CBCentralManager alloc] initWithDelegate:self queue:nil options:nil];
    
    EpicLog(@"status:%ld", (long)self.centralManager.state);
    [self centralManagerDidUpdateState:self.centralManager];
    
    self.manager=[[CBPeripheralManager alloc] initWithDelegate:self queue:nil];
    [self peripheralManagerDidUpdateState:self.manager];
    
    return self;
}

#pragma mark - CBCentralManagerDelegate
- (void)centralManagerDidUpdateState:(CBCentralManager *)central{
    
    EPIC_BLOCK_EXEC(self.epic_BluetoothStatusChanged);
    switch (central.state) {
            
        case CBManagerStateUnknown:
            
        {
            
            // 初始的时候是未知的（刚刚创建的时候）
            EpicLog(@"CBManagerStateUnknown");
        }
            
            break;
            
        case CBManagerStateResetting:
            
        {
            
            //正在重置状态
            EpicLog(@"CBManagerStateResetting");
        }
            
            break;
            
        case CBManagerStateUnsupported:
            
        {
            
            //设备不支持的状态
            EpicLog(@"CBManagerStateUnsupported");
        }
            
            break;
            
        case CBManagerStateUnauthorized:
            
        {
            
//            [stringForCentral appendString:@"Resetting\n"];
            
            // 设备未授权状态
            EpicLog(@"CBManagerStateUnauthorized");
        }
            
            break;
            
        case CBManagerStatePoweredOff:
            
        {
            
            //设备关闭状态
            EpicLog(@"CBManagerStatePoweredOff");
        }
            
            break;
            
        case CBManagerStatePoweredOn:
            
        {
            
            // 设备开启状态 -- 可用状态
            EpicLog(@"CBManagerStatePoweredOn");
        }
            
            break;
            
        default:
            
        {
            
        }
            
            break;
            
    }
    
}

- (void)peripheralManagerDidUpdateState:(CBPeripheralManager *)peripheral{
    
    switch (peripheral.state) {
            
        case CBPeripheralManagerStatePoweredOn:
            
        {
            
            NSLog(@"蓝牙开启且可用");
            
        }
            
            break;
            
        default:
            
            NSLog(@"蓝牙不可用");
            
            break;
            
    }
    
}

- (void)openBluetoothSetting {
    NSString * urlString = @"App-Prefs:root=Bluetooth";
    
    if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:urlString]]) {
        
        if (IOS_VERSION>10.0) {
            
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:urlString] options:@{} completionHandler:nil];
            
        } else {
            
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:urlString]];
            
        }
        
    }
}

-(void)openLocationService{
    NSString * urlString = @"App-Prefs:root=LOCATION_SERVICES";
    [self openUrl:urlString];
}

- (void)openLocationPermissions{
    NSURL *url = [NSURL URLWithString:UIApplicationOpenSettingsURLString];
    [self openUrl:UIApplicationOpenSettingsURLString];
}

- (void)openWifi{
    NSString * urlString = @"App-Prefs:root=WIFI";
    [self openUrl:urlString];
}

- (void)openUrl:(NSString *)urlString{
    if (urlString == nil) {
        return;
    }
    NSURL *url = [NSURL URLWithString:urlString];
    if ([[UIApplication sharedApplication] canOpenURL:url]) {
        if (IOS_VERSION>10.0) {
            [[UIApplication sharedApplication] openURL:url options:@{} completionHandler:nil];
        } else {
            [[UIApplication sharedApplication] openURL:url];
        }
    }
}

@end
