//
//  APMoveView.m
//  AiPlay
//
//  Created by wuhe on 14/12/21.
//  Copyright (c) 2014年 feefk. All rights reserved.
//

#import "APMoveView.h"
#import "APMainViewController.h"

@implementation APMoveView

- (id) initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self addSubview:self.backgroundView];
        
        [self loadConstraintsWithBackgroundView:self.backgroundView];
        
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (IBAction)btnForwardDown:(id)sender {
    [self.apMainVC btnMove:0];
}

- (IBAction)btnBackwardDown:(id)sender {
    [self.apMainVC btnMove:1];
}

@end
