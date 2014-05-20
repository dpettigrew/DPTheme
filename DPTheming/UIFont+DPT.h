//
//  UIFont+DPT.h
//  DPTheming
//
//  Created by David Pettigrew on 6/14/13.
//  Copyright (c) 2013 David Pettigrew. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DPTTheme;

typedef enum {
    kDPTExtraSmallLightFontStyleName,
    kDPTExtraSmallFontStyleName,
    kDPTExtraSmallBoldFontStyleName,
    kDPTSmallLightFontStyleName,
    kDPTSmallFontStyleName,
    kDPTSmallBoldFontStyleName,
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

// TODO Add support for italics

@interface UIFont (Theme)

+ (UIFont *)dptThemeFontForStyle:(DPTFontStyles)fontStyle;
+ (UIFont *)dptThemeFontForFontNameRef:(NSString *)fontNameRef size:(CGFloat)fontSize theme:(DPTTheme *)theme;

@end
