//
//  APDirectionView.m
//  AiPlay
//
//  Created by wuhe on 14/12/12.
//  Copyright (c) 2014年 feefk. All rights reserved.
//

#import "APDirectionView.h"

@implementation APDirectionView

- (id) initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self addSubview:self.viewBg];
        
        [self loadConstraintsWithBackgroundView:self.viewBg];
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

@end
