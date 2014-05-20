//
//  DPTTextStyle.m
//
//  Created by David Pettigrew on 5/19/14.
//  Copyright (c) 2014 David Pettigrew. All rights reserved.
//

#import "DPTTextStyle.h"
#import "UIFont+DPT.h"
#import "UIColor+DPT.h"
#import "DPTThemeManager.h"

@implementation DPTTextStyle

- (instancetype)initWithDictionary:(NSDictionary *)textStyleDictionary theme:(DPTTheme *)theme {
    self = [super init];
    if (self) {
        NSString *fontNameRef = textStyleDictionary[@"FontRef"];
        NSString *fontSizeRef = textStyleDictionary[@"SizeRef"];
        NSString *colorRef = textStyleDictionary[@"TextColorRef"];
        NSString *backgroundColorRef = textStyleDictionary[@"BackgroundColorRef"];
        CGFloat fontSize = [theme fontSizeForFontSizeRef:fontSizeRef];
        self.font = [UIFont dptThemeFontForFontNameRef:fontNameRef size:fontSize theme:theme];
        self.color = [theme colorForNameRef:colorRef];
        self.backgroundColor = [theme colorForNameRef:backgroundColorRef];
    }
    return self;
}

- (instancetype)initWithDictionary:(NSDictionary *)textStyleDictionary {
    self = [self initWithDictionary:textStyleDictionary theme:[DPTThemeManager sharedDPTThemeManager].currentTheme];
    return self;
}

+ (DPTTextStyle *)textStyleForStyleRef:(NSString *)styleRef {
    DPTTheme *theme = [DPTThemeManager sharedDPTThemeManager].currentTheme;
    return [theme textStyleForStyleRef:styleRef];
}

@end
