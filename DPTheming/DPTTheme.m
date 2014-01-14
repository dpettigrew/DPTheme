//
//  DPTTheme.m
//  DPTheming
//
//  Created by David Pettigrew on 12/9/13.
//  Copyright (c) 2013 David Pettigrew. All rights reserved.
//

#import "DPTTheme.h"

@interface DPTTheme ()

@property (nonatomic, strong) NSDictionary *dictionary;

@end

@implementation DPTTheme

- (instancetype)initWithPlistFile:(NSString *)filePath andThemeName:(NSString *)themeName {
    self = [super init];
    if (self) {
        _themeName = themeName;
        _dictionary = [NSDictionary dictionaryWithContentsOfFile:filePath];
    }
    return self;
}

- (UIColor *)colorWithRGBAColor:(RGBAColor)rgba {
    return [UIColor colorWithRed:rgba.red/255.0 green:rgba.green/255.0 blue:rgba.blue/255.0 alpha:rgba.alpha];
}

- (RGBAColor)RGBAColorFromDictionary:(NSDictionary *)colorDict {
    RGBAColor rgba;
    rgba.red = [(NSNumber *)colorDict[@"red"] floatValue];
    rgba.green = [(NSNumber *)colorDict[@"green"] floatValue];
    rgba.blue = [(NSNumber *)colorDict[@"blue"] floatValue];
    rgba.alpha = [(NSNumber *)colorDict[@"alpha"] floatValue];
    return rgba;
}

#pragma mark Standard colors
- (UIColor *)backgroundColor {
    NSDictionary *colorDict = _dictionary[kColorSchemeBackgroundColor];
    RGBAColor rgba = [self RGBAColorFromDictionary:colorDict];
    return [self colorWithRGBAColor:rgba];
}

- (UIColor *)foregroundColor {
    NSDictionary *colorDict = _dictionary[kColorSchemeForegroundColor];
    RGBAColor rgba = [self RGBAColorFromDictionary:colorDict];
    return [self colorWithRGBAColor:rgba];
}

- (UIColor *)strongTextColor {
    NSDictionary *colorDict = _dictionary[kColorSchemeStrongTextColor];
    RGBAColor rgba = [self RGBAColorFromDictionary:colorDict];
    return [self colorWithRGBAColor:rgba];
}

- (UIColor *)mediumTextColor {
    NSDictionary *colorDict = _dictionary[kColorSchemeMediumTextColor];
    RGBAColor rgba = [self RGBAColorFromDictionary:colorDict];
    return [self colorWithRGBAColor:rgba];
}

- (UIColor *)weakTextColor {
    NSDictionary *colorDict = _dictionary[kColorSchemeWeakTextColor];
    RGBAColor rgba = [self RGBAColorFromDictionary:colorDict];
    return [self colorWithRGBAColor:rgba];
}

- (UIColor *)barTintColor {
    NSDictionary *colorDict = _dictionary[kColorSchemeBarTintColor];
    RGBAColor rgba = [self RGBAColorFromDictionary:colorDict];
    return [self colorWithRGBAColor:rgba];
}

- (UIColor *)tintColor {
    NSDictionary *colorDict = _dictionary[kColorSchemeTintColor];
    RGBAColor rgba = [self RGBAColorFromDictionary:colorDict];
    return [self colorWithRGBAColor:rgba];
}

#pragma mark Font sizes
- (CGFloat) extraSmallFontSize {
    NSNumber *fontSize = _dictionary[kExtraSmallFontSize];
    return fontSize.floatValue;
}

- (CGFloat) smallFontSize {
    NSNumber *fontSize = _dictionary[kSmallFontSize];
    return fontSize.floatValue;
}

- (CGFloat) mediumFontSize {
    NSNumber *fontSize = _dictionary[kMediumFontSize];
    return fontSize.floatValue;
}

- (CGFloat) largeFontSize {
    NSNumber *fontSize = _dictionary[kLargeFontSize];
    return fontSize.floatValue;
}

- (CGFloat) extraLargeFontSize {
    NSNumber *fontSize = _dictionary[kExtraLargeFontSize];
    return fontSize.floatValue;
}

- (CGFloat) extraExtraLargeFontSize {
    NSNumber *fontSize = _dictionary[kExtraExtraLargeFontSize];
    return fontSize.floatValue;
}

- (CGFloat) extraExtraExtraLargeFontSize {
    NSNumber *fontSize = _dictionary[kExtraExtraExtraLargeFontSize];
    return fontSize.floatValue;
}

- (CGFloat) titleFontSize {
    NSNumber *fontSize = _dictionary[kTitleFontSize];
    return fontSize.floatValue;
}

#pragma mark Font names
- (NSString *)lightFontName {
    NSString *fontName = _dictionary[kLightFontName];
    return fontName;
}

- (NSString *)regularFontName {
    NSString *fontName = _dictionary[kRegularFontName];
    return fontName;
}

- (NSString *)boldFontName {
    NSString *fontName = _dictionary[kBoldFontName];
    return fontName;
}

@end
