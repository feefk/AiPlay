//
//  APManualDirectionView.h
//  AiPlay
//
//  Created by wuhe on 14/12/15.
//  Copyright (c) 2014年 feefk. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseXibView.h"


@class APMainViewController;

@interface APManualDirectionView : BaseXibView

@property (strong, nonatomic) IBOutlet UIView *backgroundView;

@property (weak, nonatomic) APMainViewController *apMainVC;

@end
