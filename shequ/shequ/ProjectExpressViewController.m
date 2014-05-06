//
//  ProjectExpressViewController.m
//  shequ
//
//  Created by yuxin tang on 14-4-22.
//  Copyright (c) 2014年 v5mcs. All rights reserved.
//

#import "ProjectExpressViewController.h"
#import "ProjectExpressTableViewController.h"
#import "MakeAppointmentViewController.h"

@interface ProjectExpressViewController ()

@end

@implementation ProjectExpressViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
    
}



- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
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
    ProjectExpressScrollerView *aSV = [[ProjectExpressScrollerView alloc]initWithNameArr:webImageArray
                                                        titleArr:WebImageName
                                                           frame:[self.view viewWithTag:321].frame];
    
    //设置委托
    aSV.vDelegate = self;
    
    //添加进入View
    [self.view addSubview:aSV];
    
    self.title = @"项目快车";
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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

//点击项目，按钮文字传值

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"GGFW"]|
        [segue.identifier isEqualToString:@"GYFW"]|
        [segue.identifier isEqualToString:@"JZFWXM"]|
        [segue.identifier isEqualToString:@"JZFWXM"]|
        [segue.identifier isEqualToString:@"DQWXXM"]|
        [segue.identifier isEqualToString:@"WYWXXM"]|
        [segue.identifier isEqualToString:@"QTFW"])
    {
        ProjectExpressTableViewController *detailViewController = segue.destinationViewController;
        UIButton *btn = (UIButton *)sender;
        //预传递值
        detailViewController.msg = btn.titleLabel.text;
        
    }
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}



- (IBAction)pushmakeAnAppointment:(id)sender {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main"
                                                         bundle:nil];
    MakeAppointmentViewController * makeAppointmentViewController =[storyboard instantiateViewControllerWithIdentifier:@"MakeAppointmentViewController"];
    
    //指定页面隐藏TabBar
    makeAppointmentViewController.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:makeAppointmentViewController
                                         animated:YES];
}
@end
