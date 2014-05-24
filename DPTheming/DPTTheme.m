//
//  DPTTheme.m
//  DPTheming
//
//  Created by David Pettigrew on 12/9/13.
//  Copyright (c) 2013 David Pettigrew. All rights reserved.
//

#import "DPTTheme.h"
#import "DPTStyle.h"

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

- (RGBAColor)RGBAColorFromHexString:(NSString *)hexColorString {
    RGBAColor rgba;
    NSString *redStr = [hexColorString substringWithRange:NSRangeFromString(@"{0, 2}")];
    NSString *greenStr = [hexColorString substringWithRange:NSRangeFromString(@"{2, 2}")];
    NSString *blueStr = [hexColorString substringWithRange:NSRangeFromString(@"{4, 2}")];

    unsigned redVal, greenVal, blueVal;
    NSScanner *scanner = [NSScanner scannerWithString:redStr];
    [scanner scanHexInt:&redVal];
    scanner = [NSScanner scannerWithString:greenStr];
    [scanner scanHexInt:&greenVal];
    scanner = [NSScanner scannerWithString:blueStr];
    [scanner scanHexInt:&blueVal];
    
    rgba.red = redVal;
    rgba.green = greenVal;
    rgba.blue = blueVal;
    rgba.alpha = 1.0;
    return rgba;
}

#pragma mark Standard colors
- (UIColor *)backgroundColor {
    return [self colorForNameRef:kDPTBackgroundColor];
}

- (UIColor *)foregroundColor {
    return [self colorForNameRef:kDPTForegroundColor];
}

- (UIColor *)strongTextColor {
    return [self colorForNameRef:kDPTStrongTextColor];
}

- (UIColor *)mediumTextColor {
    return [self colorForNameRef:kDPTMediumTextColor];
}

- (UIColor *)weakTextColor {
    return [self colorForNameRef:kDPTWeakTextColor];
}

- (UIColor *)barTintColor {
    return [self colorForNameRef:kDPTBarTintColor];
}

- (UIColor *)tintColor {
    return [self colorForNameRef:kDPTTintColor];
}

- (UIColor *)colorForNameRef:(NSString *)colorNameRef {
    id color = _dictionary[colorNameRef];
    if (color == nil) {
        return nil;
    }
    if ([color isKindOfClass:[NSDictionary class]]) {
        RGBAColor rgba = [self RGBAColorFromDictionary:color];
        return [self colorWithRGBAColor:rgba];
    }
    else if ([color isKindOfClass:[NSString class]]) {
        if (((NSString *)color).length < 6) {
            NSLog(@"Failed to parse color string - %@", color);
            return nil;
        }
        NSString *colorStr = color;
        if (colorStr.length == 7) {
            // #fefefe format
            colorStr = [color substringFromIndex:1];
        }
        
        RGBAColor rgba = [self RGBAColorFromHexString:colorStr];
        return [self colorWithRGBAColor:rgba];
    }
    else {
        return nil;
    }
}

#pragma mark Font sizes
- (CGFloat) extraSmallFontSize {
    return [self fontSizeForFontSizeRef:kDPTExtraSmallFontSize];
}

- (CGFloat) smallFontSize {
    return [self fontSizeForFontSizeRef:kDPTSmallFontSize];
}

- (CGFloat) mediumFontSize {
    return [self fontSizeForFontSizeRef:kDPTMediumFontSize];
}

- (CGFloat) largeFontSize {
    return [self fontSizeForFontSizeRef:kDPTLargeFontSize];
}

- (CGFloat) extraLargeFontSize {
    return [self fontSizeForFontSizeRef:kDPTExtraLargeFontSize];
}

- (CGFloat) extraExtraLargeFontSize {
    return [self fontSizeForFontSizeRef:kDPTExtraExtraLargeFontSize];
}

- (CGFloat) extraExtraExtraLargeFontSize {
    return [self fontSizeForFontSizeRef:kDPTExtraExtraExtraLargeFontSize];
}

- (CGFloat) titleFontSize {
    return [self fontSizeForFontSizeRef:kDPTTitleFontSize];
}

- (CGFloat)fontSizeForFontSizeRef:(NSString *)fontSizeRef {
    NSNumber *fontSize = _dictionary[fontSizeRef];
    return fontSize.floatValue;
}

#pragma mark Font names
- (NSString *)lightFontName {
    NSString *fontName = _dictionary[kDPTLightFontName];
    return fontName;
}

- (NSString *)regularFontName {
    NSString *fontName = _dictionary[kDPTRegularFontName];
    return fontName;
}

- (NSString *)boldFontName {
    NSString *fontName = _dictionary[kDPTBoldFontName];
    return fontName;
}

- (NSString *)fontNameForFontNameRef:(NSString *)fontNameRef {
    NSString *fontName = _dictionary[fontNameRef];
    return fontName;
}

#pragma mark
- (UIStatusBarStyle)statusBarStyle {
    NSString *statusBarStyle = _dictionary[kDPTStatusBarStyle];
    if ([statusBarStyle isEqualToString:@"UIStatusBarStyleDefault"]) {
        return UIStatusBarStyleDefault;
    }
    else if ([statusBarStyle isEqualToString:@"UIStatusBarStyleLightContent"]) {
        return UIStatusBarStyleLightContent;
    }
    else if ([statusBarStyle isEqualToString:@"UIStatusBarStyleBlackTranslucent"]) {
        return UIStatusBarStyleBlackTranslucent;
    }
    else if ([statusBarStyle isEqualToString:@"UIStatusBarStyleBlackOpaque"]) {
        return UIStatusBarStyleBlackOpaque;
    }
    return UIStatusBarStyleDefault;
}

#pragma mark Text Styles
- (DPTStyle *)textStyleForStyleRef:(NSString *)textStyleRef {
    NSDictionary *textStyleDict = _dictionary[textStyleRef];
    if (!textStyleDict) {
        return nil;
    }
    return [[DPTStyle alloc] initWithDictionary:textStyleDict theme:self];
}

@end
