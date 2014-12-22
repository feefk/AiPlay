//
//  APMainViewController.h
//  AiPlay
//
//  Created by wuhe on 14/12/19.
//  Copyright (c) 2014年 feefk. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <CoreBluetooth/CoreBluetooth.h>




@class APManualDirectionView;
@class APMoveView;


@interface APMainViewController : UIViewController<CBCentralManagerDelegate,CBPeripheralDelegate>



@property bool cbReady;
@property (nonatomic,strong) CBCentralManager *cbCM;
@property (strong,nonatomic) NSMutableArray *nDevices;
@property (strong,nonatomic) NSMutableArray *nServices;
@property (strong,nonatomic) NSMutableArray *nCharacteristics;

@property (strong,nonatomic) CBPeripheral *cbPeripheral;
@property (strong,nonatomic) CBService *cbServices;
@property (strong,nonatomic) CBCharacteristic *cbCharacteristcs;

- (IBAction)btnScaningPressed:(id)sender;

@property (weak, nonatomic) IBOutlet APManualDirectionView *viewManualDirection;

@property (weak, nonatomic) IBOutlet APMoveView *viewMoveView;


- (void) btnManualDirection:(NSInteger)direction;
- (void) btnMove:(NSInteger)move;

@end
