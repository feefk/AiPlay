//
//  DeviceAppearance.m
//  AiPlay
//
//  Created by wuhe on 14/12/8.
//  Copyright (c) 2014年 feefk. All rights reserved.
//

#import "DeviceAppearance.h"

@implementation DeviceAppearance

+ (void) commonInit {
    // 所有得navi bar颜色一致
    [[UINavigationBar appearance] setBarTintColor:[UIColor blackColor]];
    
    [[UINavigationBar appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObject:[UIColor whiteColor] forKey:NSForegroundColorAttributeName]];
}

@end
