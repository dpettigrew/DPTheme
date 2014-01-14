//
//  DPTTheme.h
//  DPTheming
//
//  Created by David Pettigrew on 12/9/13.
//  Copyright (c) 2013 David Pettigrew. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef struct {
    CGFloat red;
    CGFloat green;
    CGFloat blue;
    CGFloat alpha;
} RGBAColor;

// Define the strings used in the theme plist file.
// Colors
static NSString * const kColorSchemeBackgroundColor = @"ColorSchemeBackgroundColor";
static NSString * const kColorSchemeForegroundColor = @"ColorSchemeForegroundColor";
static NSString * const kColorSchemeStrongTextColor = @"ColorSchemeStrongTextColor";
static NSString * const kColorSchemeMediumTextColor = @"ColorSchemeMediumTextColor";
static NSString * const kColorSchemeWeakTextColor = @"ColorSchemeWeakTextColor";
static NSString * const kColorSchemeBarTintColor = @"ColorSchemeBarTintColor";
static NSString * const kColorSchemeTintColor = @"ColorSchemeTintColor";

// Font sizes
static NSString * const kExtraSmallFontSize = @"ExtraSmallFontSize";
static NSString * const kSmallFontSize = @"SmallFontSize";
static NSString * const kMediumFontSize = @"MediumFontSize";
static NSString * const kLargeFontSize = @"LargeFontSize";
static NSString * const kExtraLargeFontSize = @"ExtraLargeFontSize";
static NSString * const kExtraExtraLargeFontSize = @"ExtraExtraLargeFontSize";
static NSString * const kExtraExtraExtraLargeFontSize = @"ExtraExtraExtraLargeFontSize";
static NSString * const kTitleFontSize = @"TitleFontSize";

// Font names
static NSString * const kLightFontName = @"LightFontName";
static NSString * const kRegularFontName = @"RegularFontName";
static NSString * const kBoldFontName = @"BoldFontName";

@interface DPTTheme : NSObject

- (instancetype)initWithPlistFile:(NSString *)filePath andThemeName:(NSString *)themeName;

@property (nonatomic, copy) NSString *themeName;

@property (readonly) CGFloat extraSmallFontSize;
@property (readonly) CGFloat smallFontSize;
@property (readonly) CGFloat mediumFontSize;
@property (readonly) CGFloat largeFontSize;
@property (readonly) CGFloat extraLargeFontSize;
@property (readonly) CGFloat extraExtraLargeFontSize;
@property (readonly) CGFloat extraExtraExtraLargeFontSize;
@property (readonly) CGFloat titleFontSize;

@property (nonatomic, copy) NSString *lightFontName;
@property (nonatomic, copy) NSString *regularFontName;
@property (nonatomic, copy) NSString *boldFontName;

@property (readonly) UIColor *backgroundColor;
@property (readonly) UIColor *foregroundColor;
@property (readonly) UIColor *strongTextColor;
@property (readonly) UIColor *mediumTextColor;
@property (readonly) UIColor *weakTextColor;
@property (readonly) UIColor *barTintColor;
@property (readonly) UIColor *tintColor;

@end
