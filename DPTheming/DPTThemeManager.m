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
    DPTTheme *_defaultTheme;
}

@end

@implementation DPTThemeManager

#pragma mark
+ (void)setupAppearanceProxies {
    // UILabel appearance proxies
    [[ExtraSmallLightLabel appearance] setFont:[UIFont themeFontForStyle:kExtraSmallLightFontStyleName]];
    [[ExtraSmallLabel appearance] setFont:[UIFont themeFontForStyle:kExtraSmallFontStyleName]];
    [[ExtraSmallBoldLabel appearance] setFont:[UIFont themeFontForStyle:kExtraSmallBoldFontStyleName]];
    [[SmallLightLabel appearanceWhenContainedIn:[UIView class], nil] setFont:[UIFont themeFontForStyle:kSmallLightFontStyleName]];
    [[SmallLabel appearanceWhenContainedIn:[UIView class], nil] setFont:[UIFont themeFontForStyle:kSmallFontStyleName]];
    [[MediumLabel appearanceWhenContainedIn:[UIView class], nil] setFont:[UIFont themeFontForStyle:kMediumFontStyleName]];
    [[MediumLightLabel appearanceWhenContainedIn:[UIView class], nil] setFont:[UIFont themeFontForStyle:kMediumLightFontStyleName]];
    [[MediumBoldLabel appearanceWhenContainedIn:[UIView class], nil] setFont:[UIFont themeFontForStyle:kMediumBoldFontStyleName]];
    [[LargeLabel appearanceWhenContainedIn:[UIView class], nil] setFont:[UIFont themeFontForStyle:kLargeFontStyleName]];
    [[LargeLightLabel appearanceWhenContainedIn:[UIView class], nil] setFont:[UIFont themeFontForStyle:kLargeLightFontStyleName]];
    [[LargeBoldLabel appearanceWhenContainedIn:[UIView class], nil] setFont:[UIFont themeFontForStyle:kLargeBoldFontStyleName]];
    [[XLLightLabel appearanceWhenContainedIn:[UIView class], nil] setFont:[UIFont themeFontForStyle:kExtraLargeFontStyleName]];
    [[XLLabel appearanceWhenContainedIn:[UIView class], nil] setFont:[UIFont themeFontForStyle:kExtraLargeFontStyleName]];
    [[XLBoldLabel appearanceWhenContainedIn:[UIView class], nil] setFont:[UIFont themeFontForStyle:kExtraLargeBoldFontStyleName]];
    [[LargeLabel appearanceWhenContainedIn:[UIView class], nil] setFont:[UIFont themeFontForStyle:kSmallFontStyleName]];
    [[XXLLabel appearanceWhenContainedIn:[UIView class], nil] setFont:[UIFont themeFontForStyle:kExtraExtraLargeFontStyleName]];
    [[XXLBoldLabel appearanceWhenContainedIn:[UIView class], nil] setFont:[UIFont themeFontForStyle:kExtraExtraLargeBoldFontStyleName]];
    [[LargeBoldLabel appearanceWhenContainedIn:[UIButton class], nil] setFont:[UIFont themeFontForStyle:kLargeBoldFontStyleName]];
    [[TitleLabel appearanceWhenContainedIn:[UIButton class], nil] setFont:[UIFont themeFontForStyle:kTitleFontStyleName]];

    // UITextView appearance proxy
    [[UITextView appearanceWhenContainedIn:[UIView class], nil] setFont:[UIFont themeFontForStyle:kMediumFontStyleName]];
}

+ (instancetype)createSharedThemeManager:(NSString *)themeName {
    DPTThemeManager *sharedDPTThemeManager = [DPTThemeManager sharedDPTThemeManager];
    [sharedDPTThemeManager setDefaultScheme:themeName];
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

- (DPTTheme *)defaultTheme {
    return _defaultTheme;
}

- (DPTTheme *)getTheme:(NSString *)themeName {
    if (_themes[themeName]) {
        return _themes[themeName];
    }
    
    NSString *filePath = [[[NSBundle mainBundle] bundlePath] stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.plist", themeName]];
    _themes[themeName] = [[DPTTheme alloc] initWithPlistFile:filePath andThemeName:themeName];
    return _themes[themeName];
}

- (void)setDefaultScheme:(NSString *)themeName {
    _defaultTheme = [self getTheme:themeName];
    [DPTThemeManager setupAppearanceProxies];
    [[NSNotificationCenter defaultCenter] postNotificationName:kDPTThemeManagerSchemeChangedNotification object:nil];
}

- (UIColor *)backgroundColorForTheme:(NSString *)themeName {
    DPTTheme *theme = [self getTheme:themeName];
    return [theme backgroundColor];
}

- (UIColor *)foregroundColorForTheme:(NSString *)themeName {
    DPTTheme *theme = [self getTheme:themeName];
    return [theme foregroundColor];
}

- (UIColor *)strongTextColorForTheme:(NSString *)themeName {
    DPTTheme *theme = [self getTheme:themeName];
    return [theme strongTextColor];
}

- (UIColor *)mediumTextColorForTheme:(NSString *)themeName {
    DPTTheme *theme = [self getTheme:themeName];
    return [theme mediumTextColor];
}

- (UIColor *)weakTextColorForTheme:(NSString *)themeName {
    DPTTheme *theme = [self getTheme:themeName];
    return [theme weakTextColor];
}

@end
