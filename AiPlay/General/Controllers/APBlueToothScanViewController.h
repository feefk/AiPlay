//
//  APBlueToothScanViewController.h
//  AiPlay
//
//  Created by wuhe on 14/12/21.
//  Copyright (c) 2014年 feefk. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "DEACentralManager.h"


@interface APBlueToothScanViewController : UIViewController <CBPeripheralDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableViewPeripheral;
@end
