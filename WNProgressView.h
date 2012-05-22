//
//  WNProgressView.h
//  BarberPole
//
//  Created by Westin Newell on 3/21/12.
//  Copyright (c) 2012 n8chur. All rights reserved.
//

#import <UIKit/UIKit.h>


/*
 * When progress == 0 the barber pole effect will become active.
 * WNProgressView inherits the barber pole strip color from the progressTintColor property if set.
 * This class supports both styles of UIProgessView (Bar and Default).
 * To use with Interface Builder, just set your UIProgressView's class to WNProgressView and you're all set!
 */
@interface WNProgressView : UIProgressView

/*
 * Sets the width each strip in the barber pole effect.
 *
 * The distance between each bar is equal to the width of the barberPoleStripWidth.
 * Default value is frame.size.height * 1.5f.
 */
@property (nonatomic) CGFloat barberPoleStripWidth;

@end
