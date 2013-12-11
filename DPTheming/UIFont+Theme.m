//
//  UIFont+Theme.m
//  DPTheming
//
//  Created by David Pettigrew on 6/14/13.
//  Copyright (c) 2013 David Pettigrew. All rights reserved.
//

#import "UIFont+Theme.h"
#import "DPTTheme.h"
#import "DPTThemeManager.h"

@implementation UIFont (Theme)

+ (UIFont *)themeFontForStyle:(FontStyles)styleName {
    UIFont *preferredFont = nil;
    DPTTheme *defaultTheme = [[DPTThemeManager sharedDPTThemeManager] defaultTheme];
    switch (styleName) {
        case kExtraSmallLightFontStyleName:
            preferredFont = [UIFont fontWithName:defaultTheme.lightFontName size:defaultTheme.extraSmallFontSize];
            break;
        case kExtraSmallFontStyleName:
            preferredFont = [UIFont fontWithName:defaultTheme.regularFontName size:defaultTheme.extraSmallFontSize];
            break;
        case kExtraSmallBoldFontStyleName:
            preferredFont = [UIFont fontWithName:defaultTheme.boldFontName size:defaultTheme.extraSmallFontSize];
            break;
        case kSmallLightFontStyleName:
            preferredFont = [UIFont fontWithName:defaultTheme.lightFontName size:defaultTheme.smallFontSize];
            break;
        case kSmallFontStyleName:
            preferredFont = [UIFont fontWithName:defaultTheme.regularFontName size:defaultTheme.smallFontSize];
            break;
        case kMediumLightFontStyleName:
            preferredFont = [UIFont fontWithName:defaultTheme.lightFontName size:defaultTheme.mediumFontSize];
            break;
        case kMediumFontStyleName:
            preferredFont = [UIFont fontWithName:defaultTheme.regularFontName size:defaultTheme.mediumFontSize];
            break;
        case kMediumBoldFontStyleName:
            preferredFont = [UIFont fontWithName:defaultTheme.boldFontName size:defaultTheme.mediumFontSize];
            break;
        case kLargeFontStyleName:
            preferredFont = [UIFont fontWithName:defaultTheme.regularFontName size:defaultTheme.largeFontSize];
            break;
        case kLargeLightFontStyleName:
            preferredFont = [UIFont fontWithName:defaultTheme.lightFontName size:defaultTheme.largeFontSize];
            break;
        case kLargeBoldFontStyleName:
            preferredFont = [UIFont fontWithName:defaultTheme.boldFontName size:defaultTheme.largeFontSize];
            break;
        case kExtraLargeLightFontStyleName:
            preferredFont = [UIFont fontWithName:defaultTheme.lightFontName size:defaultTheme.extraLargeFontSize];
            break;
        case kExtraLargeFontStyleName:
            preferredFont = [UIFont fontWithName:defaultTheme.regularFontName size:defaultTheme.extraLargeFontSize];
            break;
        case kExtraLargeBoldFontStyleName:
            preferredFont = [UIFont fontWithName:defaultTheme.boldFontName size:defaultTheme.extraLargeFontSize];
            break;
        case kExtraExtraLargeLightFontStyleName:
            preferredFont = [UIFont fontWithName:defaultTheme.lightFontName size:defaultTheme.extraExtraLargeFontSize];
            break;
        case kExtraExtraLargeFontStyleName:
            preferredFont = [UIFont fontWithName:defaultTheme.regularFontName size:defaultTheme.extraExtraLargeFontSize];
            break;
        case kExtraExtraLargeBoldFontStyleName:
            preferredFont = [UIFont fontWithName:defaultTheme.boldFontName size:defaultTheme.extraExtraLargeFontSize];
            break;
        case kTitleFontStyleName:
            preferredFont = [UIFont fontWithName:defaultTheme.regularFontName size:defaultTheme.titleFontSize];
            break;
        default:
            NSLog(@"Warning - Unsupported preferred font requested");
            break;
    }
    return preferredFont;
}

@end
