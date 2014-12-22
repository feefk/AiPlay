//
//  APCapacityView.m
//  AiPlay
//
//  Created by wuhe on 14/12/14.
//  Copyright (c) 2014年 feefk. All rights reserved.
//

#import "APCapacityView.h"

#import "UtilsMacro.h"

@implementation APCapacityView

- (id) initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self addSubview:self.viewBg];
        
        [self loadConstraintsWithBackgroundView:self.viewBg];
    }
    
    return self;
}

//- (void) setCapacity:(float)capacity {
//    
//}

- (void) setColorViewBg:(UIColor *)colorViewBg {
    self.viewBg.backgroundColor = UIColorFromRGB(127, 130, 131);
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
