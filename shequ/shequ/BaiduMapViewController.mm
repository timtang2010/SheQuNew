//
//  BaiduMapViewController.m
//  shequ
//
//  Created by yuxin tang on 14-5-4.
//  Copyright (c) 2014年 v5mcs. All rights reserved.
//

#import "BaiduMapViewController.h"

@interface BaiduMapViewController ()
{
    BMKPointAnnotation *pointAnnotation;
    BMKAnnotationView *newAnnotation;
    //当前所搜得地址的序号
    int addNum;
}
@property (strong, nonatomic) UISegmentedControl * uiscontrol;

@end

@implementation BaiduMapViewController


//- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
//{
//    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
//    if (self) {
//        // Custom initialization
//    }
//    return self;
//}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSArray *scarray = [[NSArray alloc] initWithObjects:@"显示",@"隐藏",@"定位",nil];
	self.uiscontrol = [[UISegmentedControl alloc] initWithItems:scarray];
    self.uiscontrol.frame = CGRectMake(198, 541, 120, 25);
    self.uiscontrol.tintColor = [UIColor redColor];//设置分段器的颜色
    self.uiscontrol.backgroundColor = [UIColor whiteColor];//背景颜色
    self.uiscontrol.momentary = NO;//点击后是否恢复原样
    [self.uiscontrol addTarget:self
                        action:@selector(select:)
              forControlEvents:UIControlEventValueChanged];
    self.uiscontrol.selectedSegmentIndex = 2;//默认选中
    [self.view addSubview:self.uiscontrol];
    
    self.mapView.delegate = self;
    
    self.mapView.showsUserLocation = YES;
    // 用于测试成功从 Storyboard 加载
    NSLog(@"BaiduMap From Storyborad");
    
     //控制是否显示指南针与比例尺
    self.mapView.showMapScaleBar = YES;
    
    //让分页栏显示在地图上
    [self.view insertSubview:self.uiscontrol aboveSubview:self.mapView];
    
    //搜索服务
    self.search = [[BMKSearch alloc]init];
    self.search.delegate = self;
    
    addNum = 0;
    [self searchWithOneAdd];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)searchWithOneAdd
{
    if (! self.add) {
        if (addNum < self.adds.count) {
            NSString *add = [self.adds objectAtIndex:addNum];
            BOOL flag = [self.search geocode:add withCity:@"上海"];
            if (! flag) {
                NSLog(@"第%d次搜索失败\n搜索地址为%@",addNum+1, add);
                return;
            }
        }
    }
    else {
        BOOL flag = [self.search geocode:self.add withCity:@"上海"];
        if (! flag) {
            NSLog(@"搜索失败:地址为%@",self.add);
        }
    }
}

-(void)viewWillAppear:(BOOL)animated {
    [_mapView viewWillAppear];
    self.mapView.delegate = self; // 此处记得不用的时候需要置nil，否则影响内存的释放
}

-(void)viewWillDisappear:(BOOL)animated
{
    [_mapView viewWillDisappear];
    self.mapView.delegate = nil;
    self.add = nil;
    self.adds = nil;
}


/**
 *在地图View将要启动定位时，会调用此函数
 *@param mapView 地图View
 */
- (void)mapViewWillStartLocatingUser:(BMKMapView *)mapView
{
	NSLog(@"start locate");
}

/**
 *用户位置更新后，会调用此函数
 *@param mapView 地图View
 *@param userLocation 新的用户位置
 */

- (void)mapView:(BMKMapView *)mapView didUpdateUserLocation:(BMKUserLocation *)userLocation
{
	if (userLocation != nil)
    {
		NSLog(@"%f %f", userLocation.location.coordinate.latitude, userLocation.location.coordinate.longitude);
	}
}


/**
 *在地图View停止定位后，会调用此函数
 *@param mapView 地图View
 */
- (void)mapViewDidStopLocatingUser:(BMKMapView *)mapView
{
    NSLog(@"stop locate");
}

/**
 *定位失败后，会调用此函数
 *@param mapView 地图View
 *@param error 错误号，参考CLError.h中定义的错误号
 */
- (void)mapView:(BMKMapView *)mapView didFailToLocateUserWithError:(NSError *)error
{
	if (error != nil)
    {
		NSLog(@"locate failed: %@", [error localizedDescription]);
    }
	else
    {
		NSLog(@"locate failed");
	}
}

//分页栏的方法
- (void)select:(id)sender {
    UISegmentedControl *control = (UISegmentedControl *)sender;
    switch (control.selectedSegmentIndex) {
        case 0:
            [self setartLocation:control];
            break;
        case 1:
            [self stopLocation:control];
            break;
        case 2:
            [self startFollowing:control];
            break;
            
        default:
            break;
    }
}

//显示
- (void)setartLocation:(UISegmentedControl *)sender
{
    NSLog(@"进入普通定位状态");
    self.mapView.showsUserLocation = NO;//先关闭显示定位图层
    self.mapView.userTrackingMode = BMKUserTrackingModeNone;//设定定位的状态
    self.mapView.showsUserLocation = YES;//显示定位图层
}

//隐藏
- (void)stopLocation:(UISegmentedControl *)sender
{
    self.mapView.userTrackingMode = BMKUserTrackingModeNone;
    self.mapView.showsUserLocation = NO;
}

//跟随
- (void)startFollowing:(UISegmentedControl *)sender
{
    NSLog(@"进入跟随状态");
    self.mapView.showsUserLocation = NO;
    self.mapView.userTrackingMode = BMKUserTrackingModeFollow;
    self.mapView.showsUserLocation = YES;
}

#pragma mark - 添加标注的方法
#pragma mark implement BMKMapViewDelegate
//根据anntation 生成对应的view
- (BMKAnnotationView *)mapView:(BMKMapView *)mapView viewForAnnotation:(id<BMKAnnotation>)annotation
{
    NSString *annitationViewID = @"renameMark";
    //类似大头针的效果
    BMKPinAnnotationView *anno = [[BMKPinAnnotationView alloc]initWithAnnotation:annotation
                                                                 reuseIdentifier:annitationViewID];
    //设置颜色
    anno.pinColor = BMKPinAnnotationColorPurple;
    //从天空掉落的效果
    anno.animatesDrop = YES;
    //设置可以拖拽
    newAnnotation.draggable = NO;
    
    //可以自定义标注的 image设置标注和弹出气泡的偏移量，设置标注是否有3d效果，设置标注，是否可以点击，设置标注是否可以弹出气泡等
    //更多设置详见inc/BMKAnnotationView.h
    return anno;
}

- (void)onGetAddrResult:(BMKSearch*)searcher result:(BMKAddrInfo*)result errorCode:(int)error
{
    if (error == 0) {
        BMKPointAnnotation *item = [[BMKPointAnnotation alloc]init];
        item.coordinate = result.geoPt;
        item.title = result.strAddr;
        [self.mapView addAnnotation:item];
        //这句的作用是把地图定位到搜索结果所在的位置
        if (addNum == 0) {
            self.mapView.centerCoordinate = result.geoPt;
        }
        //搜索结果反馈完成后，也就添加了一个大头针之后，吧地址序号累加，并进行下一次搜索
        if (! self.add) {
            addNum++;
            [self searchWithOneAdd];
        }
    }
    else{
        NSLog(@"检索失败，错误吧为%d",error);
    }
}

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
