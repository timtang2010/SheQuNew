//
//  ProjectExpressFormTableViewController.m
//  shequ
//
//  Created by WEB08-V5MCS006 on 14-4-24.
//  Copyright (c) 2014年 v5mcs. All rights reserved.
//

#import "ProjectExpressFormTableViewController.h"

#define areaRow 0
#define detailsRow 1

@interface ProjectExpressFormTableViewController ()
{
    NSArray *areaArrays;
    NSArray *detailsArrays;
}

@end

@implementation ProjectExpressFormTableViewController

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
    
    [self configTextField];

    NSBundle * bundle = [NSBundle mainBundle];
    NSURL * plistURL = [bundle URLForResource:@"shanghaiArea" withExtension:@"plist"];
    
    self.stateArea = [NSDictionary dictionaryWithContentsOfURL:plistURL];
    
    NSArray * allStates = [self.stateArea allKeys];
    NSArray * sortedStates = [allStates sortedArrayUsingSelector:@selector(compare:)];
    self->areaArrays = sortedStates;
    
    NSString * selectedState = self.self->areaArrays[0];
    self->detailsArrays = self.stateArea[selectedState];
    
    self.cityPicker = [[UIPickerView alloc] initWithFrame:CGRectZero];
    self.cityPicker.delegate = self;
    self.cityPicker.dataSource = self;
    [self.cityPicker setShowsSelectionIndicator:YES];

    self.areaTextField.inputView = self.cityPicker;
    self.detailTextField.inputView = self.cityPicker;
    
    UIToolbar * customPickerToolBar = [[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, 320, 56)];
    [customPickerToolBar sizeToFit];
    
    NSMutableArray * barItems = [[NSMutableArray alloc] init];
    UIBarButtonItem * flexSpace = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace
                                                                              target:self
                                                                              action:nil];
    [barItems addObject:flexSpace];
    
    //工具栏按钮
    UIBarButtonItem * doneButton = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemDone
                                                                            target:self
                                                                            action:@selector(pickerDoneClick)];
    [barItems addObject:doneButton];
    
    [customPickerToolBar setItems:barItems animated:YES];

    [self.genderTextField addTarget:self action:@selector(segmentedControlTapper:) forControlEvents:UIControlEventValueChanged];
    
    self.areaTextField.inputAccessoryView = customPickerToolBar;
    self.detailTextField.inputAccessoryView = customPickerToolBar;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void)configTextField
{
    self.nameTextField.returnKeyType = UIReturnKeyDone;
    self.phoneTextField.keyboardType = UIKeyboardTypePhonePad;
    self.serviceTextField.returnKeyType = UIReturnKeyDone;
    self.addressTextField.returnKeyType = UIReturnKeyDone;
    self.claimTextField.returnKeyType = UIReturnKeyDone;
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
        return 3;
    }
    else
    {
        return 5;
    }
}

- (void)pickerDoneClick
{
    NSLog(@"Done Click");
    
    int cityIndex = [self.cityPicker selectedRowInComponent:areaRow];
    int stateIndex = [self.cityPicker selectedRowInComponent:detailsRow];
    
    self.areaTextField.text = [self->areaArrays objectAtIndex:cityIndex];
    self.detailTextField.text = [self->detailsArrays objectAtIndex:stateIndex];
    
    [self.areaTextField resignFirstResponder];
    [self.detailTextField resignFirstResponder];
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 2;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    if (component == 0)
    {
        return areaArrays.count;
    }
    else
    {
        return detailsArrays.count;
    }
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    if (component == 0)
    {
        return self->areaArrays[row];
    }
    else
    {
        return self->detailsArrays[row];
    }
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    if (component == 0)
    {
        NSString * keyString = [self->areaArrays objectAtIndex:row];
        self->detailsArrays = [self.stateArea objectForKey:keyString];
        
        [pickerView reloadComponent:detailsRow];
        [pickerView selectRow:0 inComponent:detailsRow animated:YES];
    }
}

#pragma mark 打印分段控制器的状态
- (void)segmentedControlTapper:(UISegmentedControl *)paramSender
{
    switch (paramSender.selectedSegmentIndex)
    {
        case 0:
        {
            NSLog(@"选择男");
            break;
        }
        case 1:
        {
            NSLog(@"选择女");
            break;
        }
        case 2:
        {
            NSLog(@"选择保密");
            break;
        }
        default:
            break;
    }
}

- (IBAction)slideFrameUp:(id)sender
{
    [self slideFrame:YES];
}

- (IBAction)slideFrameDown:(id)sender
{
    [self slideFrame:NO];
}

- (IBAction)closeKey:(id)sender
{
    [self.nameTextField resignFirstResponder];
    [self.phoneTextField resignFirstResponder];
    [self.serviceTextField resignFirstResponder];
    [self.addressTextField resignFirstResponder];
    [self.claimTextField resignFirstResponder];
}

- (IBAction)saveDone:(id)sender
{
    UIAlertView * alert = [[UIAlertView alloc]initWithTitle:@"提示" message:@"保存成功" delegate:self cancelButtonTitle:@"OK"otherButtonTitles:nil];
    [alert show];
    
    [self closeKey:(id)sender];
}

-(void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)slideFrame:(BOOL)up
{
    const int movementDistance = 150;//偏移量
    const float movementDuration = 0.3f;//动画时间
    
    int movement = (up ? -movementDistance:movementDistance);
    
    [UIView beginAnimations:@"animation" context:nil];
    [UIView setAnimationBeginsFromCurrentState:YES];
    [UIView setAnimationDuration:movementDuration];
    self.view.frame = CGRectOffset(self.view.frame, 0, movement);
    [UIView commitAnimations];
}

@end
