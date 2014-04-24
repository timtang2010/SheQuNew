//
//  MySettingTableViewController.h
//  shequ
//
//  Created by WEB08-V5MCS006 on 14-4-22.
//  Copyright (c) 2014年 v5mcs. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ChangeSex <NSObject>

- (void)changeSex:(NSUInteger)sexNumber;

@end

@interface MySettingTableViewController : UITableViewController <UITextFieldDelegate, ChangeSex, UIAlertViewDelegate>

@property (strong, nonatomic) IBOutlet UITextField *nickNameTextField;
@property (strong, nonatomic) IBOutlet UITextField *sexTextField;
@property (strong, nonatomic) IBOutlet UITextField *birthdayTextField;
@property (strong, nonatomic) IBOutlet UITextField *realNameTextField;
@property (strong, nonatomic) IBOutlet UITextField *phoneTextField;
@property (strong, nonatomic) IBOutlet UITextField *areaTextField;
@property (strong, nonatomic) IBOutlet UITextField *villageTextField;
@property (strong, nonatomic) IBOutlet UITextField *detailAddressTextField;

@property (strong, nonatomic) UIDatePicker * datePicker;
@property (strong, nonatomic) NSLocale * dateLocale;

- (IBAction)textFieldDone:(id)sender;
- (IBAction)saveData:(id)sender;

@end
