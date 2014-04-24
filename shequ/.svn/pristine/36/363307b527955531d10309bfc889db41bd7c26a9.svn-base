//
//  OrderEvaluateWithCustomTableViewCell.m
//  shequ
//
//  Created by WEB08-V5MCS006 on 14-4-24.
//  Copyright (c) 2014年 v5mcs. All rights reserved.
//

#import "OrderEvaluateWithCustomTableViewCell.h"

@implementation OrderEvaluateWithCustomTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        self.label = [[UILabel alloc]initWithFrame:CGRectMake(20, 8, 80, 30)];
        self.label.textColor = [UIColor lightGrayColor];
        [self.contentView addSubview:self.label];
        
        self.tapRateView = [[RSTapRateView alloc]initWithFrame:CGRectMake(100, 0, 212, 42)];
        self.tapRateView.delegate = self;
        [self.contentView addSubview:self.tapRateView];
    }
    
    return self;
}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (void)tapDidRateView:(RSTapRateView *)view rating:(NSInteger)rating
{
    NSLog(@"Current Rating: %d", rating);
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    [self.tapRateView clean];
}

@end