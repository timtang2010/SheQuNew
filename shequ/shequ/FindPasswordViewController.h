//
//  FindPasswordViewController.h
//  shequ
//
//  Created by WEB08-V5MCS006 on 14-4-22.
//  Copyright (c) 2014年 v5mcs. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FindPasswordViewController : UIViewController

@property (strong, nonatomic) IBOutlet UITextField *accountTextField;
@property (strong, nonatomic) IBOutlet UITextField *emailTextField;

- (IBAction)textFieldDone:(id)sender;
- (IBAction)clickBackground:(id)sender;

@end
