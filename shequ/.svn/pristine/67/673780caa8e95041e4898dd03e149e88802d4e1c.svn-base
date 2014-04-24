//
//  RegisterViewController.m
//  shequ
//
//  Created by WEB08-V5MCS006 on 14-4-22.
//  Copyright (c) 2014年 v5mcs. All rights reserved.
//

#import "RegisterViewController.h"

@interface RegisterViewController ()

@end

@implementation RegisterViewController

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
    
    self.nameTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
    self.nameTextField.returnKeyType = UIReturnKeyDone;
    
    self.passwordTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
    self.passwordTextField.returnKeyType = UIReturnKeyDone;
    
    self.surePasswordTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
    self.surePasswordTextField.returnKeyType = UIReturnKeyDone;
    
    self.phoneTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
    self.phoneTextField.keyboardType = UIKeyboardTypePhonePad;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (IBAction)textFieldDone:(id)sender
{
    [self.nameTextField resignFirstResponder];
    [self.passwordTextField resignFirstResponder];
    [self.surePasswordTextField resignFirstResponder];
}

- (IBAction)clickBackground:(id)sender
{
    [self.nameTextField resignFirstResponder];
    [self.passwordTextField resignFirstResponder];
    [self.surePasswordTextField resignFirstResponder];
    [self.phoneTextField resignFirstResponder];
}

- (IBAction)registerUser:(id)sender
{
    if (self.nameTextField.text.length == 0 |
        self.passwordTextField.text.length == 0 |
        self.surePasswordTextField.text.length == 0 |
        self.phoneTextField.text.length == 0 )
    {
        UIAlertView * alert = [[UIAlertView alloc]initWithTitle:@"请输入完整信息" message:nil delegate:self cancelButtonTitle:@"确定" otherButtonTitles: nil];
            [alert show];
    }
    if (![self.passwordTextField.text isEqualToString:self.surePasswordTextField.text])
    {
        UIAlertView * alert = [[UIAlertView alloc]initWithTitle:@"密码不一致，请重新输入" message:nil delegate:self cancelButtonTitle:@"确定" otherButtonTitles: nil];
        [alert show];
    }
}

@end
