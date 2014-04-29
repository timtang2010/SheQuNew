//
//  ViewController.m
//  shequ
//
//  Created by WEB08-V5MCS006 on 14-4-21.
//  Copyright (c) 2014年 v5mcs. All rights reserved.
//

#import "ViewController.h"
#import "RootTabBarController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidAppear:(BOOL)animated {
    // all settings are basic, pages with custom packgrounds, title image on each page
    [self showIntroWithCrossDissolve];
    
}

//展示介绍与叠
- (void)showIntroWithCrossDissolve {
    EAIntroPage *page1 = [EAIntroPage page];
    page1.bgImage = [UIImage imageNamed:@"导航图1.jpg"];
    
    EAIntroPage *page2 = [EAIntroPage page];
    page2.bgImage = [UIImage imageNamed:@"导航图2.jpg"];
    
    EAIntroPage *page3 = [EAIntroPage page];;
    page3.bgImage = [UIImage imageNamed:@"导航图3.jpg"];
    
    EAIntroPage *page4 = [EAIntroPage page];
    page4.bgImage = [UIImage imageNamed:@"导航图4.jpg"];
    
    EAIntroPage *page5 = [EAIntroPage page];;
    page5.bgImage = [UIImage imageNamed:@"导航图5.jpg"];
    
    
    EAIntroView *intro = [[EAIntroView alloc] initWithFrame:self.view.bounds
                                                   andPages:@[page1,page2,page3,page4,page5]];
    
    [intro setDelegate:self];
    [intro showInView:self.view animateDuration:0.0];
}

//引导页面跳转
- (void)introDidFinish {
//    NSLog(@"Intro callback");
    [[NSUserDefaults standardUserDefaults] setBool:NO forKey:@"firstLaunch"];
    UIStoryboard * storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    RootTabBarController * rootTabBarController = [storyboard instantiateViewControllerWithIdentifier:@"RootTabBarController"];
    self.view.window.rootViewController = rootTabBarController;
}

@end
