//
//  APBlueToothScanViewController.m
//  AiPlay
//
//  Created by wuhe on 14/12/21.
//  Copyright (c) 2014年 feefk. All rights reserved.
//

#import "APBlueToothScanViewController.h"

#import "APPeripheralTableViewCell.h"
#import "UtilsMacro.h"


@interface APBlueToothScanViewController () <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UIButton *btnScaning;

@property BOOL beginScan;

@end

@implementation APBlueToothScanViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _tableViewPeripheral.delegate = self;
    _tableViewPeripheral.dataSource = self;
    
    _tableViewPeripheral.backgroundColor = RGB(29, 31, 37);
    
    DEACentralManager *centralManager = [DEACentralManager initSharedServiceWithDelegate:self];
    
    
    self.beginScan = NO;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btnScaningPressed:(id)sender {
    self.beginScan = !self.beginScan;
    
    [self scanStatusChange:_beginScan];
}

- (void)scanStatusChange:(BOOL)scanFlag {
    if (scanFlag) {
        [_btnScaning setTitle:@"Stop Scanning" forState:UIControlStateNormal];
    } else {
        [_btnScaning setTitle:@"Start Scanning" forState:UIControlStateNormal];
    }
}

#pragma mark - UITableViewDelegate and UITableViewDataSource methods
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    APPeripheralTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"APPeripheralTableViewCell" ];
    
    if (cell == nil){
        
        NSArray *nibArray = [[NSBundle mainBundle] loadNibNamed:@"APPeripheralTableViewCell" owner:self options:nil];
        cell = (APPeripheralTableViewCell *)[nibArray objectAtIndex:0];
        
    }
    
    cell.backgroundColor = RGB(29, 31, 37);
    return cell;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    CGFloat result;
    result = 125.0;
    return result;
}


@end
