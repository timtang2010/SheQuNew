//
//  ProjectExpressFormViewController.h
//  shequ
//
//  Created by yuxin tang on 14-4-23.
//  Copyright (c) 2014年 v5mcs. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProjectExpressFormViewController : UIViewController<UIPickerViewDataSource,UIPickerViewDelegate,UITextFieldDelegate>
@property (strong, nonatomic) IBOutlet UITextField *name;
@property (strong, nonatomic) IBOutlet UISegmentedControl *gender;
@property (strong, nonatomic) IBOutlet UITextField *phone;
@property (strong, nonatomic) IBOutlet UITextField *service;
@property (retain, nonatomic) IBOutlet UITextField *area;
@property (strong, nonatomic) IBOutlet UITextField *details;
@property (strong, nonatomic) IBOutlet UITextField *address;
@property (strong, nonatomic) IBOutlet UITextField *claim;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *done;

@property (retain, nonatomic)NSDictionary *stateArea;
@property (retain, nonatomic)UIPickerView *cityPicker;

- (IBAction)slideFrameUp:(id)sender;
- (IBAction)slideFrameDown:(id)sender;
- (IBAction)closeKey:(id)sender;

- (IBAction)saveDone:(id)sender;
- (void)slideFrame:(BOOL)up ;

@end
