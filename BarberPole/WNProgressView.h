//
//  WNProgressView.h
//  BarberPole
//
//  Created by Westin Newell on 3/21/12.
//  Copyright (c) 2012 n8chur. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WNProgressView : UIProgressView

/*
 * Sets the width each strip in the barber pole effect.
 *
 * The distance between each bar is equal to the width of the barberPoleStripWidth.
 * Default value is 10.0f.
 */
@property (nonatomic) CGFloat barberPoleStripWidth;

@end
