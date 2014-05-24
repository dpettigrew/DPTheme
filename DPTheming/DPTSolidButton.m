//
//  DPTSolidButton.m
//  DPTheming
//
//  Created by David Pettigrew on 3/4/14.
//  Copyright (c) 2014 David Pettigrew. All rights reserved.
//

#import "DPTSolidButton.h"
#import "DPTStyle.h"
#import "UIView+Utils.h"

@implementation DPTSolidButtonNormalView

- (id)initWithFrame:(CGRect)frame backgroundColor:(UIColor *)backgroundColor label:(UILabel *)label {
    self = [super initWithFrame:frame];
    if (self) {
        self.opaque = NO;
        _backgroundColor = backgroundColor;
        _label = label;
    }
    return self;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGFloat lineWidth = 1.0;
    
    CGContextSetLineWidth(context, lineWidth);
    CGContextSetStrokeColorWithColor(context, _backgroundColor.CGColor);
    CGContextSetFillColorWithColor(context, _backgroundColor.CGColor);
    CGContextFillRect(context, rect);
    
    [self addSubview:self.label];
}

@end

@implementation DPTSolidButtonHighlightedView

- (id)initWithFrame:(CGRect)frame backgroundColor:(UIColor *)backgroundColor label:(UILabel *)label {
    self = [super initWithFrame:frame];
    if (self) {
        self.opaque = NO;
        _backgroundColor = backgroundColor;
        _label = label;
    }
    return self;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGFloat lineWidth = 1.0;
    
    CGContextSetLineWidth(context, lineWidth);
    CGContextSetStrokeColorWithColor(context, _backgroundColor.CGColor);
    CGContextSetFillColorWithColor(context, _backgroundColor.CGColor);
    CGContextFillRect(context, rect);
    
    [self addSubview:self.label];
}

@end

@implementation DPTSolidButton

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self configure];
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    [self configure];
}

- (void)configure {
    UILabel *normalLabel = [[UILabel alloc] initWithFrame:self.bounds];
    normalLabel.text = self.text;
    normalLabel.font = self.font;
    normalLabel.textAlignment = NSTextAlignmentCenter;
    normalLabel.backgroundColor = self.normalBackgroundColor;
    normalLabel.textColor = self.normalTextColor;
    DPTSolidButtonNormalView *buttonNormalView = [[DPTSolidButtonNormalView alloc] initWithFrame:self.bounds backgroundColor:self.normalBackgroundColor label:normalLabel];
    
    UIImage *normalButtonImage = [buttonNormalView image];
    [self setImage:normalButtonImage forState:UIControlStateNormal];
    
    UILabel *highlightedLabel = [[UILabel alloc] initWithFrame:self.bounds];
    highlightedLabel.text = self.text;
    highlightedLabel.font = self.font;
    highlightedLabel.textAlignment = NSTextAlignmentCenter;
    highlightedLabel.backgroundColor = self.highlightedBackgroundColor;
    highlightedLabel.textColor = self.highlightedTextColor;
    DPTSolidButtonHighlightedView *buttonHighlightedView = [[DPTSolidButtonHighlightedView alloc] initWithFrame:self.bounds backgroundColor:self.highlightedBackgroundColor label:highlightedLabel];
    
    UIImage *buttonHighlightedViewImage = [buttonHighlightedView image];
    [self setImage:buttonHighlightedViewImage forState:UIControlStateHighlighted];
    
    self.accessibilityLabel = self.text;
    [self setTitle:@"" forState:UIControlStateNormal];
}

- (void)configureWithNormalStyle:(DPTStyle *)normalStyle highlightedStyle:(DPTStyle *)highlightedStyle text:(NSString *)text {
    self.text = text;
    self.font = normalStyle.font;
    
    self.normalBackgroundColor = normalStyle.backgroundColor;
    self.normalTextColor = normalStyle.color;
    
    self.highlightedBackgroundColor = highlightedStyle.backgroundColor;
    self.highlightedTextColor = highlightedStyle.color;
    [self configure];
}

@end