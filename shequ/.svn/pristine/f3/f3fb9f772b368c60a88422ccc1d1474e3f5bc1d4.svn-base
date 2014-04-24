//
//  MySettingTableViewController.m
//  shequ
//
//  Created by WEB08-V5MCS006 on 14-4-22.
//  Copyright (c) 2014年 v5mcs. All rights reserved.
//

#import "MySettingTableViewController.h"
#import "SelectSexTableViewController.h"

@interface MySettingTableViewController ()

@end

@implementation MySettingTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self configAllTextField];
    [self configBirthdayTextField];
}

- (void)configBirthdayTextField
{
    self.datePicker = [[UIDatePicker alloc]init];
    //用标示符初始化本地化信息
    self.dateLocale = [[NSLocale alloc]initWithLocaleIdentifier:@"zh_CN"];
    //设置 UIDatePicker 本地化语言
    self.datePicker.locale = self.dateLocale;
    //设置时区
    self.datePicker.timeZone = [NSTimeZone timeZoneWithName:@"GMT"];
    //设置 UIDatePicker 的显示模式
    self.datePicker.datePickerMode = UIDatePickerModeDate;
    //设置显示最大时间（本地时间）
    [self.datePicker setMaximumDate:[NSDate date]];
    //设置显示的最小时间 1900-1-1
    NSDateComponents * components = [[NSDateComponents alloc] init];
    [components setMonth:1];
    [components setDay:1];
    [components setYear:1900];
    NSCalendar * calender = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    self.datePicker.minimumDate = [calender dateFromComponents:components];
    //重点：將 UITextField 的 inputView 属性设定成 UIDatePicker，原本弹出键盘则会改为选择日期
    self.birthdayTextField.inputView = self.datePicker;
    UIToolbar * toolBar = [[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, 320, 44)];
    UIBarButtonItem * barButtonItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemDone
                                                                                   target:self
                                                                                   action:@selector(donePicker)];
    toolBar.items = [NSArray arrayWithObject:barButtonItem];
    //重点：原本应该是键盘上方附带内同的区块，改成一个 UIToolbar 并加上完成按钮
    self.birthdayTextField.inputAccessoryView = toolBar;
}

- (void)donePicker
{
    if ([self.view endEditing:NO])
    {
        NSDateFormatter * formatter = [[NSDateFormatter alloc] init];
        [formatter setDateFormat:@"yyyy-MM-dd"];
        [formatter setLocale:self.dateLocale];
        self.birthdayTextField.text = [NSString stringWithFormat:@"%@",[formatter stringFromDate:self.datePicker.date]];
    }
}

- (void)configAllTextField
{
    self.nickNameTextField.font = [UIFont systemFontOfSize:17];
    self.nickNameTextField.textColor = [UIColor blackColor];
    self.nickNameTextField.returnKeyType = UIReturnKeyDone;
    
    self.sexTextField.font = [UIFont systemFontOfSize:17];
    self.sexTextField.textColor = [UIColor blackColor];
    
    self.birthdayTextField.font = [UIFont systemFontOfSize:17];
    self.birthdayTextField.textColor = [UIColor blackColor];
    
    self.realNameTextField.font = [UIFont systemFontOfSize:17];
    self.realNameTextField.textColor = [UIColor blackColor];
    self.realNameTextField.returnKeyType = UIReturnKeyDone;
    
    self.phoneTextField.font = [UIFont systemFontOfSize:17];
    self.phoneTextField.textColor = [UIColor blackColor];
    self.phoneTextField.keyboardType = UIKeyboardTypePhonePad;
    
    self.areaTextField.font = [UIFont systemFontOfSize:17];
    self.areaTextField.textColor = [UIColor blackColor];
    
    self.villageTextField.font = [UIFont systemFontOfSize:17];
    self.villageTextField.textColor = [UIColor blackColor];
    self.villageTextField.returnKeyType = UIReturnKeyDone;
    
    self.detailAddressTextField.font = [UIFont systemFontOfSize:17];
    self.detailAddressTextField.textColor = [UIColor blackColor];
    self.detailAddressTextField.returnKeyType = UIReturnKeyDone;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0)
    {
        return 5;
    }
    else
    {
        return 3;
    }
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    SelectSexTableViewController * selectSexTableViewController = segue.destinationViewController;
    selectSexTableViewController.delegate = self;
}

- (void)changeSex:(NSUInteger)sexNumber
{
    NSString * sexString = NULL;
    
    switch (sexNumber)
    {
        case 0:
        {
            sexString = @"男";
            NSLog(@"男");
            break;
        }
        case 1:
        {
            sexString = @"女";
            NSLog(@"女");
            break;
        }
        case 2:
        {
            sexString = @"保密";
            NSLog(@"保密");
            break;
        }
        default:
            break;
    }
    
    //获取性别所在 cell
    UITableViewCell * cell = [self.tableView cellForRowAtIndexPath:[self.tableView indexPathForSelectedRow]];
    //sexTextField.tag --> 100 (Storyboard 里设置 tag)
    UITextField * sexTextField = (UITextField *)[cell viewWithTag:100];
    sexTextField.text = sexString;
}

-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    return NO;
}

- (IBAction)textFieldDone:(id)sender
{
    [self.nickNameTextField resignFirstResponder];
    [self.realNameTextField resignFirstResponder];
    [self.villageTextField resignFirstResponder];
    [self.detailAddressTextField resignFirstResponder];
}

- (IBAction)saveData:(id)sender
{
    UIAlertView * alert = [[UIAlertView alloc]initWithTitle:@"保存成功" message:nil delegate:self cancelButtonTitle:@"确定" otherButtonTitles: nil];
    [alert show];
}

-(void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    [self.navigationController popViewControllerAnimated:YES];
}

@end
