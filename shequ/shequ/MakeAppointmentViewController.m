//
//  MakeAppointmentViewController.m
//  shequ
//
//  Created by v5mcs006 on 14-4-26.
//  Copyright (c) 2014年 v5mcs. All rights reserved.
//

#import "MakeAppointmentViewController.h"
#import "MakeAppintmentWithCustomTableViewCell.h"

#define categoryRow 0
#define detailRow 1

@interface MakeAppointmentViewController ()
{
    NSArray * categoryArrays;
    NSArray * detailArrays;
}

@end

@implementation MakeAppointmentViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //设置字典
    NSBundle * bundle = [NSBundle mainBundle];
    NSURL * plistURL = [bundle URLForResource:@"shanghaiArea" withExtension:@"plist"];
    self.dictionary = [NSDictionary dictionaryWithContentsOfURL:plistURL];
    
    NSArray * keys = [self.dictionary allKeys];
    NSArray * categoryKeys = [keys sortedArrayUsingSelector:@selector(compare:)];
    self->categoryArrays = categoryKeys;
    
    NSString * selectedState = self.self->categoryArrays[0];
    self->detailArrays = self.dictionary[selectedState];
    
    self.pickerView = [[UIPickerView alloc] initWithFrame:CGRectZero];
    self.pickerView.delegate = self;
    self.pickerView.dataSource = self;
    [self.pickerView setShowsSelectionIndicator:YES];
    
    self.categoryTextField.inputView = self.pickerView;
    self.detailTextField.inputView = self.pickerView;
    
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
    
    self.categoryTextField.inputAccessoryView = customPickerToolBar;
    self.detailTextField.inputAccessoryView = customPickerToolBar;
    
    [self.tableView registerClass:[MakeAppintmentWithCustomTableViewCell class] forCellReuseIdentifier:@"identifier"];
}

- (void)pickerDoneClick
{
    NSLog(@"pickerDoneClick");
    
    int cityIndex = [self.pickerView selectedRowInComponent:categoryRow];
    int stateIndex = [self.pickerView selectedRowInComponent:detailRow];
    
    self.categoryTextField.text = [self->categoryArrays objectAtIndex:cityIndex];
    self.detailTextField.text = [self->detailArrays objectAtIndex:stateIndex];
    
    [self.categoryTextField resignFirstResponder];
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
        return categoryArrays.count;
    }
    else
    {
        return detailArrays.count;
    }
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    if (component == 0)
    {
        return self->categoryArrays[row];
    }
    else
    {
        return self->detailArrays[row];
    }
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    if (component == 0)
    {
        NSString * keyString = [self->categoryArrays objectAtIndex:row];
        self->detailArrays = [self.dictionary objectForKey:keyString];
        
        [pickerView reloadComponent:detailRow];
        [pickerView selectRow:0 inComponent:detailRow animated:YES];
    }
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 8;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * identifier = @"identifier";
    
    MakeAppintmentWithCustomTableViewCell * cell = (MakeAppintmentWithCustomTableViewCell *)[tableView dequeueReusableCellWithIdentifier:identifier];

    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 70;
}

@end
