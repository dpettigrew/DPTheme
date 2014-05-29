//
//  DPTTextStyle.m
//
//  Created by David Pettigrew on 5/19/14.
//  Copyright (c) 2014 David Pettigrew. All rights reserved.
//

#import "DPTStyle.h"
#import "UIFont+DPT.h"
#import "UIColor+DPT.h"
#import "DPTThemeManager.h"

@implementation DPTStyle

- (instancetype)initWithDictionary:(NSDictionary *)textStyleDictionary theme:(DPTTheme *)theme {
    self = [super init];
    if (self) {
        NSString *fontNameRef = textStyleDictionary[@"FontRef"];
        NSString *fontSizeRef = textStyleDictionary[@"SizeRef"];
        NSString *colorRef = textStyleDictionary[@"TextColorRef"];
        NSString *backgroundColorRef = textStyleDictionary[@"BackgroundColorRef"];
        NSString *borderColorRef = textStyleDictionary[@"BorderColorRef"];
        CGFloat fontSize = [theme fontSizeForFontSizeRef:fontSizeRef];
        self.font = [UIFont dptThemeFontForFontNameRef:fontNameRef size:fontSize theme:theme];
        self.color = [theme colorForNameRef:colorRef];
        self.backgroundColor = [theme colorForNameRef:backgroundColorRef];
        self.borderColor = [theme colorForNameRef:borderColorRef];
        self.backgroundOpacity = textStyleDictionary[@"BackgroundOpacity"];
    }
    return self;
}

- (instancetype)initWithDictionary:(NSDictionary *)textStyleDictionary {
    self = [self initWithDictionary:textStyleDictionary theme:[DPTThemeManager sharedDPTThemeManager].currentTheme];
    return self;
}

+ (DPTStyle *)styleForStyleRef:(NSString *)styleRef {
    DPTTheme *theme = [DPTThemeManager sharedDPTThemeManager].currentTheme;
    return [theme styleForStyleRef:styleRef];
}

@end
