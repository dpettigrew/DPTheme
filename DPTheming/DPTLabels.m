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
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)coder {
    self = [super initWithCoder:coder];
    if (self) {
        self.font = [UIFont dptThemeFontForStyle:kDPTExtraSmallLightFontStyleName];
    }
    return self;
}

@end

@implementation DPTExtraSmallLabel

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.font = [UIFont dptThemeFontForStyle:kDPTExtraSmallFontStyleName];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)coder {
    self = [super initWithCoder:coder];
    if (self) {
        self.font = [UIFont dptThemeFontForStyle:kDPTExtraSmallFontStyleName];
    }
    return self;
}

@end

@implementation DPTExtraSmallBoldLabel

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.font = [UIFont dptThemeFontForStyle:kDPTExtraSmallBoldFontStyleName];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)coder {
    self = [super initWithCoder:coder];
    if (self) {
        self.font = [UIFont dptThemeFontForStyle:kDPTExtraSmallBoldFontStyleName];
    }
    return self;
}

@end

@implementation DPTSmallLightLabel

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.font = [UIFont dptThemeFontForStyle:kDPTSmallLightFontStyleName];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)coder {
    self = [super initWithCoder:coder];
    if (self) {
        self.font = [UIFont dptThemeFontForStyle:kDPTSmallLightFontStyleName];
    }
    return self;
}

@end

@implementation DPTSmallLabel

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.font = [UIFont dptThemeFontForStyle:kDPTSmallFontStyleName];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)coder {
    self = [super initWithCoder:coder];
    if (self) {
        self.font = [UIFont dptThemeFontForStyle:kDPTSmallFontStyleName];
    }
    return self;
}

@end

@implementation DPTSmallBoldLabel

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.font = [UIFont dptThemeFontForStyle:kDPTSmallBoldFontStyleName];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)coder {
    self = [super initWithCoder:coder];
    if (self) {
        self.font = [UIFont dptThemeFontForStyle:kDPTSmallBoldFontStyleName];
    }
    return self;
}

@end

@implementation DPTMediumLabel

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.font = [UIFont dptThemeFontForStyle:kDPTMediumFontStyleName];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)coder {
    self = [super initWithCoder:coder];
    if (self) {
        self.font = [UIFont dptThemeFontForStyle:kDPTMediumFontStyleName];
    }
    return self;
}

@end

@implementation DPTMediumLightLabel

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.font = [UIFont dptThemeFontForStyle:kDPTMediumLightFontStyleName];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)coder {
    self = [super initWithCoder:coder];
    if (self) {
        self.font = [UIFont dptThemeFontForStyle:kDPTMediumLightFontStyleName];
    }
    return self;
}

@end

@implementation DPTMediumBoldLabel

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.font = [UIFont dptThemeFontForStyle:kDPTMediumBoldFontStyleName];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)coder {
    self = [super initWithCoder:coder];
    if (self) {
        self.font = [UIFont dptThemeFontForStyle:kDPTMediumBoldFontStyleName];
    }
    return self;
}

@end

@implementation DPTLargeLabel

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.font = [UIFont dptThemeFontForStyle:kDPTLargeFontStyleName];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)coder {
    self = [super initWithCoder:coder];
    if (self) {
        self.font = [UIFont dptThemeFontForStyle:kDPTLargeFontStyleName];
    }
    return self;
}

@end

@implementation DPTLargeLightLabel

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.font = [UIFont dptThemeFontForStyle:kDPTLargeLightFontStyleName];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)coder {
    self = [super initWithCoder:coder];
    if (self) {
        self.font = [UIFont dptThemeFontForStyle:kDPTLargeLightFontStyleName];
    }
    return self;
}

@end

@implementation DPTLargeBoldLabel

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.font = [UIFont dptThemeFontForStyle:kDPTLargeBoldFontStyleName];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)coder {
    self = [super initWithCoder:coder];
    if (self) {
        self.font = [UIFont dptThemeFontForStyle:kDPTLargeBoldFontStyleName];
    }
    return self;
}

@end

@implementation DPTXLBoldLabel

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.font = [UIFont dptThemeFontForStyle:kDPTExtraLargeBoldFontStyleName];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)coder {
    self = [super initWithCoder:coder];
    if (self) {
        self.font = [UIFont dptThemeFontForStyle:kDPTExtraLargeBoldFontStyleName];
    }
    return self;
}

@end

@implementation DPTXLLabel

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.font = [UIFont dptThemeFontForStyle:kDPTExtraLargeFontStyleName];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)coder {
    self = [super initWithCoder:coder];
    if (self) {
        self.font = [UIFont dptThemeFontForStyle:kDPTExtraLargeFontStyleName];
    }
    return self;
}

@end

@implementation DPTXLLightLabel

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.font = [UIFont dptThemeFontForStyle:kDPTExtraLargeLightFontStyleName];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)coder {
    self = [super initWithCoder:coder];
    if (self) {
        self.font = [UIFont dptThemeFontForStyle:kDPTExtraLargeLightFontStyleName];
    }
    return self;
}

@end

@implementation DPTXXLLabel

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.font = [UIFont dptThemeFontForStyle:kDPTExtraExtraLargeFontStyleName];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)coder {
    self = [super initWithCoder:coder];
    if (self) {
        self.font = [UIFont dptThemeFontForStyle:kDPTExtraExtraLargeFontStyleName];
    }
    return self;
}

@end

@implementation DPTXXLLightLabel

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.font = [UIFont dptThemeFontForStyle:kDPTExtraExtraLargeLightFontStyleName];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)coder {
    self = [super initWithCoder:coder];
    if (self) {
        self.font = [UIFont dptThemeFontForStyle:kDPTExtraExtraLargeLightFontStyleName];
    }
    return self;
}

@end

@implementation DPTXXLBoldLabel

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.font = [UIFont dptThemeFontForStyle:kDPTExtraExtraLargeBoldFontStyleName];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)coder {
    self = [super initWithCoder:coder];
    if (self) {
        self.font = [UIFont dptThemeFontForStyle:kDPTExtraExtraLargeBoldFontStyleName];
    }
    return self;
}

@end

@implementation DPTTitleLabel

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.font = [UIFont dptThemeFontForStyle:kDPTTitleFontStyleName];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)coder {
    self = [super initWithCoder:coder];
    if (self) {
        self.font = [UIFont dptThemeFontForStyle:kDPTTitleFontStyleName];
    }
    return self;
}

@end
