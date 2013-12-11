//
//  DPTThemeManager.h
//  DPTheming
//
//  Created by David Pettigrew on 12/9/13.
//  Copyright (c) 2013 David Pettigrew. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DPTTheme.h"

static NSString * const kDPTThemeManagerSchemeChangedNotification = @"DPTThemeManagerSchemeChangedNotification";

@interface DPTThemeManager : NSObject

+ (instancetype)createSharedThemeManager:(NSString *)themeName;
+ (instancetype)sharedDPTThemeManager;

- (UIColor *)backgroundColorForTheme:(NSString *)colorScheme;
- (UIColor *)foregroundColorForTheme:(NSString *)colorScheme;
- (UIColor *)strongTextColorForTheme:(NSString *)colorScheme;
- (UIColor *)mediumTextColorForTheme:(NSString *)colorScheme;
- (UIColor *)weakTextColorForTheme:(NSString *)colorScheme;

- (void)setDefaultScheme:(NSString *)themeName;

- (DPTTheme *)defaultTheme;

@end
