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

@property (weak, nonatomic) IBOutlet WNProgressView *barProgressView;
@property (weak, nonatomic) IBOutlet WNProgressView *defaultProgressView;
@property (weak, nonatomic) IBOutlet WNProgressView *tintedDefaultProgressView;
@property (weak, nonatomic) IBOutlet WNProgressView *tintedBarProgressView;
- (IBAction)sliderValueChanged:(UISlider*)slider;


@end
