//
//  LoginViewController.m
//  shequ
//
//  Created by WEB08-V5MCS006 on 14-4-22.
//  Copyright (c) 2014年 v5mcs. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

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
    
    self.accountTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
    self.accountTextField.returnKeyType = UIReturnKeyDone;
    
    self.passwordTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
    self.passwordTextField.returnKeyType = UIReturnKeyDone;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (IBAction)textFieldDone:(id)sender
{
    [self.accountTextField resignFirstResponder];
    [self.passwordTextField resignFirstResponder];
}

- (IBAction)clickBackground:(id)sender
{
    [self.accountTextField resignFirstResponder];
    [self.passwordTextField resignFirstResponder];
}

@end
