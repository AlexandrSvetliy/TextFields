//
//  ViewController.h
//  TextFields
//
//  Created by Александр Светлый on 02.05.17.
//  Copyright © 2017 Александр Светлый. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CountryPickerView;

@interface ViewController : UIViewController
@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;
@property (strong, nonatomic) IBOutlet CountryPickerView *countryPicker;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *coutryPickerBottomOffset;

@end

