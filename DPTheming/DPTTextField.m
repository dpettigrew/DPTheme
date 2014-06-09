//
//  DPTTextField.m
//  TalentCall
//
//  Created by David Pettigrew on 6/2/14.
//  Copyright (c) 2014 TalentCall. All rights reserved.
//

#import "DPTTextField.h"

@implementation DPTTextField

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (instancetype)initWithStyle:(DPTStyle *)style placeholder:(NSString *)placeholder {
    self = [super init];
    if (self) {
        NSMutableAttributedString *plText = [[NSMutableAttributedString alloc]initWithString:placeholder];
        NSMutableParagraphStyle *myStringParaStyle1 = [[NSMutableParagraphStyle alloc] init];
        myStringParaStyle1.alignment = style.textAlignment.integerValue;
        
        [plText addAttribute:NSFontAttributeName value:style.font range:NSMakeRange(0, placeholder.length)];
        [plText addAttribute:NSParagraphStyleAttributeName value:myStringParaStyle1 range:NSMakeRange(0, placeholder.length)];
        [plText addAttribute:NSForegroundColorAttributeName value:style.color range:NSMakeRange(0, placeholder.length)];
        self.attributedPlaceholder = plText;
        self.font = style.font;
        self.layer.borderColor = [UIColor dptMediumTextColor].CGColor;
        self.layer.borderWidth = 1.0;
        self.textAlignment = style.textAlignment.integerValue;
        self.textColor = style.color;
        self.keyboardType = UIKeyboardTypeEmailAddress;
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
