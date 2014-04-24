//
//  FeedbackViewController.m
//  shequ
//
//  Created by WEB08-V5MCS006 on 14-4-24.
//  Copyright (c) 2014年 v5mcs. All rights reserved.
//

#import "FeedbackViewController.h"
#import "CPTextViewPlaceholder.h"

@interface FeedbackViewController ()

@end

@implementation FeedbackViewController

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
    
    self.textView.placeholder = @"请留下您的宝贵意见";
    [self.textView becomeFirstResponder];
}

-(void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (IBAction)clickBackground:(id)sender
{
    [self.textField resignFirstResponder];
    [self.textView resignFirstResponder];
}

- (IBAction)textFieldDone:(id)sender
{
    [self.textField resignFirstResponder];
}

- (IBAction)sendMessage:(id)sender
{
    UIAlertView * alert = [[UIAlertView alloc]initWithTitle:@"发送成功" message:nil delegate:self cancelButtonTitle:@"确定" otherButtonTitles: nil];
    [alert show];
}

- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    [self.navigationController popViewControllerAnimated:YES];
}

@end
