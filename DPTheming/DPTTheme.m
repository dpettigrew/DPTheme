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

- (UIColor *)backgroundColor {
    NSDictionary *colorDict = _dictionary[@"ColorSchemeBackgroundColor"];
    RGBAColor rgba = [self RGBAColorFromDictionary:colorDict];
    return [self colorWithRGBAColor:rgba];
}

- (UIColor *)foregroundColor {
    NSDictionary *colorDict = _dictionary[@"ColorSchemeForegroundColor"];
    RGBAColor rgba = [self RGBAColorFromDictionary:colorDict];
    return [self colorWithRGBAColor:rgba];
}

- (UIColor *)strongTextColor {
    NSDictionary *colorDict = _dictionary[@"ColorSchemeStrongTextColor"];
    RGBAColor rgba = [self RGBAColorFromDictionary:colorDict];
    return [self colorWithRGBAColor:rgba];
}

- (UIColor *)mediumTextColor {
    NSDictionary *colorDict = _dictionary[@"ColorSchemeMediumTextColor"];
    RGBAColor rgba = [self RGBAColorFromDictionary:colorDict];
    return [self colorWithRGBAColor:rgba];
}

- (UIColor *)weakTextColor {
    NSDictionary *colorDict = _dictionary[@"ColorSchemeWeakTextColor"];
    RGBAColor rgba = [self RGBAColorFromDictionary:colorDict];
    return [self colorWithRGBAColor:rgba];
}

@end
