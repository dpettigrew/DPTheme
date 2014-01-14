//
//  UIFont+DPT.h
//  DPTheming
//
//  Created by David Pettigrew on 6/14/13.
//  Copyright (c) 2013 David Pettigrew. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum {
    kDPTExtraSmallLightFontStyleName,
    kDPTExtraSmallFontStyleName,
    kDPTExtraSmallBoldFontStyleName,
    kDPTSmallLightFontStyleName,
    kDPTSmallFontStyleName,
    kDPTMediumFontStyleName,
    kDPTMediumLightFontStyleName,
    kDPTMediumBoldFontStyleName,
    kDPTLargeFontStyleName,
    kDPTLargeLightFontStyleName,
    kDPTLargeBoldFontStyleName,
    kDPTExtraLargeLightFontStyleName,
    kDPTExtraLargeFontStyleName,
    kDPTExtraLargeBoldFontStyleName,
    kDPTExtraExtraLargeLightFontStyleName,
    kDPTExtraExtraLargeFontStyleName,
    kDPTExtraExtraLargeBoldFontStyleName,
    kDPTTitleFontStyleName,
} DPTFontStyles;

@interface UIFont (Theme)

+ (UIFont *)dptThemeFontForStyle:(DPTFontStyles)styleName;

@end
