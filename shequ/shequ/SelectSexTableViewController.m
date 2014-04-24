//
//  SelectSexTableViewController.m
//  shequ
//
//  Created by WEB08-V5MCS006 on 14-4-22.
//  Copyright (c) 2014年 v5mcs. All rights reserved.
//

#import "SelectSexTableViewController.h"
#import "MySettingTableViewController.h"

@interface SelectSexTableViewController ()

@end

@implementation SelectSexTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.array = @[@"男", @"女", @"保密"];
    
    self.oldRow = -1;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.array count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * identifier = @"identifier";
    
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    
    cell.textLabel.text = [self.array objectAtIndex:[indexPath row]];
    cell.textLabel.textColor = [UIColor grayColor];
    cell.textLabel.font = [UIFont systemFontOfSize:17];
    
    if ([indexPath row] == self.oldRow)
    {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    }
    else
    {
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSIndexPath * oldIndexPath = [NSIndexPath indexPathForRow:self.oldRow inSection:0];
    UITableViewCell * cell = [tableView cellForRowAtIndexPath:oldIndexPath];
    cell.accessoryType = UITableViewCellAccessoryNone;
    
    self.oldRow = [indexPath row];
    UITableViewCell * newCell = [tableView cellForRowAtIndexPath:indexPath];
    newCell.accessoryType = UITableViewCellAccessoryCheckmark;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 48;
}

- (IBAction)selectSexDone:(id)sender
{
    //点击确定之后，就让协议改变自己的性别
    //传递的参数无所谓，直接字符串也可以
    [self.delegate changeSex:[self.tableView indexPathForSelectedRow].row];
    
    [self.navigationController popViewControllerAnimated:YES];
}

@end
