//
//  UIFont+Preferred.m
//  NumberPress
//
//  Created by David Pettigrew on 6/14/13.
//  Copyright (c) 2013 LifeCentrics. All rights reserved.
//

#import "UIFont+Preferred.h"

@implementation UIFont (Preferred)

+ (UIFont *)preferredFontForStyle:(FontStyles)styleName {
    UIFont *preferredFont = nil;
    switch (styleName) {
        case kExtraSmallLightFontStyleName:
            preferredFont = [UIFont fontWithName:kLightFontName size:kExtraSmallFontSize];
            break;
        case kSmallLightFontStyleName:
            preferredFont = [UIFont fontWithName:kLightFontName size:kSmallFontSize];
            break;
        case kSmallFontStyleName:
            preferredFont = [UIFont fontWithName:kRegularFontName size:kSmallFontSize];
            break;
        case kMediumFontStyleName:
            preferredFont = [UIFont fontWithName:kRegularFontName size:kMediumFontSize];
            break;
        case kMediumBoldFontStyleName:
            preferredFont = [UIFont fontWithName:kBoldFontName size:kMediumFontSize];
            break;
        case kLargeFontStyleName:
            preferredFont = [UIFont fontWithName:kRegularFontName size:kLargeFontSize];
            break;
        case kLargeLightFontStyleName:
            preferredFont = [UIFont fontWithName:kLightFontName size:kLargeFontSize];
            break;
        case kLargeBoldFontStyleName:
            preferredFont = [UIFont fontWithName:kBoldFontName size:kLargeFontSize];
            break;
        case kExtraLargeFontStyleName:
            preferredFont = [UIFont fontWithName:kRegularFontName size:kExtraLargeFontSize];
            break;
        case kExtraLargeBoldFontStyleName:
            preferredFont = [UIFont fontWithName:kBoldFontName size:kExtraLargeFontSize];
            break;
        case kExtraExtraLargeFontStyleName:
            preferredFont = [UIFont fontWithName:kRegularFontName size:kExtraExtraLargeFontSize];
            break;
        case kExtraExtraLargeBoldFontStyleName:
            preferredFont = [UIFont fontWithName:kBoldFontName size:kExtraExtraLargeFontSize];
            break;
        case kExtraExtraExtraLargeFontStyleName:
            preferredFont = [UIFont fontWithName:kBoldFontName size:kExtraExtraExtraLargeFontSize];
            break;
        case kExtraExtraExtraLargeBoldFontStyleName:
            preferredFont = [UIFont fontWithName:kBoldFontName size:kExtraExtraExtraLargeFontSize];
            break;
        case kTitleFontStyleName:
            preferredFont = [UIFont fontWithName:kRegularFontName size:kTitleFontSize];
            break;
        default:
            NSLog(@"Warning - Unsupported preferred font requested");
            break;
    }
    return preferredFont;
}

@end
