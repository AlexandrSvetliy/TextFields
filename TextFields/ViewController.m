//
//  ViewController.m
//  TextFields
//
//  Created by Александр Светлый on 02.05.17.
//  Copyright © 2017 Александр Светлый. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *firstName;
@property (weak, nonatomic) IBOutlet UITextField *lastName;
@property (weak, nonatomic) IBOutlet UITextField *age;
@property (weak, nonatomic) IBOutlet UITextField *country;
@end

@implementation ViewController
@synthesize scrollView;
@synthesize firstName,lastName,age,country;

- (void)viewDidLoad {
    [super viewDidLoad];
    UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissKeyboard)];
    [self.view addGestureRecognizer:tapGestureRecognizer];
}

- (void)textFieldDidBeginEditing:(UITextField *)textField {
    CGPoint scrollPoint = CGPointMake(0, textField.frame.origin.y);
    [scrollView setContentOffset:scrollPoint animated:YES];
}
- (void)textFieldDidEndEditing:(UITextField *)textField {
    [scrollView setContentOffset:CGPointZero animated:YES];
}
- (void)dismissKeyboard {
    [firstName resignFirstResponder];
    [lastName resignFirstResponder];
    [age resignFirstResponder];
    [country resignFirstResponder];
}
@end
