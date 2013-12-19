//
//  DPTThemeManager.m
//  DPTheming
//
//  Created by David Pettigrew on 12/9/13.
//  Copyright (c) 2013 David Pettigrew. All rights reserved.
//

#import "DPTThemeManager.h"
#import "DPTViews.h"
#import "UIFont+Theme.h"
#import "UIColor+ColorScheme.h"

@interface DPTThemeManager () {
    NSMutableDictionary *_themes;
    DPTTheme *_currentTheme;
}

@end

@implementation DPTThemeManager

#pragma mark
+ (void)setupAppearanceProxies {
    // UILabel appearance proxies
    [[DPTExtraSmallLabel appearance] setFont:[UIFont themeFontForStyle:kDPTExtraSmallLightFontStyleName]];
    [[DPTExtraSmallLabel appearance] setFont:[UIFont themeFontForStyle:kDPTExtraSmallFontStyleName]];
    [[DPTExtraSmallBoldLabel appearance] setFont:[UIFont themeFontForStyle:kDPTExtraSmallBoldFontStyleName]];
    [[DPTSmallLabel appearanceWhenContainedIn:[UIView class], nil] setFont:[UIFont themeFontForStyle:kDPTSmallLightFontStyleName]];
    [[DPTSmallLabel appearanceWhenContainedIn:[UIView class], nil] setFont:[UIFont themeFontForStyle:kDPTSmallFontStyleName]];
    [[DPTMediumLabel appearanceWhenContainedIn:[UIView class], nil] setFont:[UIFont themeFontForStyle:kDPTMediumFontStyleName]];
    [[DPTMediumLightLabel appearanceWhenContainedIn:[UIView class], nil] setFont:[UIFont themeFontForStyle:kDPTMediumLightFontStyleName]];
    [[DPTMediumBoldLabel appearanceWhenContainedIn:[UIView class], nil] setFont:[UIFont themeFontForStyle:kDPTMediumBoldFontStyleName]];
    [[DPTLargeLabel appearanceWhenContainedIn:[UIView class], nil] setFont:[UIFont themeFontForStyle:kDPTLargeFontStyleName]];
    [[DPTLargeLightLabel appearanceWhenContainedIn:[UIView class], nil] setFont:[UIFont themeFontForStyle:kDPTLargeLightFontStyleName]];
    [[DPTLargeBoldLabel appearanceWhenContainedIn:[UIView class], nil] setFont:[UIFont themeFontForStyle:kDPTLargeBoldFontStyleName]];
    [[DPTXLLightLabel appearanceWhenContainedIn:[UIView class], nil] setFont:[UIFont themeFontForStyle:kDPTExtraLargeFontStyleName]];
    [[DPTXLLabel appearanceWhenContainedIn:[UIView class], nil] setFont:[UIFont themeFontForStyle:kDPTExtraLargeFontStyleName]];
    [[DPTXLBoldLabel appearanceWhenContainedIn:[UIView class], nil] setFont:[UIFont themeFontForStyle:kDPTExtraLargeBoldFontStyleName]];
    [[DPTLargeLabel appearanceWhenContainedIn:[UIView class], nil] setFont:[UIFont themeFontForStyle:kDPTSmallFontStyleName]];
    [[DPTXXLLabel appearanceWhenContainedIn:[UIView class], nil] setFont:[UIFont themeFontForStyle:kDPTExtraExtraLargeFontStyleName]];
    [[DPTXXLBoldLabel appearanceWhenContainedIn:[UIView class], nil] setFont:[UIFont themeFontForStyle:kDPTExtraExtraLargeBoldFontStyleName]];
    [[DPTLargeBoldLabel appearanceWhenContainedIn:[UIButton class], nil] setFont:[UIFont themeFontForStyle:kDPTLargeBoldFontStyleName]];
    [[DPTTitleLabel appearanceWhenContainedIn:[UIButton class], nil] setFont:[UIFont themeFontForStyle:kDPTTitleFontStyleName]];

    // UITextView appearance proxy
    [[UITextView appearanceWhenContainedIn:[UIView class], nil] setFont:[UIFont themeFontForStyle:kDPTMediumFontStyleName]];
}

+ (instancetype)createSharedThemeManager:(NSString *)themeName {
    DPTThemeManager *sharedDPTThemeManager = [DPTThemeManager sharedDPTThemeManager];
    DPTTheme *theme = [sharedDPTThemeManager getThemeNamed:themeName];
    [sharedDPTThemeManager setCurrentTheme:theme];
    return sharedDPTThemeManager;
}

+ (instancetype)sharedDPTThemeManager {
    static dispatch_once_t onceToken;
    static id sharedDPTThemeManager = nil;
    
    dispatch_once( &onceToken, ^{
        sharedDPTThemeManager = [[[self class] alloc] init];
    });
    
    return sharedDPTThemeManager;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        _themes = [NSMutableDictionary new];
    }
    return self;
}

- (DPTTheme *)currentTheme {
    return _currentTheme;
}

- (DPTTheme *)getThemeNamed:(NSString *)themeName {
    if (_themes[themeName]) {
        return _themes[themeName];
    }
    
    NSString *filePath = [[[NSBundle mainBundle] bundlePath] stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.plist", themeName]];
    _themes[themeName] = [[DPTTheme alloc] initWithPlistFile:filePath andThemeName:themeName];
    return _themes[themeName];
}

- (void)setCurrentTheme:(DPTTheme *)theme {
    _currentTheme = theme;
    [DPTThemeManager setupAppearanceProxies];
    [[NSNotificationCenter defaultCenter] postNotificationName:kDPTThemeManagerSchemeChangedNotification object:nil];
}

- (UIColor *)backgroundColorForTheme:(NSString *)themeName {
    DPTTheme *theme = [self getThemeNamed:themeName];
    return [theme backgroundColor];
}

- (UIColor *)foregroundColorForTheme:(NSString *)themeName {
    DPTTheme *theme = [self getThemeNamed:themeName];
    return [theme foregroundColor];
}

- (UIColor *)strongTextColorForTheme:(NSString *)themeName {
    DPTTheme *theme = [self getThemeNamed:themeName];
    return [theme strongTextColor];
}

- (UIColor *)mediumTextColorForTheme:(NSString *)themeName {
    DPTTheme *theme = [self getThemeNamed:themeName];
    return [theme mediumTextColor];
}

- (UIColor *)weakTextColorForTheme:(NSString *)themeName {
    DPTTheme *theme = [self getThemeNamed:themeName];
    return [theme weakTextColor];
}

@end
