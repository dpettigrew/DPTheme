//
//  UIColor+ColorScheme.h
//  DPTheming
//
//  Created by David Pettigrew on 5/14/13.
//  Copyright (c) 2013 David Pettigrew. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (ColorScheme)

+ (UIColor *)backgroundColor;
+ (UIColor *)foregroundColor;
+ (UIColor *)strongTextColor;
+ (UIColor *)mediumTextColor;
+ (UIColor *)weakTextColor;

@end
