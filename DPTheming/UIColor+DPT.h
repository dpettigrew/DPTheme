//
//  UIColor+ColorScheme.h
//  DPTheming
//
//  Created by David Pettigrew on 5/14/13.
//  Copyright (c) 2013 David Pettigrew. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (ColorScheme)

+ (UIColor *)dptBackgroundColor;
+ (UIColor *)dptForegroundColor;
+ (UIColor *)dptStrongTextColor;
+ (UIColor *)dptMediumTextColor;
+ (UIColor *)dptWeakTextColor;
+ (UIColor *)dptBarTintColor;
+ (UIColor *)dptTintColor;
+ (UIColor *)dptColorWithName:(NSString *)colorName;

@end
