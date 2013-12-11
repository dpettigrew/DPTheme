//
//  UIFont+Theme.h
//  DPTheming
//
//  Created by David Pettigrew on 6/14/13.
//  Copyright (c) 2013 David Pettigrew. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum {
    kExtraSmallLightFontStyleName,
    kExtraSmallFontStyleName,
    kExtraSmallBoldFontStyleName,
    kSmallLightFontStyleName,
    kSmallFontStyleName,
    kMediumFontStyleName,
    kMediumLightFontStyleName,
    kMediumBoldFontStyleName,
    kLargeFontStyleName,
    kLargeLightFontStyleName,
    kLargeBoldFontStyleName,
    kExtraLargeLightFontStyleName,
    kExtraLargeFontStyleName,
    kExtraLargeBoldFontStyleName,
    kExtraExtraLargeLightFontStyleName,
    kExtraExtraLargeFontStyleName,
    kExtraExtraLargeBoldFontStyleName,
    kTitleFontStyleName,
} FontStyles;

@interface UIFont (Theme)

+ (UIFont *)themeFontForStyle:(FontStyles)styleName;

@end
