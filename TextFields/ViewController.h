//
//  ViewController.h
//  TextFields
//
//  Created by Александр Светлый on 02.05.17.
//  Copyright © 2017 Александр Светлый. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CountryPickerView.h"
#import "BirthdayPickerView.h"

static const CGFloat ASPickerHeight = 265;
static const CGFloat ASAnimationDuration = 0.4;

@interface ViewController : UIViewController <CountryPickerViewDelegate,BirthdayPickerViewDelegate>
@end

