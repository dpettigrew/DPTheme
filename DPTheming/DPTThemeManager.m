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
    // UITextView appearance proxy
    [[UITextView appearance] setFont:[UIFont dptThemeFontForStyle:kDPTMediumFontStyleName]];
    [[UITextView appearance] setBackgroundColor:[UIColor dptBackgroundColor]];
    [[UITextView appearance] setTextColor:[UIColor dptStrongTextColor]];

    [[UIBarButtonItem appearance] setTintColor:[UIColor dptTintColor]];
    [[UISegmentedControl appearance] setTintColor:[UIColor dptTintColor]];
    [[UIButton appearance] setTitleColor:[UIColor dptTintColor] forState:UIControlStateNormal];

    NSString *systemVersion = [[UIDevice currentDevice] systemVersion];
    if ([systemVersion compare:@"7.0" options:NSNumericSearch] == NSOrderedAscending) // before iOS 7
    {
#if __IPHONE_OS_VERSION_MIN_REQUIRED < 70000
        [[UINavigationBar appearance] setTitleTextAttributes:
         [NSDictionary dictionaryWithObjectsAndKeys:
          [UIColor dptTintColor], UITextAttributeTextColor,
          [UIFont dptThemeFontForStyle:kDPTLargeBoldFontStyleName], UITextAttributeFont,
          [UIColor dptTintColor], UITextAttributeTextShadowColor,
          [NSValue valueWithUIOffset:UIOffsetMake(0, -1)], UITextAttributeTextShadowOffset,
          nil]];
#endif
    }
    else { // iOS 7 and later
        [[UIToolbar appearance] setBarTintColor:[UIColor dptBarTintColor]];
        [[UINavigationBar appearance] setBarTintColor:[UIColor dptBarTintColor]];
        [[UINavigationBar appearance] setTitleTextAttributes:
         [NSDictionary dictionaryWithObjectsAndKeys:
          [UIColor dptTintColor], NSForegroundColorAttributeName,
          [UIColor dptBarTintColor], NSBackgroundColorAttributeName,
          [UIFont dptThemeFontForStyle:kDPTLargeBoldFontStyleName], NSFontAttributeName,
          nil]];
    }
}

+ (instancetype)initializeSharedThemeManagerWithThemeNamed:(NSString *)themeName appearanceProxySetup:(void (^)(void))appearanceProxySetupBlock {
    DPTThemeManager *sharedDPTThemeManager = [DPTThemeManager sharedDPTThemeManager];
    DPTTheme *theme = [sharedDPTThemeManager getThemeNamed:themeName];
    [sharedDPTThemeManager setCurrentTheme:theme appearanceProxySetup:appearanceProxySetupBlock];
    return sharedDPTThemeManager;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        _themes = [NSMutableDictionary new];
    }
    return self;
}

- (instancetype)initWithTheme:(NSString *)themeName appearanceProxySetup:(void (^)(void))appearanceProxySetupBlock {
    self = [self init];
    if (self) {
        DPTTheme *theme = [self getThemeNamed:themeName];
        [self setCurrentTheme:theme appearanceProxySetup:appearanceProxySetupBlock];
    }
    return self;
}

+ (instancetype)sharedDPTThemeManager {
    static dispatch_once_t onceToken;
    static id sharedDPTThemeManager = nil;
    
    dispatch_once( &onceToken, ^{
        sharedDPTThemeManager = [[[self class] alloc] init];
    });
    
    return sharedDPTThemeManager;
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

- (void)setCurrentTheme:(DPTTheme *)theme appearanceProxySetup:(void (^)(void))appearanceProxySetupBlock {
    _currentTheme = theme;
    if (appearanceProxySetupBlock) {
        appearanceProxySetupBlock();
    }
    else {
        [DPTThemeManager setupAppearanceProxies];
    }
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
