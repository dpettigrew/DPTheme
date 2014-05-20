//
//  DPTTheme.h
//  DPTheming
//
//  Created by David Pettigrew on 12/9/13.
//  Copyright (c) 2013 David Pettigrew. All rights reserved.
//

#import <Foundation/Foundation.h>

@class DPTTextStyle;

typedef struct {
    CGFloat red;
    CGFloat green;
    CGFloat blue;
    CGFloat alpha;
} RGBAColor;

// Define the strings used in the theme plist file.
// Colors
static NSString * const kDPTBackgroundColor = @"BackgroundColor";
static NSString * const kDPTForegroundColor = @"ForegroundColor";
static NSString * const kDPTStrongTextColor = @"StrongTextColor";
static NSString * const kDPTMediumTextColor = @"MediumTextColor";
static NSString * const kDPTWeakTextColor = @"WeakTextColor";
static NSString * const kDPTBarTintColor = @"BarTintColor";
static NSString * const kDPTTintColor = @"TintColor";

// Font sizes
static NSString * const kDPTExtraSmallFontSize = @"ExtraSmallFontSize";
static NSString * const kDPTSmallFontSize = @"SmallFontSize";
static NSString * const kDPTMediumFontSize = @"MediumFontSize";
static NSString * const kDPTLargeFontSize = @"LargeFontSize";
static NSString * const kDPTExtraLargeFontSize = @"ExtraLargeFontSize";
static NSString * const kDPTExtraExtraLargeFontSize = @"ExtraExtraLargeFontSize";
static NSString * const kDPTExtraExtraExtraLargeFontSize = @"ExtraExtraExtraLargeFontSize";
static NSString * const kDPTTitleFontSize = @"TitleFontSize";

// Font names
static NSString * const kDPTLightFontName = @"LightFontName";
static NSString * const kDPTRegularFontName = @"RegularFontName";
static NSString * const kDPTBoldFontName = @"BoldFontName";

// Other
static NSString * const kDPTStatusBarStyle = @"StatusBarStyle";

@interface DPTTheme : NSObject

- (instancetype)initWithPlistFile:(NSString *)filePath andThemeName:(NSString *)themeName;

@property (nonatomic, copy) NSString *themeName;

// Standard font size properties
@property (readonly) CGFloat extraSmallFontSize;
@property (readonly) CGFloat smallFontSize;
@property (readonly) CGFloat mediumFontSize;
@property (readonly) CGFloat largeFontSize;
@property (readonly) CGFloat extraLargeFontSize;
@property (readonly) CGFloat extraExtraLargeFontSize;
@property (readonly) CGFloat extraExtraExtraLargeFontSize;
@property (readonly) CGFloat titleFontSize;

// Standard font name properties
@property (nonatomic, copy) NSString *lightFontName;
@property (nonatomic, copy) NSString *regularFontName;
@property (nonatomic, copy) NSString *boldFontName;

// Standard color properties
@property (readonly) UIColor *backgroundColor;
@property (readonly) UIColor *foregroundColor;
@property (readonly) UIColor *strongTextColor;
@property (readonly) UIColor *mediumTextColor;
@property (readonly) UIColor *weakTextColor;
@property (readonly) UIColor *barTintColor;
@property (readonly) UIColor *tintColor;
@property (readonly) UIStatusBarStyle statusBarStyle;

// Generic accessors for color, font and font size.
- (UIColor *)colorForNameRef:(NSString *)colorNameRef;
- (NSString *)fontNameForFontNameRef:(NSString *)fontNameRef;
- (CGFloat)fontSizeForFontSizeRef:(NSString *)fontSizeRef;

// Text Styles
- (DPTTextStyle *)textStyleForStyleRef:(NSString *)textStyleNameRef;

@end
