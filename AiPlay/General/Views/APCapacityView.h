//
//  APCapacityView.h
//  AiPlay
//
//  Created by wuhe on 14/12/14.
//  Copyright (c) 2014年 feefk. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "BaseXibView.h"

@interface APCapacityView : BaseXibView

@property (strong, nonatomic) IBOutlet UIView *viewBg;
@property (weak, nonatomic) IBOutlet UIView *viewCapacity;

@property float capacity;

@property (strong, nonatomic) UIColor *colorViewBg;
@property (strong, nonatomic) UIColor *colorViewCapacity;

@end
