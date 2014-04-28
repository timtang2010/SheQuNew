//
//  PolicyHelperTableViewController.h
//  shequ
//
//  Created by yuxin tang on 14-4-24.
//  Copyright (c) 2014年 v5mcs. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PolicyHelperScrollerView.h"

@interface PolicyHelperTableViewController : UITableViewController<UITableViewDataSource,UITableViewDelegate,ValueClickDelegate>


@property (strong, nonatomic) IBOutlet UITableView *menuTableView;
@property (strong, nonatomic) NSMutableArray *itemsInTable;
@property (strong, nonatomic) NSArray *items;
@property (strong, nonatomic) NSArray *urls;

@end
