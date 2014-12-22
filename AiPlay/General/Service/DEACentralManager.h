//
//  APCentralManager.h
//  AiPlay
//
//  Created by wuhe on 14/12/21.
//  Copyright (c) 2014年 feefk. All rights reserved.
//

#import "YMSCBCentralManager.h"

@interface DEACentralManager : YMSCBCentralManager


+ (DEACentralManager *)initSharedServiceWithDelegate:(id)delegate;

+ (DEACentralManager *)sharedService;

@end
