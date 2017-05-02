//
//  CountryPickerView.m
//  TextFields
//
//  Created by Александр Светлый on 02.05.17.
//  Copyright © 2017 Александр Светлый. All rights reserved.
//

#import "CountryPickerView.h"

@interface CountryPickerView ()

@property (strong, nonatomic) IBOutlet UIPickerView *picker;
@property (strong, nonatomic) IBOutlet UIView *backgroundView;

@end

@implementation CountryPickerView

#pragma mark - Public

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.backgroundView.backgroundColor = self.pickerColor;
}
- (IBAction)doneButtonPressed:(UIButton *)sender {
}
- (IBAction)locateButtonPressed:(UIButton *)sender {
}
@end
