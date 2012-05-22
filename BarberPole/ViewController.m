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
@synthesize progressView = _progressView;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [self setProgressView:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (IBAction)sliderValueChanged:(UISlider*)slider 
{
    self.progressView.progress = slider.value;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
