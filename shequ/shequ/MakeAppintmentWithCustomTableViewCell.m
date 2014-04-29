//
//  MakeAppintmentWithCustomTableViewCell.m
//  shequ
//
//  Created by v5mcs006 on 14-4-28.
//  Copyright (c) 2014年 v5mcs. All rights reserved.
//

#import "MakeAppintmentWithCustomTableViewCell.h"

@implementation MakeAppintmentWithCustomTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        UILabel * address = [[UILabel alloc]initWithFrame:CGRectMake(128, 39, 51, 21)];
        address.text = @"地址：";
        address.font = [UIFont systemFontOfSize:11];
        address.textColor = [UIColor lightGrayColor];
        [self.contentView addSubview:address];
        
        self.companyImage = [[UIImageView alloc]initWithFrame:CGRectMake(5, 10, 65, 50)];
        [self.companyImage setImage:[UIImage imageNamed:@"dianping.com.png"]];
        [self.contentView addSubview:self.companyImage];
        
        self.companyName = [[UILabel alloc]initWithFrame:CGRectMake(78, 10, 150, 21)];
        self.companyName.text = @"上海同馨贸易有限公司";
        self.companyName.textColor = [UIColor blackColor];
        self.companyName.font = [UIFont systemFontOfSize:11];
        self.companyName.textAlignment = NSTextAlignmentLeft;
        [self.contentView addSubview:self.companyName];
        
        self.category = [[UILabel alloc]initWithFrame:CGRectMake(78, 39, 38, 18)];
        self.category.textColor = [UIColor whiteColor];
        self.category.backgroundColor = [UIColor orangeColor];
        self.category.font = [UIFont systemFontOfSize:11];
        self.category.textAlignment = NSTextAlignmentCenter;
        self.category.text = @"家政";
        [self.contentView addSubview:self.category];
        
        self.distanceFromHere = [[UILabel alloc]initWithFrame:CGRectMake(190, 10, 100, 21)];
        self.distanceFromHere.textColor = [UIColor lightGrayColor];
        self.distanceFromHere.text = @"9999m";
        self.distanceFromHere.font = [UIFont systemFontOfSize:11];
        self.distanceFromHere.textAlignment = NSTextAlignmentRight;
        [self.contentView addSubview:self.distanceFromHere];
        
        self.companyAddress = [[UILabel alloc]initWithFrame:CGRectMake(172, 39, 200, 21)];
        self.companyAddress.text = @"上海市东陆路2000号";
        self.companyAddress.font = [UIFont systemFontOfSize:11];
        self.companyAddress.textColor = [UIColor lightGrayColor];
        self.companyAddress.textAlignment = NSTextAlignmentLeft;
        [self.contentView addSubview:self.companyAddress];
        
        self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
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

@end