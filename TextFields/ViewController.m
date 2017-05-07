//
//  ViewController.m
//  TextFields
//
//  Created by Александр Светлый on 02.05.17.
//  Copyright © 2017 Александр Светлый. All rights reserved.
//

#import "ViewController.h"

@interface ViewController()
@property (strong, nonatomic) IBOutlet UIScrollView       *scrollView;
@property (strong, nonatomic) IBOutlet CountryPickerView  *countryPicker;
@property (strong, nonatomic) IBOutlet BirthdayPickerView *birthdayPicker;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *coutryPickerBottomOffset;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *birthdayPickerBottomOffset;

@property (weak, nonatomic) IBOutlet UITextField* firstName;
@property (weak, nonatomic) IBOutlet UITextField* lastName;
@property (weak, nonatomic) IBOutlet UITextField* birthday;
@property (weak, nonatomic) IBOutlet UITextField* country;
@property (weak, nonatomic)          UITextField* lastResponder;
@end

@implementation ViewController

@synthesize scrollView;
@synthesize coutryPickerBottomOffset,birthdayPickerBottomOffset;
@synthesize firstName,lastName,birthday,country,lastResponder;

#pragma mark - Initialization

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        _countryPicker = nil;
        _birthdayPicker = nil;
    }
    return self;
}

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        _countryPicker = nil;
        _birthdayPicker = nil;
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissAllPickers)];
    [self.view addGestureRecognizer:tapGestureRecognizer];
    coutryPickerBottomOffset.constant = -ASPickerHeight;
    birthdayPickerBottomOffset.constant = -ASPickerHeight;
    [self.view layoutIfNeeded];
    self.countryPicker.delegate = self;
    self.birthdayPicker.delegate = self;
    lastResponder = nil;
}

#pragma mark - TextFields states

- (void)textFieldDidBeginEditing:(UITextField *)textField {
    [scrollView setContentOffset:CGPointMake(0, textField.frame.origin.y) animated:YES];
}
- (void)textFieldDidEndEditing:(UITextField *)textField {
    [scrollView setContentOffset:CGPointZero animated:YES];
}
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    if ((lastResponder == birthday || lastResponder == country) && ![textField isFirstResponder]) {
        [self dismissAllPickers];
    }
    if (textField == country || textField == birthday)
    {
        if (![textField isFirstResponder]) [self dismissAllPickers];
        [self showSomePickerWithOffset:(textField == country)?coutryPickerBottomOffset:birthdayPickerBottomOffset];
        [scrollView setContentOffset:CGPointMake(0, textField.frame.origin.y) animated:YES];
        lastResponder = textField;
        return NO;
    }
    lastResponder = textField;
    
    return YES;
}

#pragma mark - Picker manage methods

- (void)dismissAllPickers {
    [firstName resignFirstResponder];
    [lastName resignFirstResponder];
    [birthday resignFirstResponder];
    [country resignFirstResponder];

    [self hideSomePickerWithOffset:coutryPickerBottomOffset];
    [self hideSomePickerWithOffset:birthdayPickerBottomOffset];
}
- (void)showSomePickerWithOffset:(NSLayoutConstraint *)constraint {
    if (constraint.constant == -ASPickerHeight) {
        [scrollView setContentOffset:CGPointZero animated:YES];
        constraint.constant = 0.0;
        [UIView animateWithDuration:ASAnimationDuration animations:^{
            [self.view layoutIfNeeded];
        }];
    }
}
- (void)hideSomePickerWithOffset:(NSLayoutConstraint *)constraint {
    if (constraint.constant == 0.0) {
        [scrollView setContentOffset:CGPointZero animated:YES];
        constraint.constant = -ASPickerHeight;
        [UIView animateWithDuration:ASAnimationDuration animations:^{
            [self.view layoutIfNeeded];
        }];
    }
}

#pragma mark - CountryPickerView && BirthdayPickerView delegate functions

- (void)doneButtonPressedWithSelectedCountry:(NSString *)selectedCountry {
    [self hideSomePickerWithOffset:coutryPickerBottomOffset];
}
- (void)pickerDidSelectCountry:(NSString *)selectedCountry {
    country.text = selectedCountry;
}
- (void)doneButtonPressedWithBirthdayDate:(NSDate *)birthdayDate{
    [self hideSomePickerWithOffset:coutryPickerBottomOffset];
    //NSString *dateString = [NSDateFormatter localizedStringFromDate:birthdayDate dateStyle:NSDateFormatterLongStyle timeStyle:NSDateFormatterLongStyle];
    //birthday.text = [NSString stringWithFormat:@"%@",dateString];
    NSDateFormatter *formater = [[NSDateFormatter alloc] init];
    [formater setDateFormat:@"dd.mm.YYYY"];
    birthday.text = [formater stringFromDate:birthdayDate];
    [self hideSomePickerWithOffset:birthdayPickerBottomOffset];
}
@end
