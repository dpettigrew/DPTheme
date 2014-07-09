//
//  DPTTextField.h
//  TalentCall
//
//  Created by David Pettigrew on 6/2/14.
//  Copyright (c) 2014 TalentCall. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DPTStyle.h"

@interface DPTTextField : UITextField

- (instancetype)initWithStyle:(DPTStyle *)style placeholder:(NSString *)placeholder;

@end
