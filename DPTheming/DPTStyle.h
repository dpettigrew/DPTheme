//
//  DPTTextStyle.h
//
//  Created by David Pettigrew on 5/19/14.
//  Copyright (c) 2014 David Pettigrew. All rights reserved.
//

#import <Foundation/Foundation.h>

@class DPTTheme;

static NSString * const kH1StyleRef = @"h1";
static NSString * const kH2StyleRef = @"h2";
static NSString * const kH3StyleRef = @"h3";
static NSString * const kH4StyleRef = @"h4";
static NSString * const kParagraphStyleRef = @"p";

@interface DPTStyle : NSObject

@property (nonatomic, strong) UIFont *font;
@property (nonatomic, strong) UIColor *color;
@property (nonatomic, strong) UIColor *backgroundColor;
@property (nonatomic, strong) UIColor *borderColor;
@property (nonatomic, strong) NSNumber *backgroundOpacity;

- (instancetype)initWithDictionary:(NSDictionary *)textStyleDictionary theme:(DPTTheme *)theme;
- (instancetype)initWithDictionary:(NSDictionary *)textStyleDictionary;

+ (DPTStyle *)styleForStyleRef:(NSString *)styleRef;

@end
