//
//  BaiduMapViewController.h
//  shequ
//
//  Created by yuxin tang on 14-5-4.
//  Copyright (c) 2014年 v5mcs. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BMapKit.h"

@interface BaiduMapViewController : UIViewController<BMKMapViewDelegate,BMKSearchDelegate>
@property (strong, nonatomic) IBOutlet BMKMapView *mapView;
//搜索
@property (strong, nonatomic) BMKSearch *search;
//地址数组
@property (strong, nonatomic) NSArray *adds;
@property (strong, nonatomic) NSString *add;

@end
