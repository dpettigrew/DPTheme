//
//  UIView+Theme.m
//  NumberPress
//
//  Created by David Pettigrew on 5/22/13.
//  Copyright (c) 2013 LifeCentrics. All rights reserved.
//

#import "UIView+Theme.h"
#import <QuartzCore/QuartzCore.h>
#import "UIColor+ColorScheme.h"

@implementation UIView (Theme)

- (void)theme {
    self.layer.cornerRadius = 10.0f;
    self.layer.masksToBounds = YES;
    self.backgroundColor = [UIColor foregroundColor];
}

@end
