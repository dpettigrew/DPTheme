//
//  UIAppearanceContainerViews.h
//  DPTheming
//
//  Created by David Pettigrew on 6/10/13.
//  Copyright (c) 2013 David Pettigrew All rights reserved.
//

#import <UIKit/UIKit.h>

// Use these classes to contain the scope of UIAppearance proxy objects when using the UIAppearance protocol appearanceWhenContainedIn: message
// i.e.     [[UILabel appearanceWhenContainedIn:[BackgroundView class], nil] setFont:[UIFont fontWithName:@"AvenirNext-Regular" size:20]];
// has the effect of limiting the appearance change to only BackgroundView classes not all UIViews. You would set this as the view's "Custom Class" in Interface Builder.

@interface DPTExtraSmallLightLabel : UILabel

@end

@interface DPTExtraSmallLabel : UILabel

@end

@interface DPTExtraSmallBoldLabel : UILabel

@end

@interface DPTSmallLightLabel : UILabel

@end

@interface DPTSmallLabel : UILabel

@end

@interface DPTSmallBoldLabel : UILabel

@end

@interface DPTMediumLightLabel : UILabel

@end

@interface DPTMediumLabel : UILabel

@end

@interface DPTMediumBoldLabel : UILabel

@end

@interface DPTLargeLabel : UILabel

@end

@interface DPTLargeLightLabel : UILabel

@end

@interface DPTLargeBoldLabel : UILabel

@end

@interface DPTXLLabel : UILabel

@end

@interface DPTXLLightLabel : UILabel

@end

@interface DPTXLBoldLabel : UILabel

@end

@interface DPTXXLLabel : UILabel

@end

@interface DPTXXLLightLabel : UILabel

@end

@interface DPTXXLBoldLabel : UILabel

@end

@interface DPTTitleLabel : UILabel

@end
