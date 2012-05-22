//
//  ViewController.h
//  BarberPole
//
//  Created by Westin Newell on 3/21/12.
//  Copyright (c) 2012 n8chur. All rights reserved.
//

#import <UIKit/UIKit.h>

@class WNProgressView;

@interface ViewController : UIViewController

@property (unsafe_unretained, nonatomic) IBOutlet WNProgressView *barProgressView;
@property (unsafe_unretained, nonatomic) IBOutlet WNProgressView *defaultProgressView;
@property (unsafe_unretained, nonatomic) IBOutlet WNProgressView *tintedDefaultProgressView;
@property (unsafe_unretained, nonatomic) IBOutlet WNProgressView *tintedBarProgressView;



- (IBAction)progressSliderValueChanged:(UISlider*)slider;
- (IBAction)barberPoleStripWidthSliderValueChanged:(UISlider*)slider;

@property (unsafe_unretained, nonatomic) IBOutlet UILabel *progressAmountLabel;
@property (unsafe_unretained, nonatomic) IBOutlet UILabel *barberPoleStripWidthAmountLabel;

@end
