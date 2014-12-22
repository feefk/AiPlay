//
//  APMainViewController.m
//  AiPlay
//
//  Created by wuhe on 14/12/19.
//  Copyright (c) 2014年 feefk. All rights reserved.
//

#import "APMainViewController.h"

#import "APSettingViewController.h"
#import "APManualDirectionView.h"
#import "APMoveView.h"

static NSString * const kServiceUUID = @"312700E2-E798-4D5C-8DCF-49908332DF9F";

static NSString * const kCharacteristicUUID = @"FFA28CDE-6525-4489-801C-1C060CAC9767";

@interface APMainViewController (){
    NSInteger currentIdx;
}

@property (weak, nonatomic) IBOutlet UISegmentedControl *uiSegmentedControlTop;
@property (weak, nonatomic) IBOutlet UIButton *btnScaning;

@end

@implementation APMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.viewManualDirection.apMainVC = self;
    self.viewMoveView.apMainVC = self;
    
    currentIdx = 0;
    
    [self.uiSegmentedControlTop addTarget:self action:@selector(segmentAction:) forControlEvents:UIControlEventValueChanged];
    
    
    _cbCM = [[CBCentralManager alloc] initWithDelegate:self queue:nil];
    _cbServices =[[CBService alloc]init];
    _cbCharacteristcs =[[CBCharacteristic alloc]init];
    
    //列表初始化
    _nDevices = [[NSMutableArray alloc]init];
    _nServices = [[NSMutableArray alloc]init];
    _nCharacteristics = [[NSMutableArray alloc]init];
    
    _cbReady = false;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) btnManualDirection:(NSInteger)direction {

    NSLog(@"btnManualDirection : %d", direction);
    Byte dat[] = {0x31, 0xfc};
    switch (direction) {
        case 0:
            dat[0] = 0x31;
            break;
        case 1:
            dat[0] = 0x32;
            break;
            
        default:
            break;
    }
    
    [self writeCharacteristic:_cbPeripheral sUUID:@"FFF2" cUUID:@"FFF1" data:[NSData dataWithBytes:&dat length:2]];
}

- (void) btnMove:(NSInteger)move{
    NSLog(@"btnMove : %d", move);
    
    Byte dat[] = {0x33, 0xfc};
    switch (move) {
        case 0:
            dat[0] = 0x33;
            break;
        case 1:
            dat[0] = 0x34;
            break;
            
        default:
            break;
    }
    
    [self writeCharacteristic:_cbPeripheral sUUID:@"FFF2" cUUID:@"FFF1" data:[NSData dataWithBytes:&dat length:2]];
}

#pragma mark - UISegmentedControl
- (void)segmentAction:(UISegmentedControl *)Seg{
    NSInteger index = Seg.selectedSegmentIndex;
    
    switch (index) {
        case 0:
            currentIdx = index;
            break;
        case 1:
            currentIdx = index;
            break;
        case 2:
        {
        }
            break;
        default:
            break;
    }
}

#pragma mark - ButtonPressed
- (IBAction)btnScaningPressed:(id)sender {
//    NSArray *services = @[@"DA2B84F1-6279-48DE-BDC0-AFBEA0226079"];
    
//    [_cbCM scanForPeripheralsWithServices:services options:nil];
    
//    return;
    APSettingViewController *apSettingVC = [self.storyboard instantiateViewControllerWithIdentifier:@"APSettingViewControllerSBID"];
    UINavigationController *navigationController=[[UINavigationController alloc] initWithRootViewController:apSettingVC];
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"Back"
                                                                   style:UIBarButtonItemStyleDone
                                                                  target:nil
                                                                  action:@selector(btnScaningBackPressed:)];
    apSettingVC.navigationItem.leftBarButtonItem = backButton;
    [self presentViewController:navigationController animated:YES completion:^{
        
    }];
}

-(void)btnScaningBackPressed: (id)sender
{
    
    [self dismissViewControllerAnimated:YES completion:^{
//        self.uiSegmentedControlTop.selectedSegmentIndex = currentIdx;
        
    }];
}

#pragma mark -
-(void)centralManagerDidUpdateState:(CBCentralManager *)central {
    _cbReady = false;
    switch (central.state) {
        case CBCentralManagerStatePoweredOff:
            break;
        case CBCentralManagerStatePoweredOn:
        {
//            NSArray *services = @[[CBUUID UUIDWithString:kServiceUUID]];
//            [_cbCM scanForPeripheralsWithServices:services options:@{CBCentralManagerScanOptionAllowDuplicatesKey:@YES }];
            [_cbCM scanForPeripheralsWithServices:nil options:nil];
            break;
        }
        case CBCentralManagerStateResetting:
            break;
        case CBCentralManagerStateUnauthorized:
            break;
        case CBCentralManagerStateUnknown:
            break;
        case CBCentralManagerStateUnsupported:
            break;
        default:
            break;
    }
}

- (void)centralManager:(CBCentralManager *)central didDiscoverPeripheral:(CBPeripheral *)peripheral advertisementData:(NSDictionary *)advertisementData RSSI:(NSNumber *)RSSI {
    
    BOOL replace = NO;
    // Match if we have this device from before
    for (int ii=0; ii < _nDevices.count; ii++) {
        CBPeripheral *p = [_nDevices objectAtIndex:ii];
        if ([p isEqual:peripheral]) {
            [_nDevices replaceObjectAtIndex:ii withObject:peripheral];
            replace = YES;
        }
    }
    if (!replace) {
        if ([peripheral.name hasPrefix:@"AiPlay"])
        {
            [_nDevices addObject:peripheral];
            
            _cbPeripheral = peripheral;
            
            [self.cbCM connectPeripheral:_cbPeripheral options:nil];
            
            NSString *btnTitle = [NSString stringWithFormat:@"Connect:%@", peripheral.name];
            [self.btnScaning setTitle:btnTitle forState:UIControlStateNormal];
        }
    }
}

- (void)centralManager:(CBCentralManager *)central didConnectPeripheral:(CBPeripheral *)peripheral {
    peripheral.delegate = self;
    [_cbPeripheral discoverServices:nil];
}

//已断开从机的链接
- (void)centralManager:(CBCentralManager *)central didDisconnectPeripheral:(CBPeripheral *)peripheral error:(NSError *)error {
    
}
- (void) centralManager:(CBCentralManager *)central didRetrievePeripherals:(NSArray *)peripherals {
    for(CBPeripheral *peripheral in peripherals) {
        
    }
}

- (void) centralManager:(CBCentralManager *)central didRetrieveConnectedPeripherals:(NSArray *)peripherals {
    for(CBPeripheral *peripheral in peripherals) {
        
    }
}

-(void) peripheral:(CBPeripheral *)peripheral didDiscoverServices:(NSError *)error{
    int i=0;
    for (CBService *s in peripheral.services) {
        [self.nServices addObject:s];
    }
    
    for (CBService *s in peripheral.services) {
        i++;
        [peripheral discoverCharacteristics:nil forService:s];
    }
}

//已搜索到Characteristic
-(void) peripheral:(CBPeripheral *)peripheral didDiscoverCharacteristicsForService:(CBService *)service error:(NSError *)error{
    
    for (CBCharacteristic *c in service.characteristics) {
        [_nCharacteristics addObject:c];
        
    }
}

-(void)writeCharacteristic:(CBPeripheral *)peripheral sUUID:(NSString *)sUUID cUUID:(NSString *)cUUID data:(NSData *)data {
    // Sends data to BLE peripheral to process HID and send EHIF command to PC
    for ( CBService *service in peripheral.services ) {
        if ([service.UUID isEqual:[CBUUID UUIDWithString:sUUID]])
        {
            NSLog(@"service.UUID = %@", service.UUID);
            for ( CBCharacteristic *characteristic in service.characteristics ) {
                NSLog(@"characteristic = %@", characteristic.UUID);
                if ([characteristic.UUID isEqual:[CBUUID UUIDWithString:cUUID]]) {
                    NSLog(@"data = %@", data);
                    /* EVERYTHING IS FOUND, WRITE characteristic ! */
                    [peripheral writeValue:data forCharacteristic:characteristic type:CBCharacteristicWriteWithResponse];
                }
            }
        }
    }
}

@end
