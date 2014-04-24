//
//  FeedbackViewController.h
//  shequ
//
//  Created by WEB08-V5MCS006 on 14-4-24.
//  Copyright (c) 2014年 v5mcs. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CPTextViewPlaceholder.h"

@interface FeedbackViewController : UIViewController

@property (strong, nonatomic) IBOutlet CPTextViewPlaceholder *textView;
@property (strong, nonatomic) IBOutlet UITextField *textField;

- (IBAction)clickBackground:(id)sender;
- (IBAction)textFieldDone:(id)sender;
- (IBAction)sendMessage:(id)sender;

@end
