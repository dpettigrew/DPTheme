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

@property (readonly) CGFloat extraSmallFontSize;
@property (readonly) CGFloat smallFontSize;
@property (readonly) CGFloat mediumFontSize;
@property (readonly) CGFloat largeFontSize;
@property (readonly) CGFloat extraLargeFontSize;
@property (readonly) CGFloat extraExtraLargeFontSize;
@property (readonly) CGFloat extraExtraExtraLargeFontSize;
@property (readonly) CGFloat titleFontSize;

@property (nonatomic, copy) NSString *lightFontName;
@property (nonatomic, copy) NSString *regularFontName;
@property (nonatomic, copy) NSString *boldFontName;

@property (readonly) UIColor *backgroundColor;
@property (readonly) UIColor *foregroundColor;
@property (readonly) UIColor *strongTextColor;
@property (readonly) UIColor *mediumTextColor;
@property (readonly) UIColor *weakTextColor;

@end
