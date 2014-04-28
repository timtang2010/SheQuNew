//
//  PolicyHelperTableViewController.m
//  shequ
//
//  Created by yuxin tang on 14-4-24.
//  Copyright (c) 2014年 v5mcs. All rights reserved.
//

#import "PolicyHelperTableViewController.h"
#import "PolicyHelperTableViewCell.h"
#import "PolicyHelperDetailsViewController.h"
#import "ProjectExpressScrollerView.h"

@interface PolicyHelperTableViewController (){
    NSMutableArray *arrayForBool;
    NSMutableArray *sectionTitleArray;
    NSMutableDictionary *sectionContentDict;
}

@end

@implementation PolicyHelperTableViewController

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
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    NSDictionary *dict = [[NSDictionary alloc]initWithContentsOfFile:
                          [[NSBundle mainBundle]pathForResource:@"PolicyHelper" ofType:@"plist"]];
    self.items = [dict valueForKey:@"Items"];
    self.itemsInTable = [[NSMutableArray alloc]init];
    [self.itemsInTable addObjectsFromArray:self.items];
    
    self.title = @"政策助手";
    
    //设置网络图片
    NSMutableArray *webImageArray = [[NSMutableArray alloc]initWithObjects:
                                     @"http://203.156.251.85/sqmis/uploads//imgs/20140421152444683.jpg",
                                     @"http://203.156.251.85/sqmis/uploads//imgs/2014042115222597.jpg",
                                     @"http://203.156.251.85/sqmis/uploads//imgs/20140421144958682.png",
                                     @"http://203.156.251.85/sqmis/uploads//imgs/20140421143756500.jpg",
                                     @"http://203.156.251.85/sqmis/uploads//imgs/20140421143424427.jpg",
                                     nil];
    //设置网络标题
    NSMutableArray *WebImageName = [[NSMutableArray alloc]initWithObjects:
                                    @"(党务)党总支居民半月谈活动",
                                    @"(党务)党总支为民服务月活动",
                                    @"观三林老街的变化",
                                    @"开展党的群众路线教育实践活动之六",
                                    @"殷行街道生活服务中心举行大龄青年家长免费咨询会",
                                    nil];
    // 这里是跳转的链接
    self.urls = @[@"http://www.baidu.com",
                  @"http://www.google.com",
                  @"http://www.bing.com",
                  @"http://www.soso.com",
                  @"http://www.sougou.com"];
    
    //初始化自定义ScrollView类对象 并设置图片的高度 height = 179
    //    AOScrollerView *aSV = [[AOScrollerView alloc]initWithNameArr:webImageArray titleArr:WebImageName height:179];
    //    CGRect frame = [self.view viewWithTag:322].frame;
    //    frame = CGRectMake(frame.origin.x + 3, frame.origin.y, frame.size.width - 3*2, frame.size.height);
    //    PolicyHelperScrollerView *aSV = [[PolicyHelperScrollerView alloc]initWithNameArr:webImageArray
    //                                                        titleArr:WebImageName
    //                                                           frame:frame];
    //    aSV.clipsToBounds = YES;
    //
    //    //设置委托
    //    aSV.vDelegate = self;
    CGRect frame = [self.view viewWithTag:322].frame;
    frame = CGRectMake(frame.origin.x + 3, frame.origin.y, frame.size.width - 3*2, frame.size.height);
    ProjectExpressScrollerView *aSV = [[ProjectExpressScrollerView alloc]initWithNameArr:webImageArray
                                                                                titleArr:WebImageName
                                                                                   frame:frame];
    
    //设置委托
    aSV.vDelegate = self;
    
    //添加进入View
    [self.view addSubview:aSV];
    
}

#pragma AOScrollViewDelegate
//点击图片的响应事件
-(void)buttonClick:(int)vid{
    NSLog(@"%d",vid);
    //手动创建一个页面
    UIViewController *webViewController = [[UIViewController alloc]init];
    //页面的大小跟当前windows的大小一样
    webViewController.view.frame = self.view.window.frame;
    //创建一个webView,大小依然一样
    UIWebView *webView = [[UIWebView alloc]initWithFrame:webViewController.view.frame];
    
    //根据Vib， 也就是当前点击图片的序号从urls中找出链接，加载webView
    [webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:[self.urls objectAtIndex:vid]]]];
    //将webView添加到创建的页面中
    [webViewController.view addSubview:webView];
    
    [self.navigationController pushViewController:webViewController animated:YES];
    
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    //#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return [self.itemsInTable count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *Title= [[self.itemsInTable objectAtIndex:indexPath.row] valueForKey:@"Name"];
    return [self createCellWithTitle:Title image:[[self.itemsInTable objectAtIndex:indexPath.row] valueForKey:@"Image name"] indexPath:indexPath];
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSDictionary *dic=[self.itemsInTable objectAtIndex:indexPath.row];
    PolicyHelperTableViewCell *cell = (PolicyHelperTableViewCell *)[tableView cellForRowAtIndexPath:indexPath];
    if([dic valueForKey:@"SubItems"])
    {
        NSArray *arr=[dic valueForKey:@"SubItems"];
        BOOL isTableExpanded=NO;
        
        for(NSDictionary *subitems in arr )
        {
            NSInteger index=[self.itemsInTable indexOfObjectIdenticalTo:subitems];
            isTableExpanded=(index>0 && index!=NSIntegerMax);
            if(isTableExpanded) break;
        }
        
        cell.isOpened = !isTableExpanded;
        [cell.btnExpand setImage:(cell.isOpened ? [UIImage imageNamed:@"carat-open.png"] : [UIImage imageNamed:@"carat.png"]) forState:UIControlStateNormal];
        // 关闭二级table
        if(isTableExpanded)
        {
            [self CollapseRows:arr];
        }
        // 打开二级table
        else
        {
            NSUInteger count=indexPath.row+1;
            NSMutableArray *arrCells=[NSMutableArray array];
            for(NSDictionary *dInner in arr )
            {
                [arrCells addObject:[NSIndexPath indexPathForRow:count inSection:0]];
                [self.itemsInTable insertObject:dInner atIndex:count++];
            }
            [self.menuTableView insertRowsAtIndexPaths:arrCells withRowAnimation:UITableViewRowAnimationLeft];
        }
    }
    if ([cell indentationLevel] == 0)
        return;
    
    //获取UIStoryboard
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    PolicyHelperDetailsViewController *viewController = [storyboard instantiateViewControllerWithIdentifier:@"PolicyHelperTableViewController"];
    //传表头的代码
    viewController.title = [sectionTitleArray objectAtIndex:indexPath.section];
    //传值的代码
    viewController.detailItem = [[sectionContentDict valueForKey:
                                  [sectionTitleArray objectAtIndex:indexPath.section]]
                                 objectAtIndex:indexPath.row];
    
    [self.navigationController pushViewController:viewController animated:YES];
}

-(void)CollapseRows:(NSArray*)ar
{
	for(NSDictionary *dInner in ar )
    {
		NSUInteger indexToRemove=[self.itemsInTable indexOfObjectIdenticalTo:dInner];
		NSArray *arInner=[dInner valueForKey:@"SubItems"];
		if(arInner && [arInner count]>0)
        {
			[self CollapseRows:arInner];
		}
		
		if([self.itemsInTable indexOfObjectIdenticalTo:dInner]!=NSNotFound)
        {
			[self.itemsInTable removeObjectIdenticalTo:dInner];
			[self.menuTableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:
                                                        [NSIndexPath indexPathForRow:indexToRemove inSection:0]
                                                        ]
                                      withRowAnimation:UITableViewRowAnimationLeft];
        }
	}
}

- (UITableViewCell*)createCellWithTitle:(NSString *)title image:(UIImage *)image  indexPath:(NSIndexPath*)indexPath
{
    NSString *CellIdentifier = @"Cell";
    PolicyHelperTableViewCell* cell = [self.menuTableView dequeueReusableCellWithIdentifier:CellIdentifier];
    UIView *bgView = [[UIView alloc] init];
    bgView.backgroundColor = [UIColor grayColor];
    cell.selectedBackgroundView = bgView;
    cell.lblTitle.text = title;
    cell.lblTitle.textColor = [UIColor blackColor];
    
    [cell setIndentationLevel:[[[self.itemsInTable objectAtIndex:indexPath.row] valueForKey:@"level"] intValue]];
    cell.indentationWidth = 25;
    
    float indentPoints = cell.indentationLevel * cell.indentationWidth;
    
    cell.contentView.frame = CGRectMake(indentPoints,cell.contentView.frame.origin.y,cell.contentView.frame.size.width - indentPoints,cell.contentView.frame.size.height);
    
#pragma mark 加载过滤第一条的方法
    //加载下面的方法
    UITapGestureRecognizer *headerTapped = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(sectionHeaderTapped:)];
    [bgView addGestureRecognizer:headerTapped];
    
    NSDictionary *d1=[self.itemsInTable objectAtIndex:indexPath.row] ;
    
    if([d1 valueForKey:@"SubItems"])
    {
        cell.btnExpand.alpha = 1.0;
        [cell.btnExpand setImage:(cell.isOpened ? [UIImage imageNamed:@"carat-open.png"] : [UIImage imageNamed:@"carat.png"]) forState:UIControlStateNormal];
        
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        
        [cell.btnExpand addTarget:self action:@selector(showSubItems:) forControlEvents:UIControlEventTouchUpInside];
        //解决大类不显示箭头
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    else
    {
        cell.btnExpand.alpha = 0.0;
        //小类箭头显示不正常
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    return cell;
}

-(void)showSubItems :(id) sender
{
    UIButton *btn = (UIButton*)sender;
    CGRect buttonFrameInTableView = [btn convertRect:btn.bounds toView:self.menuTableView];
    NSIndexPath *indexPath = [self.menuTableView indexPathForRowAtPoint:buttonFrameInTableView.origin];
    
    NSDictionary *d=[self.itemsInTable objectAtIndex:indexPath.row] ;
    NSArray *arr=[d valueForKey:@"SubItems"];
    if([d valueForKey:@"SubItems"])
    {
        BOOL isTableExpanded=NO;
        for(NSDictionary *subitems in arr )
        {
            NSInteger index=[self.itemsInTable indexOfObjectIdenticalTo:subitems];
            isTableExpanded=(index>0 && index!=NSIntegerMax);
            if(isTableExpanded) break;
        }
        
        UIView * superView = [btn superview];
        while (![[superView class] isSubclassOfClass:[UITableViewCell class]])
        {
            superView = [superView superview];
        }
        PolicyHelperTableViewCell *cell = (PolicyHelperTableViewCell *)superView;
        cell.isOpened = !isTableExpanded;
        [cell.btnExpand setImage:(cell.isOpened ? [UIImage imageNamed:@"carat-open.png"] : [UIImage imageNamed:@"carat.png"]) forState:UIControlStateNormal];
        if(isTableExpanded)
        {
            [self CollapseRows:arr];
        }
        else
        {
            NSUInteger count=indexPath.row+1;
            NSMutableArray *arrCells=[NSMutableArray array];
            for(NSDictionary *dInner in arr )
            {
                [arrCells addObject:[NSIndexPath indexPathForRow:count inSection:0]];
                [self.itemsInTable insertObject:dInner atIndex:count++];
            }
            [self.menuTableView insertRowsAtIndexPaths:arrCells withRowAnimation:UITableViewRowAnimationLeft];
        }
    }
    
    
}

//
- (void)sectionHeaderTapped:(UITapGestureRecognizer *)gestureRecognizer {
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:gestureRecognizer.view.tag];
    
    //只有第0列可以展开
    if (indexPath.row == 0) {
        
        //设置cell的打开关闭状态的代码
        BOOL collapsed = [[arrayForBool objectAtIndex:indexPath.section]boolValue];
        collapsed = !collapsed;
        
        [arrayForBool replaceObjectAtIndex:indexPath.section withObject:[NSNumber numberWithBool:collapsed]];
        
        //动画加载特定部分
        NSRange range = NSMakeRange(indexPath.section, 0);
        NSIndexSet *sectionToReload = [NSIndexSet indexSetWithIndexesInRange:range];
        [self.tableView reloadSections:sectionToReload withRowAnimation:UITableViewRowAnimationFade];
    }
}


/*
 // Override to support conditional editing of the table view.
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the specified item to be editable.
 return YES;
 }
 */

/*
 // Override to support editing the table view.
 - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
 {
 if (editingStyle == UITableViewCellEditingStyleDelete) {
 // Delete the row from the data source
 [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
 } else if (editingStyle == UITableViewCellEditingStyleInsert) {
 // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
 }
 }
 */

/*
 // Override to support rearranging the table view.
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
 {
 }
 */

/*
 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the item to be re-orderable.
 return YES;
 }
 */

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
 {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
