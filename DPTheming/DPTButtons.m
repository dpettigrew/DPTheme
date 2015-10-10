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

#pragma mark DPTFramedLabelView
@interface DPTFramedLabelView : DPTFramedView

@property (nonatomic, strong) UILabel *label;

@end

@implementation DPTFramedLabelView

- (id)initWithFrame:(CGRect)frame label:(UILabel *)label {
    self = [super initWithFrame:frame];
    if (self) {
        self.opaque = NO;
        _label = label;
        [self addSubview:self.label];
    }
    return self;
}

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

@end

#pragma mark DPTFramedButton
@implementation DPTFramedButton

@end

#pragma mark DPTFramedLabelButton
@interface DPTFramedLabelButton()

@property (nonatomic, copy) NSString *text;
@property (nonatomic, strong) UIFont *font;

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

- (void)configureLabel:(UILabel *)label textColor:(UIColor *)textColor backgroundColor:(UIColor *)backgroundColor {
    label.text = self.text;
    label.textColor = textColor;
    label.font = self.font;
    label.textAlignment = NSTextAlignmentCenter;
    label.backgroundColor = backgroundColor;
}

- (void)configure {
    UILabel *normalLabel = [[UILabel alloc] initWithFrame:self.bounds];
    UIColor *backgroundColor = self.normalBackgroundColor;
    if (self.normalBackgroundOpacity) {
        backgroundColor = [self.normalBackgroundColor colorWithAlphaComponent:[self.normalBackgroundOpacity floatValue]];
    }
    [self configureLabel:normalLabel textColor:self.normalTextColor backgroundColor:backgroundColor];
    normalLabel.layer.borderColor = self.normalBorderColor.CGColor;
    normalLabel.layer.borderWidth = 1.0;
    
    UIImage *normalButtonImage = [normalLabel image];
    [self setImage:normalButtonImage forState:UIControlStateNormal];
    
    UILabel *highlightedLabel = [[UILabel alloc] initWithFrame:self.bounds];
    backgroundColor = self.highlightedBackgroundColor;
    if (self.highlightedBackgroundOpacity) {
        backgroundColor = [self.highlightedBackgroundColor colorWithAlphaComponent:[self.highlightedBackgroundOpacity floatValue]];
    }
    [self configureLabel:highlightedLabel textColor:self.highlightedTextColor backgroundColor:backgroundColor];
    highlightedLabel.layer.borderColor = self.normalBorderColor.CGColor;
    highlightedLabel.layer.borderWidth = 1.0;
    
    UIImage *buttonHighlightedViewImage = [highlightedLabel image];
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

@end


@interface DPTFramedLabelViewButton ()

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

- (UIImage *)buttonImageWithTextColor:(UIColor *)textColor backgroundOpacity:(NSNumber *)backgroundOpacity backgroundColor:(UIColor *)backgroundColor borderColor:(UIColor *)borderColor image:(UIImage *)image {
    UIView *buttonView = [[UIView alloc] initWithFrame:self.bounds];
    
    // highlighted label
    UILabel *buttonLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    UIColor *buttonBackgroundColor = backgroundColor;
    if (backgroundOpacity) {
        buttonBackgroundColor = [backgroundColor colorWithAlphaComponent:[backgroundOpacity floatValue]];
    }
    [self configureLabel:buttonLabel textColor:textColor backgroundColor:buttonBackgroundColor];
    [buttonLabel sizeToFit];
    buttonLabel.textAlignment = NSTextAlignmentRight;
    
    // highlighted image view
    CGFloat imageSize = buttonLabel.frame.size.height/2.0;
    UIImageView *buttonImageView = [[UIImageView alloc] initWithFrame:CGRectMake(buttonLabel.frame.size.width + 5, imageSize/2.0, imageSize, imageSize)];
    buttonImageView.contentMode = UIViewContentModeScaleAspectFit;
    buttonImageView.image = image;
    
    UIView *combinedView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, buttonLabel.frame.size.width + 5 + buttonImageView.frame.size.width, buttonLabel.frame.size.height)];
    [combinedView addSubview:buttonLabel];
    [combinedView addSubview:buttonImageView];
    [buttonView addSubview:combinedView];
    combinedView.center = buttonView.center;
    
    buttonView.backgroundColor = buttonBackgroundColor;
    combinedView.backgroundColor = buttonBackgroundColor;
    
    // add the border
    if (borderColor) {
        buttonView.layer.borderColor = borderColor.CGColor;
        buttonView.layer.borderWidth = 1.0;
    }
    // set the button highlighted state image
    return [buttonView image];
}

- (void)configure {
    UIImage *normalImage = [self buttonImageWithTextColor:self.normalTextColor backgroundOpacity:self.normalBackgroundOpacity backgroundColor:self.normalBackgroundColor borderColor:self.normalBorderColor image:self.normalImage];
    [self setImage:normalImage forState:UIControlStateNormal];
    UIImage *highlightedImage = [self buttonImageWithTextColor:self.highlightedTextColor backgroundOpacity:self.highlightedBackgroundOpacity backgroundColor:self.highlightedBackgroundColor borderColor:self.highlightedBorderColor image:self.highlightedImage];
    [self setImage:highlightedImage forState:UIControlStateHighlighted];
    self.accessibilityLabel = self.text;
    [self setTitle:@"" forState:UIControlStateNormal];
}

- (void)configureWithNormalStyle:(DPTStyle *)normalStyle highlightedStyle:(DPTStyle *)highlightedStyle text:(NSString *)text normalImage:(UIImage *)normalImage highlightedImage:(UIImage *)highlightedImage {
    [super configureWithNormalStyle:normalStyle highlightedStyle:highlightedStyle text:text];
    self.highlightedImage = highlightedImage;
    self.normalImage = normalImage;
    [self configure];
}

@end