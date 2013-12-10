//
//  DPTThemeManager.m
//  DPTheming
//
//  Created by David Pettigrew on 12/9/13.
//  Copyright (c) 2013 David Pettigrew. All rights reserved.
//

#import "DPTThemeManager.h"
#import "DPTViews.h"
#import "UIFont+Preferred.h"
#import "UIColor+ColorScheme.h"

@interface DPTThemeManager () {
    NSMutableDictionary *_themes;
    DPTTheme *_defaultTheme;
}

@end

@implementation DPTThemeManager

#pragma mark
- (void)setupAppearanceProxies {
    [[SmallLightLabel appearanceWhenContainedIn:[UIView class], nil] setFont:[UIFont preferredFontForStyle:kSmallLightFontStyleName]];
    [[SmallLabel appearanceWhenContainedIn:[UIView class], nil] setFont:[UIFont preferredFontForStyle:kSmallFontStyleName]];
    [[MediumLabel appearanceWhenContainedIn:[UIView class], nil] setFont:[UIFont preferredFontForStyle:kMediumFontStyleName]];
    [[MediumBoldLabel appearanceWhenContainedIn:[UIView class], nil] setFont:[UIFont preferredFontForStyle:kMediumBoldFontStyleName]];
    [[LargeLabel appearanceWhenContainedIn:[UIView class], nil] setFont:[UIFont preferredFontForStyle:kLargeFontStyleName]];
    [[LargeLightLabel appearanceWhenContainedIn:[UIView class], nil] setFont:[UIFont preferredFontForStyle:kLargeLightFontStyleName]];
    [[LargeBoldLabel appearanceWhenContainedIn:[UIView class], nil] setFont:[UIFont preferredFontForStyle:kLargeBoldFontStyleName]];
    [[XLLabel appearanceWhenContainedIn:[UIView class], nil] setFont:[UIFont preferredFontForStyle:kExtraLargeFontStyleName]];
    [[XLBoldLabel appearanceWhenContainedIn:[UIView class], nil] setFont:[UIFont preferredFontForStyle:kExtraLargeBoldFontStyleName]];
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
        [[XXLLabel appearanceWhenContainedIn:[UIView class], nil] setFont:[UIFont preferredFontForStyle:kExtraExtraExtraLargeFontStyleName]];
        [[XXLBoldLabel appearanceWhenContainedIn:[UIView class], nil] setFont:[UIFont preferredFontForStyle:kExtraExtraExtraLargeBoldFontStyleName]];
    }
    else {
        [[LargeLabel appearanceWhenContainedIn:[UIView class], nil] setFont:[UIFont preferredFontForStyle:kSmallFontStyleName]];
        [[XXLLabel appearanceWhenContainedIn:[UIView class], nil] setFont:[UIFont preferredFontForStyle:kExtraExtraLargeFontStyleName]];
        [[XXLBoldLabel appearanceWhenContainedIn:[UIView class], nil] setFont:[UIFont preferredFontForStyle:kExtraExtraLargeBoldFontStyleName]];
    }
    [[LargeBoldLabel appearanceWhenContainedIn:[UIButton class], nil] setFont:[UIFont preferredFontForStyle:kLargeBoldFontStyleName]];
    [[UITextView appearanceWhenContainedIn:[UIView class], nil] setFont:[UIFont preferredFontForStyle:kMediumFontStyleName]];
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
        NSString *defaultThemeName = [[NSUserDefaults standardUserDefaults] valueForKey:@"DPTDefaultColorScheme"];
        if (defaultThemeName) {
            _defaultTheme = [self getTheme:defaultThemeName];
        }
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
    [[NSUserDefaults standardUserDefaults] setValue:themeName forKey:@"DPTDefaultColorScheme"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    _defaultTheme = [self getTheme:themeName];
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
