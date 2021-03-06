//
//  UIFont+DPT.m
//  DPTheming
//
//  Created by David Pettigrew on 6/14/13.
//  Copyright (c) 2013 David Pettigrew. All rights reserved.
//

#import "UIFont+DPT.h"
#import "DPTTheme.h"
#import "DPTThemeManager.h"

@implementation UIFont (Theme)

+ (UIFont *)dptThemeFontForStyle:(DPTFontStyles)styleName {
    UIFont *preferredFont = nil;
    DPTTheme *currentTheme = [DPTThemeManager sharedDPTThemeManager].currentTheme;
    switch (styleName) {
        case kDPTExtraSmallLightFontStyleName:
            preferredFont = [UIFont fontWithName:currentTheme.lightFontName size:currentTheme.extraSmallFontSize];
            break;
        case kDPTExtraSmallFontStyleName:
            preferredFont = [UIFont fontWithName:currentTheme.regularFontName size:currentTheme.extraSmallFontSize];
            break;
        case kDPTExtraSmallBoldFontStyleName:
            preferredFont = [UIFont fontWithName:currentTheme.boldFontName size:currentTheme.extraSmallFontSize];
            break;
        case kDPTSmallLightFontStyleName:
            preferredFont = [UIFont fontWithName:currentTheme.lightFontName size:currentTheme.smallFontSize];
            break;
        case kDPTSmallFontStyleName:
            preferredFont = [UIFont fontWithName:currentTheme.regularFontName size:currentTheme.smallFontSize];
            break;
        case kDPTSmallBoldFontStyleName:
            preferredFont = [UIFont fontWithName:currentTheme.boldFontName size:currentTheme.smallFontSize];
            break;
        case kDPTMediumLightFontStyleName:
            preferredFont = [UIFont fontWithName:currentTheme.lightFontName size:currentTheme.mediumFontSize];
            break;
        case kDPTMediumFontStyleName:
            preferredFont = [UIFont fontWithName:currentTheme.regularFontName size:currentTheme.mediumFontSize];
            break;
        case kDPTMediumBoldFontStyleName:
            preferredFont = [UIFont fontWithName:currentTheme.boldFontName size:currentTheme.mediumFontSize];
            break;
        case kDPTLargeFontStyleName:
            preferredFont = [UIFont fontWithName:currentTheme.regularFontName size:currentTheme.largeFontSize];
            break;
        case kDPTLargeLightFontStyleName:
            preferredFont = [UIFont fontWithName:currentTheme.lightFontName size:currentTheme.largeFontSize];
            break;
        case kDPTLargeBoldFontStyleName:
            preferredFont = [UIFont fontWithName:currentTheme.boldFontName size:currentTheme.largeFontSize];
            break;
        case kDPTExtraLargeLightFontStyleName:
            preferredFont = [UIFont fontWithName:currentTheme.lightFontName size:currentTheme.extraLargeFontSize];
            break;
        case kDPTExtraLargeFontStyleName:
            preferredFont = [UIFont fontWithName:currentTheme.regularFontName size:currentTheme.extraLargeFontSize];
            break;
        case kDPTExtraLargeBoldFontStyleName:
            preferredFont = [UIFont fontWithName:currentTheme.boldFontName size:currentTheme.extraLargeFontSize];
            break;
        case kDPTExtraExtraLargeLightFontStyleName:
            preferredFont = [UIFont fontWithName:currentTheme.lightFontName size:currentTheme.extraExtraLargeFontSize];
            break;
        case kDPTExtraExtraLargeFontStyleName:
            preferredFont = [UIFont fontWithName:currentTheme.regularFontName size:currentTheme.extraExtraLargeFontSize];
            break;
        case kDPTExtraExtraLargeBoldFontStyleName:
            preferredFont = [UIFont fontWithName:currentTheme.boldFontName size:currentTheme.extraExtraLargeFontSize];
            break;
        case kDPTTitleFontStyleName:
            preferredFont = [UIFont fontWithName:currentTheme.regularFontName size:currentTheme.titleFontSize];
            break;
        default:
            NSLog(@"Warning - Unsupported preferred font requested");
            break;
    }
    if (!preferredFont) {
        NSLog(@"Warning - font not found - %d", styleName);
    }
    return preferredFont;
}

+ (UIFont *)dptThemeFontForFontNameRef:(NSString *)fontNameRef size:(CGFloat)fontSize theme:(DPTTheme *)theme {
    NSString *fontName = [theme fontNameForFontNameRef:fontNameRef];
    UIFont *font = [UIFont fontWithName:fontName size:fontSize];
    return font;
}

@end
