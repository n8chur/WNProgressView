//
//  WNProgressView.m
//  BarberPole
//
//  Created by Westin Newell on 3/21/12.
//  Copyright (c) 2012 n8chur. All rights reserved.
//

#import "WNProgressView.h"
#import <QuartzCore/QuartzCore.h>

@interface WNProgressView ()

- (void)startBarberPole;
- (void)stopBarberPole;

@property (nonatomic) CGFloat progressViewInnerHeight;
@property (nonatomic, strong) UIView* barberPoleView;
@property (nonatomic, strong) CAReplicatorLayer* replicatorLayer;

@end

@implementation WNProgressView

@synthesize barberPoleStripWidth = _barberPoleStripWidth;
@synthesize progressViewInnerHeight = _progressViewInnerHeight;
@synthesize barberPoleView = _barberPoleView;
@synthesize replicatorLayer = _replicatorLayer;

- (void)setupWithFrame:(CGRect)frame
{
    [self.barberPoleView removeFromSuperview];
    
    self.barberPoleView = [[UIView alloc] init];
    self.barberPoleView.autoresizesSubviews = YES;
    
    UIColor* barColor = nil;
    
    if ( self.progressViewStyle == UIProgressViewStyleBar ) {
        self.progressViewInnerHeight = 11;
        self.barberPoleView.frame = CGRectMake(0.25f, frame.size.height/2 - self.progressViewInnerHeight/2 + 0.25f, frame.size.width - 0.25f * 4, self.progressViewInnerHeight - 2.5f);
        barColor = [UIColor whiteColor];
    }
    else {
        self.progressViewInnerHeight = 9;
        self.barberPoleView.frame = CGRectMake(0, frame.size.height/2 - self.progressViewInnerHeight/2, frame.size.width, self.progressViewInnerHeight);
        barColor = [UIColor colorWithRed:30.0f/256.0f green:104.0f/256.0f blue:209.0f/256.0f alpha:1];
    }
    if ( [self respondsToSelector:@selector(progressTintColor)] ) {
        if ( self.progressTintColor ) {
            barColor = self.progressTintColor;
        }
    }
    
    CALayer* barberPoleLayer = [CALayer layer];
    barberPoleLayer.frame = self.barberPoleView.frame;
    CALayer* barberPoleMaskLayer = [CALayer layer];
    barberPoleMaskLayer.frame = self.barberPoleView.frame;
    barberPoleMaskLayer.cornerRadius = self.progressViewInnerHeight / 2;
    // mask doesnt work without a solid background
    barberPoleMaskLayer.backgroundColor = [UIColor whiteColor].CGColor;
    barberPoleLayer.mask = barberPoleMaskLayer;
    
    CALayer* barberStrip = [CALayer layer];
    barberStrip.frame = CGRectMake(0,0,self.barberPoleStripWidth * 2,frame.size.height);
    
    CGMutablePathRef stripPath = CGPathCreateMutable();
    CGPathMoveToPoint(stripPath, nil, 0, 0);
    CGPathAddLineToPoint(stripPath, nil, self.barberPoleStripWidth, 0);
    CGPathAddLineToPoint(stripPath, nil, self.barberPoleStripWidth * 2, barberStrip.frame.size.height);
    CGPathAddLineToPoint(stripPath, nil, self.barberPoleStripWidth, barberStrip.frame.size.height);
    
    CAShapeLayer* stripShape = [CAShapeLayer layer];
    stripShape.fillColor = barColor.CGColor;
    stripShape.path = stripPath;
    
    [barberStrip addSublayer:stripShape];
    
    self.replicatorLayer= [CAReplicatorLayer layer];
    self.replicatorLayer.bounds = barberPoleLayer.bounds;
    self.replicatorLayer.position = CGPointMake(- barberStrip.frame.size.width * 4, barberPoleLayer.frame.size.height / 2);
    self.replicatorLayer.instanceCount = (NSInteger)roundf(frame.size.width / barberStrip.frame.size.width * 2) + 1;
    
    CATransform3D finalTransform = CATransform3DMakeTranslation(barberStrip.frame.size.width, 0, 0);
    [self.replicatorLayer setInstanceTransform:finalTransform];
    
    [self.replicatorLayer addSublayer:barberStrip];
    
    [barberPoleLayer addSublayer:self.replicatorLayer];
    
    [self.barberPoleView.layer addSublayer:barberPoleLayer];
    
    self.barberPoleView.alpha = 0.65f;
    
    [self addSubview:self.barberPoleView];
    
    if ( self.progress != 0 ) {
        [self stopBarberPole];
    }
    else {
        [self startBarberPole];
    }
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    [self setupWithFrame:self.frame];
}

- (void)setupDefaultValues
{
    self.barberPoleStripWidth = self.frame.size.height * 1.5f;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupDefaultValues];
        [self setupWithFrame:frame];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self setupDefaultValues];
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
    theAnimation.fromValue=[NSNumber numberWithFloat:-self.barberPoleStripWidth*2];
    theAnimation.toValue=[NSNumber numberWithFloat:0.0];
    [self.replicatorLayer addAnimation:theAnimation forKey:@"animatePosition"];
}

- (void)stopBarberPole
{
    self.barberPoleView.hidden = YES;
    
    [self.replicatorLayer removeAllAnimations];
}

- (void)setBarberPoleStripWidth:(CGFloat)barberPoleStripWidth
{
    _barberPoleStripWidth = barberPoleStripWidth;
    [self layoutSubviews];
}

@end
