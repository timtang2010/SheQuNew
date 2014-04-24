//
//  SelectSexTableViewController.h
//  shequ
//
//  Created by WEB08-V5MCS006 on 14-4-22.
//  Copyright (c) 2014年 v5mcs. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ChangeSex;//声明协议，方便创建代理

@interface SelectSexTableViewController : UITableViewController

@property (strong, nonatomic) NSArray * array;
@property (assign, nonatomic) NSInteger oldRow;
@property (weak, nonatomic) id <ChangeSex> delegate;//创建弱引用的代理，实现改变性别的协议

- (IBAction)selectSexDone:(id)sender;

@end
