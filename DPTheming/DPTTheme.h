//
//  DPTTheme.h
//  DPTheming
//
//  Created by David Pettigrew on 12/9/13.
//  Copyright (c) 2013 David Pettigrew. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef struct {
    CGFloat red;
    CGFloat green;
    CGFloat blue;
    CGFloat alpha;
} RGBAColor;

@interface DPTTheme : NSObject

- (instancetype)initWithPlistFile:(NSString *)filePath andThemeName:(NSString *)themeName;

@property (nonatomic, copy) NSString *themeName;

- (UIColor *)backgroundColor;
- (UIColor *)foregroundColor;
- (UIColor *)strongTextColor;
- (UIColor *)mediumTextColor;
- (UIColor *)weakTextColor;

@end
