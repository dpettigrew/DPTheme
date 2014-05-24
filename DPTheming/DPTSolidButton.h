//
//  DPTSolidButton.h
//  DPTheming
//
//  Created by David Pettigrew on 3/4/14.
//  Copyright (c) 2014 David Pettigrew. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DPTStyle;

@interface DPTSolidButton : UIButton

@property (nonatomic, copy) NSString *text;
@property (nonatomic, strong) UIFont *font;

@property (nonatomic, strong) UIColor *normalBackgroundColor;
@property (nonatomic, strong) UIColor *normalTextColor;

@property (nonatomic, strong) UIColor *highlightedBackgroundColor;
@property (nonatomic, strong) UIColor *highlightedTextColor;

- (void)configure; // call after setting the above properties

- (void)configureWithNormalStyle:(DPTStyle *)normalStyle highlightedStyle:(DPTStyle *)highlightedStyle text:(NSString *)text;

@end

@interface DPTSolidButtonNormalView : UIView

- (id)initWithFrame:(CGRect)frame backgroundColor:(UIColor *)backgroundColor label:(UILabel *)label;

@property (nonatomic, strong) UIColor *backgroundColor;
@property (nonatomic, strong) UILabel *label;

@end

@interface DPTSolidButtonHighlightedView : UIView

- (id)initWithFrame:(CGRect)frame backgroundColor:(UIColor *)backgroundColor label:(UILabel *)label;

@property (nonatomic, strong) UIColor *backgroundColor;
@property (nonatomic, strong) UILabel *label;

@end
