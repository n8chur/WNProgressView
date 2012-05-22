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

@property (strong, nonatomic) WNProgressView* programmaticProgressView;

@end

@implementation ViewController
@synthesize progressAmountLabel = _progressAmountLabel;
@synthesize barberPoleStripWidthAmountLabel = _barberPoleStripWidthAmountLabel;
@synthesize defaultProgressView = _defaultProgressView;
@synthesize tintedDefaultProgressView = _tintedDefaultProgressView;
@synthesize tintedBarProgressView = _tintedBarProgressView;
@synthesize barProgressView = _barProgressView;
@synthesize programmaticProgressView = _programmaticProgressView;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.programmaticProgressView = [[WNProgressView alloc] initWithProgressViewStyle:UIProgressViewStyleDefault];
    self.programmaticProgressView.frame = CGRectMake(self.tintedBarProgressView.frame.origin.x, self.tintedBarProgressView.frame.origin.y + (self.tintedBarProgressView.frame.origin.y - self.tintedDefaultProgressView.frame.origin.y), self.tintedBarProgressView.frame.size.width - (self.tintedDefaultProgressView.frame.size.width - self.tintedBarProgressView.frame.size.width), self.programmaticProgressView.frame.size.height);
    self.programmaticProgressView.center = CGPointMake(self.view.frame.size.width / 2, self.programmaticProgressView.center.y);
    [self.view addSubview:self.programmaticProgressView];
}

- (void)viewDidUnload
{
    [self setBarProgressView:nil];
    [self setDefaultProgressView:nil];
    [self setTintedDefaultProgressView:nil];
    [self setTintedBarProgressView:nil];
    [self setProgrammaticProgressView:nil];
    [self setProgressAmountLabel:nil];
    [self setBarberPoleStripWidthAmountLabel:nil];
    [super viewDidUnload];
}

- (IBAction)progressSliderValueChanged:(UISlider*)slider 
{
    self.progressAmountLabel.text = [NSString stringWithFormat:@"%.2f",slider.value];
    
    self.barProgressView.progress = slider.value;
    self.defaultProgressView.progress = slider.value;
    self.tintedDefaultProgressView.progress = slider.value;
    self.tintedBarProgressView.progress = slider.value;
    self.programmaticProgressView.progress = slider.value;
}

- (IBAction)barberPoleStripWidthSliderValueChanged:(UISlider*)slider 
{
    self.barberPoleStripWidthAmountLabel.text = [NSString stringWithFormat:@"%.1f",slider.value];
    
    self.barProgressView.barberPoleStripWidth = slider.value;
    self.defaultProgressView.barberPoleStripWidth = slider.value;
    self.tintedDefaultProgressView.barberPoleStripWidth = slider.value;
    self.tintedBarProgressView.barberPoleStripWidth = slider.value;
    self.programmaticProgressView.barberPoleStripWidth = slider.value;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
