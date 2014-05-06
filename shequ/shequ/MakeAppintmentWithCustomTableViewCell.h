//
//  MakeAppintmentWithCustomTableViewCell.h
//  shequ
//
//  Created by v5mcs006 on 14-4-28.
//  Copyright (c) 2014年 v5mcs. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MakeAppintmentWithCustomTableViewCell : UITableViewCell

/*
@property (strong, nonatomic) UILabel * companyName;
@property (strong, nonatomic) UILabel * companyAddress;
@property (strong, nonatomic) UILabel * distanceFromHere;
@property (strong, nonatomic) UILabel * category;
@property (strong, nonatomic) UIImageView * companyImage;
*/

@property (strong, nonatomic) IBOutlet UIImageView *YYImage;
@property (strong, nonatomic) IBOutlet UILabel *YYName;
@property (strong, nonatomic) IBOutlet UILabel *yyAddress;
@property (strong, nonatomic) IBOutlet UILabel *YYPhone;

@end
