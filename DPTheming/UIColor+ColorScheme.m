//
//  UIColor+ColorScheme.m
//  DPTheming
//
//  Created by David Pettigrew on 5/14/13.
//  Copyright (c) 2013 David Pettigrew. All rights reserved.
//

#import "UIColor+ColorScheme.h"
#import "DPTThemeManager.h"

@implementation UIColor (ColorScheme)

#pragma mark public messages
+ (UIColor *)backgroundColor {
    return [[DPTThemeManager sharedDPTThemeManager].defaultTheme backgroundColor];
}

+ (UIColor *)foregroundColor {
    return [[DPTThemeManager sharedDPTThemeManager].defaultTheme foregroundColor];
}

+ (UIColor *)strongTextColor {
    return [[DPTThemeManager sharedDPTThemeManager].defaultTheme strongTextColor];
}

+ (UIColor *)mediumTextColor {
    return [[DPTThemeManager sharedDPTThemeManager].defaultTheme mediumTextColor];
}

+ (UIColor *)weakTextColor {
    return [[DPTThemeManager sharedDPTThemeManager].defaultTheme weakTextColor];
}

@end