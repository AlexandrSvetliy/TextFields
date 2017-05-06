//
//  ViewController.m
//  TextFields
//
//  Created by Александр Светлый on 02.05.17.
//  Copyright © 2017 Александр Светлый. All rights reserved.
//

#import "ViewController.h"
#import "CountryPickerView.h"

static const CGFloat LUPickerHeight = 265;
static const CGFloat LUAnimationDuration = 0.4;

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *firstName;
@property (weak, nonatomic) IBOutlet UITextField *lastName;
@property (weak, nonatomic) IBOutlet UITextField *age;
@property (weak, nonatomic) IBOutlet UITextField *country;
@end

@implementation ViewController
@synthesize scrollView;
@synthesize firstName,lastName,age,country;
- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        _countryPicker = nil;
    }
    
    return self;
}

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        _countryPicker = nil;
    }
    
    return self;
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissKeyboard)];
    [self.view addGestureRecognizer:tapGestureRecognizer];
    self.coutryPickerBottomOffset.constant = -LUPickerHeight;
    [self.view layoutIfNeeded];
}

- (void)textFieldDidBeginEditing:(UITextField *)textField {
    [scrollView setContentOffset:CGPointMake(0, textField.frame.origin.y) animated:YES];
}
- (void)textFieldDidEndEditing:(UITextField *)textField {
    [scrollView setContentOffset:CGPointZero animated:YES];
    
}
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    if (textField == country)
    {
        if (![textField isFirstResponder]) [self dismissKeyboard];
        
        [self showCountryPicker];
        [scrollView setContentOffset:CGPointMake(0, textField.frame.origin.y) animated:YES];
        return NO;
    }
    if (textField == age) return NO;
    if (![textField isFirstResponder]) [self dismissKeyboard];
    return YES;
}
- (void)dismissKeyboard {
    [firstName resignFirstResponder];
    [lastName resignFirstResponder];
    [age resignFirstResponder];
    [country resignFirstResponder];

    [self hideCountryPicker];
}
- (void)showCountryPicker {
    if (self.coutryPickerBottomOffset.constant == -LUPickerHeight) {
        [scrollView setContentOffset:CGPointZero animated:YES];
        self.coutryPickerBottomOffset.constant = 0.0;
        [UIView animateWithDuration:LUAnimationDuration animations:^{
            [self.view layoutIfNeeded];
        }];
    }
}
- (void)hideCountryPicker {
    if (self.coutryPickerBottomOffset.constant == 0.0) {
        [scrollView setContentOffset:CGPointZero animated:YES];
        self.coutryPickerBottomOffset.constant = -LUPickerHeight;
        [UIView animateWithDuration:LUAnimationDuration animations:^{
            [self.view layoutIfNeeded];
        }];
    }
}
@end
