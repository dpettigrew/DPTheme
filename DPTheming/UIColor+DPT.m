//
//  UIColor+DPTColorScheme.m
//  DPTheming
//
//  Created by David Pettigrew on 5/14/13.
//  Copyright (c) 2013 David Pettigrew. All rights reserved.
//

#import "UIColor+DPT.h"
#import "DPTThemeManager.h"

@implementation UIColor (DPT)

#pragma mark public messages
+ (UIColor *)backgroundColor {
    return [[DPTThemeManager sharedDPTThemeManager].currentTheme backgroundColor];
}

+ (UIColor *)foregroundColor {
    return [[DPTThemeManager sharedDPTThemeManager].currentTheme foregroundColor];
}

+ (UIColor *)strongTextColor {
    return [[DPTThemeManager sharedDPTThemeManager].currentTheme strongTextColor];
}

+ (UIColor *)mediumTextColor {
    return [[DPTThemeManager sharedDPTThemeManager].currentTheme mediumTextColor];
}

+ (UIColor *)weakTextColor {
    return [[DPTThemeManager sharedDPTThemeManager].currentTheme weakTextColor];
}

@end