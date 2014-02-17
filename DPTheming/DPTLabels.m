//
//  UIAppearanceContainerViews.m
//  DPTheming
//
//  Created by David Pettigrew on 6/10/13.
//  Copyright (c) 2013 David Pettigrew All rights reserved.
//

#import "DPTLabels.h"
#import "UIFont+DPT.h"

@implementation DPTExtraSmallLightLabel

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.font = [UIFont dptThemeFontForStyle:kDPTExtraSmallLightFontStyleName];
        self.textColor = [UIColor dptStrongTextColor];
        self.backgroundColor = [UIColor dptBackgroundColor];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)coder {
    self = [super initWithCoder:coder];
    if (self) {
        self.font = [UIFont dptThemeFontForStyle:kDPTExtraSmallLightFontStyleName];
        self.textColor = [UIColor dptStrongTextColor];
        self.backgroundColor = [UIColor dptBackgroundColor];
    }
    return self;
}

@end

@implementation DPTExtraSmallLabel

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.font = [UIFont dptThemeFontForStyle:kDPTExtraSmallFontStyleName];
        self.textColor = [UIColor dptStrongTextColor];
        self.backgroundColor = [UIColor dptBackgroundColor];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)coder {
    self = [super initWithCoder:coder];
    if (self) {
        self.font = [UIFont dptThemeFontForStyle:kDPTExtraSmallFontStyleName];
        self.textColor = [UIColor dptStrongTextColor];
        self.backgroundColor = [UIColor dptBackgroundColor];
    }
    return self;
}

@end

@implementation DPTExtraSmallBoldLabel

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.font = [UIFont dptThemeFontForStyle:kDPTExtraSmallBoldFontStyleName];
        self.textColor = [UIColor dptStrongTextColor];
        self.backgroundColor = [UIColor dptBackgroundColor];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)coder {
    self = [super initWithCoder:coder];
    if (self) {
        self.font = [UIFont dptThemeFontForStyle:kDPTExtraSmallBoldFontStyleName];
        self.textColor = [UIColor dptStrongTextColor];
        self.backgroundColor = [UIColor dptBackgroundColor];
    }
    return self;
}

@end

@implementation DPTSmallLightLabel

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.font = [UIFont dptThemeFontForStyle:kDPTSmallLightFontStyleName];
        self.textColor = [UIColor dptStrongTextColor];
        self.backgroundColor = [UIColor dptBackgroundColor];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)coder {
    self = [super initWithCoder:coder];
    if (self) {
        self.font = [UIFont dptThemeFontForStyle:kDPTSmallLightFontStyleName];
        self.textColor = [UIColor dptStrongTextColor];
        self.backgroundColor = [UIColor dptBackgroundColor];
    }
    return self;
}

@end

@implementation DPTSmallLabel

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.font = [UIFont dptThemeFontForStyle:kDPTSmallFontStyleName];
        self.textColor = [UIColor dptStrongTextColor];
        self.backgroundColor = [UIColor dptBackgroundColor];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)coder {
    self = [super initWithCoder:coder];
    if (self) {
        self.font = [UIFont dptThemeFontForStyle:kDPTSmallFontStyleName];
        self.textColor = [UIColor dptStrongTextColor];
        self.backgroundColor = [UIColor dptBackgroundColor];
    }
    return self;
}

@end

@implementation DPTSmallBoldLabel

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.font = [UIFont dptThemeFontForStyle:kDPTSmallBoldFontStyleName];
        self.textColor = [UIColor dptStrongTextColor];
        self.backgroundColor = [UIColor dptBackgroundColor];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)coder {
    self = [super initWithCoder:coder];
    if (self) {
        self.font = [UIFont dptThemeFontForStyle:kDPTSmallBoldFontStyleName];
        self.textColor = [UIColor dptStrongTextColor];
        self.backgroundColor = [UIColor dptBackgroundColor];
    }
    return self;
}

@end

@implementation DPTMediumLabel

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.font = [UIFont dptThemeFontForStyle:kDPTMediumFontStyleName];
        self.textColor = [UIColor dptStrongTextColor];
        self.backgroundColor = [UIColor dptBackgroundColor];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)coder {
    self = [super initWithCoder:coder];
    if (self) {
        self.font = [UIFont dptThemeFontForStyle:kDPTMediumFontStyleName];
        self.textColor = [UIColor dptStrongTextColor];
        self.backgroundColor = [UIColor dptBackgroundColor];
    }
    return self;
}

@end

@implementation DPTMediumLightLabel

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.font = [UIFont dptThemeFontForStyle:kDPTMediumLightFontStyleName];
        self.textColor = [UIColor dptStrongTextColor];
        self.backgroundColor = [UIColor dptBackgroundColor];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)coder {
    self = [super initWithCoder:coder];
    if (self) {
        self.font = [UIFont dptThemeFontForStyle:kDPTMediumLightFontStyleName];
        self.textColor = [UIColor dptStrongTextColor];
        self.backgroundColor = [UIColor dptBackgroundColor];
    }
    return self;
}

@end

@implementation DPTMediumBoldLabel

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.font = [UIFont dptThemeFontForStyle:kDPTMediumBoldFontStyleName];
        self.textColor = [UIColor dptStrongTextColor];
        self.backgroundColor = [UIColor dptBackgroundColor];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)coder {
    self = [super initWithCoder:coder];
    if (self) {
        self.font = [UIFont dptThemeFontForStyle:kDPTMediumBoldFontStyleName];
        self.textColor = [UIColor dptStrongTextColor];
        self.backgroundColor = [UIColor dptBackgroundColor];
    }
    return self;
}

@end

@implementation DPTLargeLabel

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.font = [UIFont dptThemeFontForStyle:kDPTLargeFontStyleName];
        self.textColor = [UIColor dptStrongTextColor];
        self.backgroundColor = [UIColor dptBackgroundColor];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)coder {
    self = [super initWithCoder:coder];
    if (self) {
        self.font = [UIFont dptThemeFontForStyle:kDPTLargeFontStyleName];
        self.textColor = [UIColor dptStrongTextColor];
        self.backgroundColor = [UIColor dptBackgroundColor];
    }
    return self;
}

@end

@implementation DPTLargeLightLabel

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.font = [UIFont dptThemeFontForStyle:kDPTLargeLightFontStyleName];
        self.textColor = [UIColor dptStrongTextColor];
        self.backgroundColor = [UIColor dptBackgroundColor];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)coder {
    self = [super initWithCoder:coder];
    if (self) {
        self.font = [UIFont dptThemeFontForStyle:kDPTLargeLightFontStyleName];
        self.textColor = [UIColor dptStrongTextColor];
        self.backgroundColor = [UIColor dptBackgroundColor];
    }
    return self;
}

@end

@implementation DPTLargeBoldLabel

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.font = [UIFont dptThemeFontForStyle:kDPTLargeBoldFontStyleName];
        self.textColor = [UIColor dptStrongTextColor];
        self.backgroundColor = [UIColor dptBackgroundColor];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)coder {
    self = [super initWithCoder:coder];
    if (self) {
        self.font = [UIFont dptThemeFontForStyle:kDPTLargeBoldFontStyleName];
        self.textColor = [UIColor dptStrongTextColor];
        self.backgroundColor = [UIColor dptBackgroundColor];
    }
    return self;
}

@end

@implementation DPTXLBoldLabel

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.font = [UIFont dptThemeFontForStyle:kDPTExtraLargeBoldFontStyleName];
        self.textColor = [UIColor dptStrongTextColor];
        self.backgroundColor = [UIColor dptBackgroundColor];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)coder {
    self = [super initWithCoder:coder];
    if (self) {
        self.font = [UIFont dptThemeFontForStyle:kDPTExtraLargeBoldFontStyleName];
        self.textColor = [UIColor dptStrongTextColor];
        self.backgroundColor = [UIColor dptBackgroundColor];
    }
    return self;
}

@end

@implementation DPTXLLabel

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.font = [UIFont dptThemeFontForStyle:kDPTExtraLargeFontStyleName];
        self.textColor = [UIColor dptStrongTextColor];
        self.backgroundColor = [UIColor dptBackgroundColor];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)coder {
    self = [super initWithCoder:coder];
    if (self) {
        self.font = [UIFont dptThemeFontForStyle:kDPTExtraLargeFontStyleName];
        self.textColor = [UIColor dptStrongTextColor];
        self.backgroundColor = [UIColor dptBackgroundColor];
    }
    return self;
}

@end

@implementation DPTXLLightLabel

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.font = [UIFont dptThemeFontForStyle:kDPTExtraLargeLightFontStyleName];
        self.textColor = [UIColor dptStrongTextColor];
        self.backgroundColor = [UIColor dptBackgroundColor];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)coder {
    self = [super initWithCoder:coder];
    if (self) {
        self.font = [UIFont dptThemeFontForStyle:kDPTExtraLargeLightFontStyleName];
        self.textColor = [UIColor dptStrongTextColor];
        self.backgroundColor = [UIColor dptBackgroundColor];
    }
    return self;
}

@end

@implementation DPTXXLLabel

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.font = [UIFont dptThemeFontForStyle:kDPTExtraExtraLargeFontStyleName];
        self.textColor = [UIColor dptStrongTextColor];
        self.backgroundColor = [UIColor dptBackgroundColor];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)coder {
    self = [super initWithCoder:coder];
    if (self) {
        self.font = [UIFont dptThemeFontForStyle:kDPTExtraExtraLargeFontStyleName];
        self.textColor = [UIColor dptStrongTextColor];
        self.backgroundColor = [UIColor dptBackgroundColor];
    }
    return self;
}

@end

@implementation DPTXXLLightLabel

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.font = [UIFont dptThemeFontForStyle:kDPTExtraExtraLargeLightFontStyleName];
        self.textColor = [UIColor dptStrongTextColor];
        self.backgroundColor = [UIColor dptBackgroundColor];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)coder {
    self = [super initWithCoder:coder];
    if (self) {
        self.font = [UIFont dptThemeFontForStyle:kDPTExtraExtraLargeLightFontStyleName];
        self.textColor = [UIColor dptStrongTextColor];
        self.backgroundColor = [UIColor dptBackgroundColor];
    }
    return self;
}

@end

@implementation DPTXXLBoldLabel

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.font = [UIFont dptThemeFontForStyle:kDPTExtraExtraLargeBoldFontStyleName];
        self.textColor = [UIColor dptStrongTextColor];
        self.backgroundColor = [UIColor dptBackgroundColor];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)coder {
    self = [super initWithCoder:coder];
    if (self) {
        self.font = [UIFont dptThemeFontForStyle:kDPTExtraExtraLargeBoldFontStyleName];
        self.textColor = [UIColor dptStrongTextColor];
        self.backgroundColor = [UIColor dptBackgroundColor];
    }
    return self;
}

@end

@implementation DPTTitleLabel

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.font = [UIFont dptThemeFontForStyle:kDPTTitleFontStyleName];
        self.textColor = [UIColor dptStrongTextColor];
        self.backgroundColor = [UIColor dptBackgroundColor];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)coder {
    self = [super initWithCoder:coder];
    if (self) {
        self.font = [UIFont dptThemeFontForStyle:kDPTTitleFontStyleName];
        self.textColor = [UIColor dptStrongTextColor];
        self.backgroundColor = [UIColor dptBackgroundColor];
    }
    return self;
}

@end
