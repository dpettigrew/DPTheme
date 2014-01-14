//
//  DPTThemeManager.m
//  DPTheming
//
//  Created by David Pettigrew on 12/9/13.
//  Copyright (c) 2013 David Pettigrew. All rights reserved.
//

#import "DPTThemeManager.h"
#import "DPTLabels.h"
#import "UIFont+DPT.h"
#import "UIColor+DPT.h"

@interface DPTThemeManager () {
    NSMutableDictionary *_themes;
    DPTTheme *_currentTheme;
}

@end

@implementation DPTThemeManager

#pragma mark
+ (void)setupAppearanceProxies {
    // UILabel appearance proxies
    [[DPTExtraSmallLabel appearance] setFont:[UIFont dptThemeFontForStyle:kDPTExtraSmallLightFontStyleName]];
    [[DPTExtraSmallLabel appearance] setFont:[UIFont dptThemeFontForStyle:kDPTExtraSmallFontStyleName]];
    [[DPTExtraSmallBoldLabel appearance] setFont:[UIFont dptThemeFontForStyle:kDPTExtraSmallBoldFontStyleName]];
    [[DPTSmallLabel appearanceWhenContainedIn:[UIView class], nil] setFont:[UIFont dptThemeFontForStyle:kDPTSmallLightFontStyleName]];
    [[DPTSmallLabel appearanceWhenContainedIn:[UIView class], nil] setFont:[UIFont dptThemeFontForStyle:kDPTSmallFontStyleName]];
    [[DPTMediumLabel appearanceWhenContainedIn:[UIView class], nil] setFont:[UIFont dptThemeFontForStyle:kDPTMediumFontStyleName]];
    [[DPTMediumLightLabel appearanceWhenContainedIn:[UIView class], nil] setFont:[UIFont dptThemeFontForStyle:kDPTMediumLightFontStyleName]];
    [[DPTMediumBoldLabel appearanceWhenContainedIn:[UIView class], nil] setFont:[UIFont dptThemeFontForStyle:kDPTMediumBoldFontStyleName]];
    [[DPTLargeLabel appearanceWhenContainedIn:[UIView class], nil] setFont:[UIFont dptThemeFontForStyle:kDPTLargeFontStyleName]];
    [[DPTLargeLightLabel appearanceWhenContainedIn:[UIView class], nil] setFont:[UIFont dptThemeFontForStyle:kDPTLargeLightFontStyleName]];
    [[DPTLargeBoldLabel appearanceWhenContainedIn:[UIView class], nil] setFont:[UIFont dptThemeFontForStyle:kDPTLargeBoldFontStyleName]];
    [[DPTXLLightLabel appearanceWhenContainedIn:[UIView class], nil] setFont:[UIFont dptThemeFontForStyle:kDPTExtraLargeFontStyleName]];
    [[DPTXLLabel appearanceWhenContainedIn:[UIView class], nil] setFont:[UIFont dptThemeFontForStyle:kDPTExtraLargeFontStyleName]];
    [[DPTXLBoldLabel appearanceWhenContainedIn:[UIView class], nil] setFont:[UIFont dptThemeFontForStyle:kDPTExtraLargeBoldFontStyleName]];
    [[DPTLargeLabel appearanceWhenContainedIn:[UIView class], nil] setFont:[UIFont dptThemeFontForStyle:kDPTSmallFontStyleName]];
    [[DPTXXLLabel appearanceWhenContainedIn:[UIView class], nil] setFont:[UIFont dptThemeFontForStyle:kDPTExtraExtraLargeFontStyleName]];
    [[DPTXXLBoldLabel appearanceWhenContainedIn:[UIView class], nil] setFont:[UIFont dptThemeFontForStyle:kDPTExtraExtraLargeBoldFontStyleName]];
    [[DPTLargeBoldLabel appearanceWhenContainedIn:[UIButton class], nil] setFont:[UIFont dptThemeFontForStyle:kDPTLargeBoldFontStyleName]];
    [[DPTTitleLabel appearanceWhenContainedIn:[UIButton class], nil] setFont:[UIFont dptThemeFontForStyle:kDPTTitleFontStyleName]];

    // UITextView appearance proxy
    [[UITextView appearanceWhenContainedIn:[UIView class], nil] setFont:[UIFont dptThemeFontForStyle:kDPTMediumFontStyleName]];

    [[UIToolbar appearance] setTintColor:[UIColor dptTintColor]];
    [[UIBarButtonItem appearance] setTintColor:[UIColor dptTintColor]];
    [[UISegmentedControl appearance] setTintColor:[UIColor dptTintColor]];

    NSString *systemVersion = [[UIDevice currentDevice] systemVersion];
    if ([systemVersion compare:@"7.0" options:NSNumericSearch] == NSOrderedAscending) // before iOS 7
    {
        [[UINavigationBar appearance] setTintColor:[UIColor dptBarTintColor]];
        [[UINavigationBar appearance] setTitleTextAttributes:
         [NSDictionary dictionaryWithObjectsAndKeys:
          [UIColor dptTintColor], NSForegroundColorAttributeName,
          [UIColor dptBarTintColor], NSBackgroundColorAttributeName,
          [UIFont dptThemeFontForStyle:kDPTLargeBoldFontStyleName], NSFontAttributeName,
          [UIColor dptTintColor], UITextAttributeTextShadowColor,
          [NSValue valueWithUIOffset:UIOffsetMake(0, -1)], UITextAttributeTextShadowOffset,
          nil]];
    }
    else { // iOS 7 and later
        [[UINavigationBar appearance] setBarTintColor:[UIColor dptBarTintColor]];
        [[UINavigationBar appearance] setTintColor:[UIColor dptTintColor]];
        [[UINavigationBar appearance] setTitleTextAttributes:
         [NSDictionary dictionaryWithObjectsAndKeys:
          [UIColor dptTintColor], NSForegroundColorAttributeName,
          [UIColor dptBarTintColor], NSBackgroundColorAttributeName,
          [UIFont dptThemeFontForStyle:kDPTLargeBoldFontStyleName], NSFontAttributeName,
          nil]];
    }
}

+ (instancetype)initializeThemeManagerWithThemeNamed:(NSString *)themeName {
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
