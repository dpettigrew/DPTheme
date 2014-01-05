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

+ (instancetype)initializeThemeManagerWithTheme:(NSString *)themeName;
+ (instancetype)sharedDPTThemeManager;

- (UIColor *)backgroundColorForTheme:(NSString *)themeName;
- (UIColor *)foregroundColorForTheme:(NSString *)themeName;
- (UIColor *)strongTextColorForTheme:(NSString *)themeName;
- (UIColor *)mediumTextColorForTheme:(NSString *)themeName;
- (UIColor *)weakTextColorForTheme:(NSString *)themeName;

- (DPTTheme *)getThemeNamed:(NSString *)themeName;

@property (nonatomic, strong) DPTTheme *currentTheme;

@end
