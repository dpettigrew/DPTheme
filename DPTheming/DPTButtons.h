//
//  DPTSolidButton.h
//  DPTheming
//
//  Created by David Pettigrew on 3/4/14.
//  Copyright (c) 2014 David Pettigrew. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DPTStyle;

@interface DPTFramedButton : UIButton

@property (nonatomic, strong) UIColor *normalBackgroundColor;
@property (nonatomic, strong) UIColor *normalBorderColor;
@property (nonatomic, strong) UIColor *normalTextColor;
@property (nonatomic, strong) NSNumber *normalBackgroundOpacity;
@property (nonatomic, strong) UIImage *normalImage;

@property (nonatomic, strong) UIColor *highlightedBackgroundColor;
@property (nonatomic, strong) UIColor *highlightedBorderColor;
@property (nonatomic, strong) UIColor *highlightedTextColor;
@property (nonatomic, strong) NSNumber *highlightedBackgroundOpacity;
@property (nonatomic, strong) UIImage *highlightedImage;

@end

@interface DPTFramedLabelButton : DPTFramedButton

- (void)configureWithNormalStyle:(DPTStyle *)normalStyle highlightedStyle:(DPTStyle *)highlightedStyle text:(NSString *)text;

@end

@interface DPTFramedLabelViewButton : DPTFramedLabelButton

- (void)configureWithNormalStyle:(DPTStyle *)normalStyle highlightedStyle:(DPTStyle *)highlightedStyle text:(NSString *)text image:(UIImage *)image;

@end
