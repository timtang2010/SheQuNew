//
//  MakeAppointmentViewController.h
//  shequ
//
//  Created by v5mcs006 on 14-4-26.
//  Copyright (c) 2014年 v5mcs. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MakeAppointmentViewController : UIViewController <UIPickerViewDataSource, UIPickerViewDelegate, UITextFieldDelegate, UITableViewDataSource, UITableViewDelegate>

@property (retain, nonatomic) IBOutlet UITextField * categoryTextField;
@property (strong, nonatomic) IBOutlet UITextField * detailTextField;

@property (retain, nonatomic)NSDictionary * dictionary;
@property (retain, nonatomic)UIPickerView * pickerView;

@property (strong, nonatomic) IBOutlet UITableView *tableView;
- (IBAction)PushBaiduMap:(id)sender;


@end
