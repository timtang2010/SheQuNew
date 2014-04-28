//
//  ProjectExpressTableViewController.m
//  shequ
//
//  Created by yuxin tang on 14-4-23.
//  Copyright (c) 2014年 v5mcs. All rights reserved.
//

#import "ProjectExpressTableViewController.h"

@interface ProjectExpressTableViewController ()

@end

@implementation ProjectExpressTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //接收上级传递的值
    self.navigationItem.title = self.msg;
    
    //加载字典文件
    NSBundle * bundle = [NSBundle mainBundle];
    NSString * path = [bundle pathForResource:@"ProjectExpressList" ofType:@"plist"];
    
    self.dictData = [[NSDictionary alloc]initWithContentsOfFile:path];
    self.listData = [self.dictData allKeys];
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
    return [self.listData count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * identifier = @"Cell";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
    cell.textLabel.text = [self.listData objectAtIndex:[indexPath row]];
    
    return cell;
}

@end
