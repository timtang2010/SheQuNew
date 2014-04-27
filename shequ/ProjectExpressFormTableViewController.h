//
//  ProjectExpressFormTableViewController.h
//  shequ
//
//  Created by WEB08-V5MCS006 on 14-4-24.
//  Copyright (c) 2014年 v5mcs. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProjectExpressFormTableViewController : UITableViewController <UIPickerViewDataSource, UIPickerViewDelegate, UITextFieldDelegate, UIAlertViewDelegate>

@property (strong, nonatomic) IBOutlet UITextField * nameTextField;
@property (strong, nonatomic) IBOutlet UISegmentedControl * genderTextField;
@property (strong, nonatomic) IBOutlet UITextField * phoneTextField;
@property (strong, nonatomic) IBOutlet UITextField * serviceTextField;
@property (retain, nonatomic) IBOutlet UITextField * areaTextField;
@property (strong, nonatomic) IBOutlet UITextField * detailTextField;
@property (strong, nonatomic) IBOutlet UITextField * addressTextField;
@property (strong, nonatomic) IBOutlet UITextField * claimTextField;
@property (strong, nonatomic) IBOutlet UIBarButtonItem * done;

@property (retain, nonatomic)NSDictionary * stateArea;
@property (retain, nonatomic)UIPickerView * cityPicker;

- (IBAction)slideFrameUp:(id)sender;
- (IBAction)slideFrameDown:(id)sender;
- (IBAction)closeKey:(id)sender;

- (IBAction)saveDone:(id)sender;
- (void)slideFrame:(BOOL)up ;

@end
