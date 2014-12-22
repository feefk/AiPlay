//
//  APManualDirectionView.m
//  AiPlay
//
//  Created by wuhe on 14/12/15.
//  Copyright (c) 2014年 feefk. All rights reserved.
//

#import "APManualDirectionView.h"

#import "APMainViewController.h"

@interface APManualDirectionView () {

    CGSize _intrinsicContentSize;
}

@end

@implementation APManualDirectionView


- (id) initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self addSubview:self.backgroundView];
        
        [self loadConstraintsWithBackgroundView:self.backgroundView];
        
    }
    return self;
}

- (IBAction)btnLeftDown:(id)sender {
    [self.apMainVC btnManualDirection:0];
}
- (IBAction)btnRightDown:(id)sender {
    [self.apMainVC btnManualDirection:1];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
