//
//  APDirectionView.h
//  AiPlay
//
//  Created by wuhe on 14/12/12.
//  Copyright (c) 2014年 feefk. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "BaseXibView.h"

@interface APDirectionView : BaseXibView

@property (strong, nonatomic) IBOutlet UIView *viewBg;

@property (weak, nonatomic) IBOutlet UIImageView *imageViewLeftDirection;
@property (weak, nonatomic) IBOutlet UIImageView *imageViewRightDirection;

@end
