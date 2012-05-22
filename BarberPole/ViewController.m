//
//  ViewController.m
//  BarberPole
//
//  Created by Westin Newell on 3/21/12.
//  Copyright (c) 2012 n8chur. All rights reserved.
//

#import "ViewController.h"
#import "WNProgressView.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize defaultProgressView = _defaultProgressView;
@synthesize tintedDefaultProgressView = _tintedDefaultProgressView;
@synthesize tintedBarProgressView = _tintedBarProgressView;
@synthesize barProgressView = _barProgressView;

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)viewDidUnload
{
    [self setBarProgressView:nil];
    [self setDefaultProgressView:nil];
    [self setTintedDefaultProgressView:nil];
    [self setTintedBarProgressView:nil];
    [super viewDidUnload];
}

- (IBAction)sliderValueChanged:(UISlider*)slider 
{
    self.barProgressView.progress = slider.value;
    self.defaultProgressView.progress = slider.value;
    self.tintedDefaultProgressView.progress = slider.value;
    self.tintedBarProgressView.progress = slider.value;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
