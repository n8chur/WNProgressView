# Barber Pole UIProgressView for iOS #

WNProgressView is a subclass of UIProgressView that shows a barber pole effect when progress is 0.

WNProgressView is ARC compatible and supports iOS4.3+ (and possibly earlier).

![picture alt](http://www.westinnewell.com/files/barberPoleExample.jpg "Example")  

## How to use ##

1. Copy WNProgressView.h and WNProgressView.m into your Xcode project.
2. In your xib or storyboard set the class of the desired UIProgressView to WNProgressView.
3. Done!

WNProgressView can also be instantiated programmatically.

Supports both UIProgressView styles (Bar and Default).

The color of the barber pole strips will inherit from progressTintColor if on iOS5+.