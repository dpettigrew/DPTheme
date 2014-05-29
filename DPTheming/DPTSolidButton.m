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

void strokeAndFillRect(CGContextRef c, CGRect rect) {
    CGContextFillRect(c, rect);
    CGContextStrokeRect(c, rect);
}

@interface DPTBorderedRectView : UIView

- (id)initWithFrame:(CGRect)frame backgroundColor:(UIColor *)backgroundColor borderColor:(UIColor *)borderColor label:(UILabel *)label;

@property (nonatomic, strong) UIColor *backgroundColor;
@property (nonatomic, strong) UIColor *borderColor;
@property (nonatomic, strong) UILabel *label;

@end

@implementation DPTBorderedRectView

- (id)initWithFrame:(CGRect)frame backgroundColor:(UIColor *)backgroundColor borderColor:(UIColor *)borderColor label:(UILabel *)label {
    self = [super initWithFrame:frame];
    if (self) {
        self.opaque = NO;
        _backgroundColor = backgroundColor;
        _borderColor = borderColor;
        _label = label;
    }
    return self;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGPathRef path = CGPathCreateWithRect(rect, NULL);
    [_backgroundColor setFill];
    [_borderColor setStroke];
    CGContextFillRect(context, rect);
    CGContextStrokeRect(context, rect);
    CGPathRelease(path);
    self.label.center = CGPointMake(rect.size.width/2.0, rect.size.height/2.0);
    [self addSubview:self.label];
}

@end

@implementation DPTSolidButton

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)configureLabel:(UILabel *)label textColor:(UIColor *)textColor backgroundColor:(UIColor *)backgroundColor {
    label.text = self.text;
    label.textColor = textColor;
    label.font = self.font;
    label.textAlignment = NSTextAlignmentCenter;
    label.backgroundColor = backgroundColor;
    [label sizeToFit];
}

- (void)configure {
    UILabel *normalLabel = [[UILabel alloc] initWithFrame:self.bounds];
    UIColor *backgroundColor = self.normalBackgroundColor;
    if (self.normalBackgroundOpacity) {
        backgroundColor = [self.normalBackgroundColor colorWithAlphaComponent:[self.normalBackgroundOpacity floatValue]];
    }
    [self configureLabel:normalLabel textColor:self.normalTextColor backgroundColor:backgroundColor];
    DPTBorderedRectView *buttonNormalView = [[DPTBorderedRectView alloc] initWithFrame:self.bounds backgroundColor:backgroundColor borderColor:self.normalBorderColor label:normalLabel];
    
    UIImage *normalButtonImage = [buttonNormalView image];
    [self setImage:normalButtonImage forState:UIControlStateNormal];
    
    UILabel *highlightedLabel = [[UILabel alloc] initWithFrame:self.bounds];
    backgroundColor = self.highlightedBackgroundColor;
    if (self.highlightedBackgroundOpacity) {
        backgroundColor = [self.highlightedBackgroundColor colorWithAlphaComponent:[self.highlightedBackgroundOpacity floatValue]];
    }
    [self configureLabel:highlightedLabel textColor:self.highlightedTextColor backgroundColor:backgroundColor];
    DPTBorderedRectView *buttonHighlightedView = [[DPTBorderedRectView alloc] initWithFrame:self.bounds backgroundColor:self.highlightedBackgroundColor borderColor:self.highlightedBorderColor label:highlightedLabel];
    
    UIImage *buttonHighlightedViewImage = [buttonHighlightedView image];
    [self setImage:buttonHighlightedViewImage forState:UIControlStateHighlighted];
    
    self.accessibilityLabel = self.text;
    [self setTitle:@"" forState:UIControlStateNormal];
}

- (void)configureWithNormalStyle:(DPTStyle *)normalStyle highlightedStyle:(DPTStyle *)highlightedStyle text:(NSString *)text {
    self.text = text;
    self.font = normalStyle.font;
    
    self.normalBackgroundColor = normalStyle.backgroundColor;
    self.normalBorderColor = normalStyle.borderColor;
    self.normalTextColor = normalStyle.color;
    
    self.highlightedBackgroundColor = highlightedStyle.backgroundColor;
    self.highlightedTextColor = highlightedStyle.color;
    self.highlightedBorderColor = highlightedStyle.borderColor;
    [self configure];
}

@end