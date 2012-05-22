//
//  WNProgressView.m
//  BarberPole
//
//  Created by Westin Newell on 3/21/12.
//  Copyright (c) 2012 n8chur. All rights reserved.
//

#define kBarWidth 10.0f

#import "WNProgressView.h"
#import <QuartzCore/QuartzCore.h>

@interface WNProgressView ()

- (void)startBarberPole;
- (void)stopBarberPole;

@property (nonatomic) CGFloat progressViewInnerHeight;
@property (nonatomic, strong) UIView* barberPoleView;
@property (nonatomic, strong) CALayer* barberPoleLayer;
@property (nonatomic, strong) CAReplicatorLayer* replicatorLayer;

@end

@implementation WNProgressView

@synthesize progressViewInnerHeight = _progressViewInnerHeight;
@synthesize barberPoleView = _barberPoleView;
@synthesize barberPoleLayer = _barberPoleLayer;
@synthesize replicatorLayer = _replicatorLayer;

- (void)setupWithFrame:(CGRect)frame
{
    self.barberPoleView = [[UIView alloc] init];
    if ( self.progressViewStyle == UIProgressViewStyleBar ) {
        self.progressViewInnerHeight = 10;
        self.barberPoleView.frame = CGRectMake(0, frame.size.height/2 - self.progressViewInnerHeight/2 - 0.5f, frame.size.width, self.progressViewInnerHeight);
    }
    else {
        self.progressViewInnerHeight = 9;
        self.barberPoleView.frame = CGRectMake(0, frame.size.height/2 - self.progressViewInnerHeight/2, frame.size.width, self.progressViewInnerHeight - 0.5f);
    }
    self.barberPoleLayer = [CALayer layer];
    self.barberPoleLayer.frame = self.barberPoleView.frame;
    CALayer* barberPoleMaskLayer = [CALayer layer];
    barberPoleMaskLayer.frame = self.barberPoleView.frame;
    barberPoleMaskLayer.cornerRadius = self.progressViewInnerHeight / 2;
    // mask doesnt work without a solid background
    barberPoleMaskLayer.backgroundColor = [UIColor whiteColor].CGColor;
    self.barberPoleLayer.mask = barberPoleMaskLayer;
    
    CALayer* barberBar = [CALayer layer];
    barberBar.frame = CGRectMake(0,0,kBarWidth,frame.size.height);
    barberBar.backgroundColor = [UIColor whiteColor].CGColor;
    
    self.replicatorLayer= [CAReplicatorLayer layer];
    self.replicatorLayer.bounds = self.barberPoleLayer.bounds;
    self.replicatorLayer.position = CGPointMake(- barberBar.frame.size.width * 4, self.barberPoleLayer.frame.size.height / 2);
    self.replicatorLayer.instanceCount = (NSInteger)roundf(frame.size.width / barberBar.frame.size.width) + 1;
    
    CATransform3D finalTransform = CATransform3DMakeTranslation(barberBar.frame.size.width * 2, 0, 0);
    [self.replicatorLayer setInstanceTransform:finalTransform];
    
    [self.replicatorLayer addSublayer:barberBar];
    
    [self.barberPoleLayer addSublayer:self.replicatorLayer];
    
    [self.barberPoleView.layer addSublayer:self.barberPoleLayer];
    
    [self addSubview:self.barberPoleView];
    
    if ( self.progress != 0 ) {
        [self stopBarberPole];
    }
    else {
        [self startBarberPole];
    }
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupWithFrame:frame];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self setupWithFrame:self.frame];
    }
    return self;
}

- (void)setProgress:(float)progress
{
    [super setProgress:progress];
    if ( progress == 0 ) {
        if ( self.barberPoleView.hidden == YES) {
             [self startBarberPole];
        }
    }
    else {
        if ( self.barberPoleView.hidden == NO ) {
            [self stopBarberPole];
        }
    }
}

- (void)startBarberPole
{
    self.barberPoleView.hidden = NO;
    
    CABasicAnimation *theAnimation;
    theAnimation=[CABasicAnimation animationWithKeyPath:@"position.x"];
    theAnimation.duration=0.5f;
    theAnimation.repeatCount=HUGE_VALF;
    theAnimation.autoreverses=NO;
    theAnimation.fromValue=[NSNumber numberWithFloat:-kBarWidth*2];
    theAnimation.toValue=[NSNumber numberWithFloat:0.0];
    [self.replicatorLayer addAnimation:theAnimation forKey:@"animatePosition"];
}

- (void)stopBarberPole
{
    self.barberPoleView.hidden = YES;
    
    [self.replicatorLayer removeAllAnimations];
}

@end
