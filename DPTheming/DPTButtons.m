//
//  DPTSolidButton.m
//  DPTheming
//
//  Created by David Pettigrew on 3/4/14.
//  Copyright (c) 2014 David Pettigrew. All rights reserved.
//

#import "DPTButtons.h"
#import "DPTStyle.h"
#import "UIView+Utils.h"

void strokeAndFillRect(CGContextRef c, CGRect rect) {
    CGContextFillRect(c, rect);
    CGContextStrokeRect(c, rect);
}

#pragma mark DPTFramedView
@interface DPTFramedView : UIView

- (id)initWithFrame:(CGRect)frame backgroundColor:(UIColor *)backgroundColor borderColor:(UIColor *)borderColor label:(UILabel *)label;

@property (nonatomic, strong) UIColor *backgroundColor;
@property (nonatomic, strong) UIColor *borderColor;

@end

@implementation DPTFramedView

- (id)initWithFrame:(CGRect)frame backgroundColor:(UIColor *)backgroundColor borderColor:(UIColor *)borderColor label:(UILabel *)label {
    self = [super initWithFrame:frame];
    if (self) {
        self.opaque = NO;
        _backgroundColor = backgroundColor;
        _borderColor = borderColor;
    }
    return self;
}
@end

#pragma mark DPFramedLabelView
@interface DPFramedLabelView : DPTFramedView

- (id)initWithFrame:(CGRect)frame backgroundColor:(UIColor *)backgroundColor borderColor:(UIColor *)borderColor label:(UILabel *)label;

@property (nonatomic, strong) UIColor *backgroundColor;
@property (nonatomic, strong) UIColor *borderColor;
@property (nonatomic, strong) UILabel *label;

@end

@implementation DPFramedLabelView

- (id)initWithFrame:(CGRect)frame label:(UILabel *)label {
    self = [super initWithFrame:frame];
    if (self) {
        self.opaque = NO;
        _label = label;
        [self addSubview:self.label];
    }
    return self;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
//- (void)drawRect:(CGRect)rect
//{
//    CGContextRef context = UIGraphicsGetCurrentContext();
//    CGPathRef path = CGPathCreateWithRect(rect, NULL);
//    [self.backgroundColor setFill];
//    [self.borderColor setStroke];
//    CGContextFillRect(context, rect);
//    CGContextStrokeRect(context, rect);
//    CGPathRelease(path);
//    self.label.center = CGPointMake(rect.size.width/2.0, rect.size.height/2.0);
//    [self addSubview:self.label];
//}

@end

#pragma mark DPTFramedCustomView
@interface DPTFramedCustomView : DPTFramedView

- (id)initWithFrame:(CGRect)frame customView:(UIView *)customView;

@property (nonatomic, strong) UIView *customView;

@end


@implementation DPTFramedCustomView

- (id)initWithFrame:(CGRect)frame customView:(UIView *)customView {
    self = [super initWithFrame:frame];
    if (self) {
        self.opaque = NO;
        _customView = customView;
    }
    return self;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGPathRef path = CGPathCreateWithRect(rect, NULL);
    [self.backgroundColor setFill];
    [self.borderColor setStroke];
    CGContextFillRect(context, rect);
    CGContextStrokeRect(context, rect);
    CGPathRelease(path);
    self.customView.center = CGPointMake(rect.size.width/2.0, rect.size.height/2.0);
    [self addSubview:self.customView];

}

@end

#pragma mark DPTFramedButton
@implementation DPTFramedButton

@end

#pragma mark DPTFramedLabelButton
@interface DPTFramedLabelButton()

@property (nonatomic, copy) NSString *text;
@property (nonatomic, strong) UIFont *font;

@property (nonatomic, strong) UIColor *normalBackgroundColor;
@property (nonatomic, strong) UIColor *normalBorderColor;
@property (nonatomic, strong) UIColor *normalTextColor;
@property (nonatomic, strong) NSNumber *normalBackgroundOpacity;
@property (nonatomic, strong) UIImage *normalImage;

@property (nonatomic, strong) UIColor *highlightedBackgroundColor;
@property (nonatomic, strong) UIColor *highlightedBorderColor;
@property (nonatomic, strong) UIColor *highlightedTextColor;
@property (nonatomic, strong) NSNumber *highlightedBackgroundOpacity;

@end

@implementation DPTFramedLabelButton

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

- (void)configureLabel:(UILabel *)label textColor:(UIColor *)textColor backgroundColor:(UIColor *)backgroundColor borderColor:(UIColor *)borderColor {
    label.text = self.text;
    label.textColor = textColor;
    label.font = self.font;
    label.textAlignment = NSTextAlignmentCenter;
    label.backgroundColor = backgroundColor;
    label.layer.borderColor = borderColor.CGColor;
    label.layer.borderWidth = 1.0;
}

- (void)configure {
    UILabel *normalLabel = [[UILabel alloc] initWithFrame:self.bounds];
    UIColor *backgroundColor = self.normalBackgroundColor;
    if (self.normalBackgroundOpacity) {
        backgroundColor = [self.normalBackgroundColor colorWithAlphaComponent:[self.normalBackgroundOpacity floatValue]];
    }
    [self configureLabel:normalLabel textColor:self.normalTextColor backgroundColor:backgroundColor borderColor:self.normalBorderColor];
    DPFramedLabelView *buttonNormalView = [[DPFramedLabelView alloc] initWithFrame:self.bounds label:normalLabel];
    
    UIImage *normalButtonImage = [buttonNormalView image];
    [self setImage:normalButtonImage forState:UIControlStateNormal];
    
    UILabel *highlightedLabel = [[UILabel alloc] initWithFrame:self.bounds];
    backgroundColor = self.highlightedBackgroundColor;
    if (self.highlightedBackgroundOpacity) {
        backgroundColor = [self.highlightedBackgroundColor colorWithAlphaComponent:[self.highlightedBackgroundOpacity floatValue]];
    }
    [self configureLabel:highlightedLabel textColor:self.highlightedTextColor backgroundColor:backgroundColor borderColor:self.highlightedBorderColor];
    DPFramedLabelView *buttonHighlightedView = [[DPFramedLabelView alloc] initWithFrame:self.bounds label:highlightedLabel];
    
    UIImage *buttonHighlightedViewImage = [buttonHighlightedView image];
    [self setImage:buttonHighlightedViewImage forState:UIControlStateHighlighted];
    
    self.accessibilityLabel = self.text;
    [self setTitle:@"" forState:UIControlStateNormal];
}

- (void)configureWithNormalStyle:(DPTStyle *)normalStyle highlightedStyle:(DPTStyle *)highlightedStyle text:(NSString *)text {
    self.text = text;
    self.font = normalStyle.font;
    
    self.normalBackgroundColor = normalStyle.backgroundColor;
    self.normalBackgroundOpacity = normalStyle.backgroundOpacity;
    self.normalBorderColor = normalStyle.borderColor;
    self.normalTextColor = normalStyle.color;
    
    self.highlightedBackgroundColor = highlightedStyle.backgroundColor;
    self.highlightedBackgroundOpacity = highlightedStyle.backgroundOpacity;
    self.highlightedTextColor = highlightedStyle.color;
    self.highlightedBorderColor = highlightedStyle.borderColor;
    [self configure];
}

//- (void)configureWithNormalStyle:(DPTStyle *)normalStyle highlightedStyle:(DPTStyle *)highlightedStyle customView:(UIView *)customView {
//    self.text = text;
//    self.font = normalStyle.font;
//    
//    self.normalBackgroundColor = normalStyle.backgroundColor;
//    self.normalBackgroundOpacity = normalStyle.backgroundOpacity;
//    self.normalBorderColor = normalStyle.borderColor;
//    self.normalTextColor = normalStyle.color;
//    
//    self.highlightedBackgroundColor = highlightedStyle.backgroundColor;
//    self.highlightedBackgroundOpacity = highlightedStyle.backgroundOpacity;
//    self.highlightedTextColor = highlightedStyle.color;
//    self.highlightedBorderColor = highlightedStyle.borderColor;
//    [self configure];
//}

@end


@interface DPTFramedLabelViewButton ()

@property (nonatomic, strong) UIImage *image;

@end

@implementation DPTFramedLabelViewButton

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

- (void)configureLabel:(UILabel *)label textColor:(UIColor *)textColor backgroundColor:(UIColor *)backgroundColor borderColor:(UIColor *)borderColor {
    label.text = self.text;
    label.textColor = textColor;
    label.font = self.font;
    label.textAlignment = NSTextAlignmentCenter;
    label.backgroundColor = backgroundColor;
    label.layer.borderColor = borderColor.CGColor;
    label.layer.borderWidth = 1.0;
}

- (void)configure {
    UILabel *normalLabel = [[UILabel alloc] initWithFrame:self.bounds];
    UIColor *backgroundColor = self.normalBackgroundColor;
    if (self.normalBackgroundOpacity) {
        backgroundColor = [self.normalBackgroundColor colorWithAlphaComponent:[self.normalBackgroundOpacity floatValue]];
    }
    [self configureLabel:normalLabel textColor:self.normalTextColor backgroundColor:backgroundColor borderColor:self.normalBorderColor];
    DPFramedLabelView *buttonNormalView = [[DPFramedLabelView alloc] initWithFrame:self.bounds label:normalLabel];
    
    UIImage *normalButtonImage = [buttonNormalView image];
    [self setImage:normalButtonImage forState:UIControlStateNormal];
    
    UILabel *highlightedLabel = [[UILabel alloc] initWithFrame:self.bounds];
    backgroundColor = self.highlightedBackgroundColor;
    if (self.highlightedBackgroundOpacity) {
        backgroundColor = [self.highlightedBackgroundColor colorWithAlphaComponent:[self.highlightedBackgroundOpacity floatValue]];
    }
    [self configureLabel:highlightedLabel textColor:self.highlightedTextColor backgroundColor:backgroundColor borderColor:self.highlightedBorderColor];
    DPFramedLabelView *buttonHighlightedView = [[DPFramedLabelView alloc] initWithFrame:self.bounds label:highlightedLabel];
    
    UIImage *buttonHighlightedViewImage = [buttonHighlightedView image];
    [self setImage:buttonHighlightedViewImage forState:UIControlStateHighlighted];
    
    self.accessibilityLabel = self.text;
    [self setTitle:@"" forState:UIControlStateNormal];
}

- (void)configureWithNormalStyle:(DPTStyle *)normalStyle highlightedStyle:(DPTStyle *)highlightedStyle text:(NSString *)text image:(UIImage *)image {
    self.text = text;
    self.font = normalStyle.font;
    
    self.normalBackgroundColor = normalStyle.backgroundColor;
    self.normalBackgroundOpacity = normalStyle.backgroundOpacity;
    self.normalBorderColor = normalStyle.borderColor;
    self.normalTextColor = normalStyle.color;
    
    self.highlightedBackgroundColor = highlightedStyle.backgroundColor;
    self.highlightedBackgroundOpacity = highlightedStyle.backgroundOpacity;
    self.highlightedTextColor = highlightedStyle.color;
    self.highlightedBorderColor = highlightedStyle.borderColor;
    [self configure];
}

//- (void)configureWithNormalStyle:(DPTStyle *)normalStyle highlightedStyle:(DPTStyle *)highlightedStyle customView:(UIView *)customView {
//    self.text = text;
//    self.font = normalStyle.font;
//
//    self.normalBackgroundColor = normalStyle.backgroundColor;
//    self.normalBackgroundOpacity = normalStyle.backgroundOpacity;
//    self.normalBorderColor = normalStyle.borderColor;
//    self.normalTextColor = normalStyle.color;
//
//    self.highlightedBackgroundColor = highlightedStyle.backgroundColor;
//    self.highlightedBackgroundOpacity = highlightedStyle.backgroundOpacity;
//    self.highlightedTextColor = highlightedStyle.color;
//    self.highlightedBorderColor = highlightedStyle.borderColor;
//    [self configure];
//}

@end