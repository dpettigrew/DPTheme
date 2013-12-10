//
//  UIFont+Preferred.h
//  NumberPress
//
//  Created by David Pettigrew on 6/14/13.
//  Copyright (c) 2013 LifeCentrics. All rights reserved.
//

#import <UIKit/UIKit.h>

static const CGFloat kExtraSmallFontSize = 12.0;
static const CGFloat kSmallFontSize = 14.0;
static const CGFloat kMediumFontSize = 16.0;
static const CGFloat kLargeFontSize = 19.0;
static const CGFloat kLargeLargeFontSize = 26.0;
static const CGFloat kExtraLargeFontSize = 30.0;
static const CGFloat kExtraExtraLargeFontSize = 42.0;
static const CGFloat kLargeExtraExtraLargeFontSize = 50.0;
static const CGFloat kExtraExtraExtraLargeFontSize = 72.0;
static const CGFloat kTitleFontSize = 20.0;

typedef enum {
    kExtraSmallLightFontStyleName,
    kSmallLightFontStyleName,
    kSmallFontStyleName,
    kMediumFontStyleName,
    kMediumBoldFontStyleName,
    kLargeFontStyleName,
    kLargeLightFontStyleName,
    kLargeBoldFontStyleName,
    kExtraLargeFontStyleName,
    kExtraLargeBoldFontStyleName,
    kExtraExtraLargeFontStyleName,
    kExtraExtraLargeBoldFontStyleName,
    kExtraExtraExtraLargeFontStyleName,
    kExtraExtraExtraLargeBoldFontStyleName,
    kTitleFontStyleName,
} FontStyles;

@interface UIFont (Preferred)

+ (UIFont *)preferredFontForStyle:(FontStyles)styleName;

@end
