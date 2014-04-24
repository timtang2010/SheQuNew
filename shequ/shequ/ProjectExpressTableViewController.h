//
//  ProjectExpressTableViewController.h
//  shequ
//
//  Created by yuxin tang on 14-4-23.
//  Copyright (c) 2014年 v5mcs. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProjectExpressTableViewController : UITableViewController<UITableViewDataSource,UITableViewDelegate>
@property (strong, nonatomic) IBOutlet UITableView *TableView;
@property (strong, nonatomic) NSString *msg;
@property (strong, nonatomic) NSDictionary *dictData;
@property (strong, nonatomic) NSArray *listData;


@end
