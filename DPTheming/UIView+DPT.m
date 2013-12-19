//
//  UIView+DPT.m
//  DPTheming
//
//  Created by David Pettigrew on 5/22/13.
//  Copyright (c) 2013 David Pettigrew. All rights reserved.
//

#import "UIView+DPT.h"
#import <QuartzCore/QuartzCore.h>
#import "UIColor+DPT.h"

@implementation UIView (Theme)

- (void)theme {
    self.layer.cornerRadius = 10.0f;
    self.layer.masksToBounds = YES;
    self.backgroundColor = [UIColor foregroundColor];
}

@end