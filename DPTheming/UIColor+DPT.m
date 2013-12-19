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
+ (UIColor *)dptBackgroundColor {
    return [[DPTThemeManager sharedDPTThemeManager].currentTheme backgroundColor];
}

+ (UIColor *)dptForegroundColor {
    return [[DPTThemeManager sharedDPTThemeManager].currentTheme foregroundColor];
}

+ (UIColor *)dptStrongTextColor {
    return [[DPTThemeManager sharedDPTThemeManager].currentTheme strongTextColor];
}

+ (UIColor *)dptMediumTextColor {
    return [[DPTThemeManager sharedDPTThemeManager].currentTheme mediumTextColor];
}

+ (UIColor *)dptWeakTextColor {
    return [[DPTThemeManager sharedDPTThemeManager].currentTheme weakTextColor];
}

@end