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

@interface ExtraSmallLightLabel : UILabel

@end

@interface ExtraSmallLabel : UILabel

@end

@interface ExtraSmallBoldLabel : UILabel

@end

@interface SmallLightLabel : UILabel

@end

@interface SmallLabel : UILabel

@end

@interface SmallBoldLabel : UILabel

@end

@interface MediumLightLabel : UILabel

@end

@interface MediumLabel : UILabel

@end

@interface MediumBoldLabel : UILabel

@end

@interface LargeLabel : UILabel

@end

@interface LargeLightLabel : UILabel

@end

@interface LargeBoldLabel : UILabel

@end

@interface XLLabel : UILabel

@end

@interface XLLightLabel : UILabel

@end

@interface XLBoldLabel : UILabel

@end

@interface XXLLabel : UILabel

@end

@interface XXLLightLabel : UILabel

@end

@interface XXLBoldLabel : UILabel

@end

@interface TitleLabel : UILabel

@end
