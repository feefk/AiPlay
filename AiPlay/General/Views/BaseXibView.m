//
//  BaseXibView.m
//  AiPlay
//
//  Created by wuhe on 14/12/14.
//  Copyright (c) 2014年 feefk. All rights reserved.
//

#import "BaseXibView.h"

@implementation BaseXibView

- (id) initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        NSString *xibName = NSStringFromClass([self class]);
        [[NSBundle mainBundle] loadNibNamed:xibName owner:self options:nil];
        
    }
    return self;
}

- (void) loadConstraintsWithBackgroundView:(UIView *)backgroundView {
    backgroundView.translatesAutoresizingMaskIntoConstraints = NO;
    [self addConstraint:[NSLayoutConstraint constraintWithItem:backgroundView
                                                     attribute:NSLayoutAttributeLeft
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self
                                                     attribute:NSLayoutAttributeLeft
                                                    multiplier:0
                                                      constant:0
                         ]
     ];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:backgroundView
                                                     attribute:NSLayoutAttributeRight
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self
                                                     attribute:NSLayoutAttributeRight
                                                    multiplier:1
                                                      constant:0
                         ]
     ];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:backgroundView
                                                     attribute:NSLayoutAttributeTop
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self
                                                     attribute:NSLayoutAttributeTop
                                                    multiplier:0
                                                      constant:0
                         ]
     ];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:backgroundView
                                                     attribute:NSLayoutAttributeBottom
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self
                                                     attribute:NSLayoutAttributeBottom
                                                    multiplier:1
                                                      constant:0
                         ]
     ];
}

@end
