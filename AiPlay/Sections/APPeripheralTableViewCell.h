//
//  APPeripheralTableViewCell.h
//  AiPlay
//
//  Created by wuhe on 14/12/21.
//  Copyright (c) 2014年 feefk. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface APPeripheralTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *rssiLabel;
@property (weak, nonatomic) IBOutlet UILabel *signalLabel;
@property (weak, nonatomic) IBOutlet UIButton *connectButton;
@property (weak, nonatomic) IBOutlet UILabel *dbLabel;
@property (weak, nonatomic) IBOutlet UILabel *peripheralStatusLabel;
@property (weak, nonatomic) IBOutlet UIImageView *peripheralIcon;
@property (weak, nonatomic) IBOutlet UIImageView *signalIcon;
@property (weak, nonatomic) IBOutlet UIImageView *peripheralStatusIcon;

- (IBAction)connectButtonAction:(id)sender;
@end
