//
//  CountryPickerView.m
//  TextFields
//
//  Created by Александр Светлый on 02.05.17.
//  Copyright © 2017 Александр Светлый. All rights reserved.
//

#import "CountryPickerView.h"

@interface CountryPickerView () <UIPickerViewDelegate>

@property (strong, nonatomic) IBOutlet UIPickerView *picker;
@property (strong, nonatomic) IBOutlet UIView *backgroundView;
@property (nonatomic, strong) NSArray *countries;

@end

@implementation CountryPickerView

#pragma mark - Public

- (void)awakeFromNib {
    [super awakeFromNib];
    self.countries = [NSLocale ISOCountryCodes];
    self.backgroundView.backgroundColor = self.pickerColor;
}

#pragma mark - Actions

- (IBAction)doneButtonPressed:(UIButton *)sender {
}

- (IBAction)locateButtonPressed:(UIButton *)sender {
}

#pragma mark - Picker DataSource methods

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return self.countries.count;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    return [[NSLocale currentLocale] displayNameForKey:NSLocaleCountryCode value:self.countries[row]];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    
}
@end
