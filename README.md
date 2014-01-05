DPTheme
=======

Helps with theming colors and fonts. Sample code included. 

The code provides 

* a set of labels that have consistent fonts, font sizes and weights. 
* UIColor category that can be used throughout the app to apply a color scheme to an app (background color etc).
* UIFont category to get a set of fonts for the current theme.

It uses UIAppearance proxies and some UILabel subclasses. I need to improve the docs.

All the values are set in plist files which get parsed into DPTheme objects.

There are some similar and more powerful approaches out there that are more like CSS for iOS apps such as [NUI](https://github.com/tombenner/nui), but this is small and easy to use.


![Smaller icon](Screenshot.png "Screenshot showing various themed UILabels")


Example showing various themed UILabels.

A limitation is that the UILabel subclasses must be used in Interface Builder only. Using them programmatically doesn't work at the moment.

Setup
-----

Add a call to DPTThemeManager initializeThemeManagerWithTheme in the application delegate didFinishLaunchingWithOptions or similar place. e.g.

	- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
	{
	    // Override point for customization after application launch.
	    [DPTThemeManager initializeThemeManagerWithTheme:@"Theme1"];// initializes theme manager
	    return YES;
	}

This will load the theme define in the Theme1.plist file (from the app's main bundle) and steup the appearance proxy objects to use the fonts defined in the theme file for the various labels.

Use 

	- (DPTTheme *)getThemeNamed:(NSString *)themeName
	
and
	
	- (void)setCurrentTheme:(DPTTheme *)theme
	
to change the theme at any time. The kDPTThemeManagerSchemeChangedNotification will be posted when the theme changes. Your view controllers can listen for this.

Labels
------
The following UILabel subclasses are defined:-

	DPTExtraSmallLightLabel
	DPTExtraSmallLabel
	DPTExtraSmallBoldLabel
	DPTSmallLightLabel
	DPTSmallLabel
	DPTSmallBoldLabel
	DPTMediumLightLabel
	DPTMediumLabel
	DPTMediumBoldLabel
	DPTLargeLabel
	DPTLargeLightLabel
	DPTLargeBoldLabel
	DPTXLLabel
	DPTXLLightLabel
	DPTXLBoldLabel
	DPTXXLLabel
	DPTXXLLightLabel
	DPTXXLBoldLabel
	DPTTitleLabel

Set the Custom Class field in Interface Builder and size the label appropriately based upon your knowledge of the font that you are using in your theme.plist file.

Colors
---
In your code use the following UIColor category methods to color your views:- 

	@interface UIColor (ColorScheme)
	
	+ (UIColor *)dptBackgroundColor;
	+ (UIColor *)dptForegroundColor;
	+ (UIColor *)dptStrongTextColor;
	+ (UIColor *)dptMediumTextColor;
	+ (UIColor *)dptWeakTextColor;
	
	@end

Generally, you should theme(color) the views during the viewWillAppear method of your controller or when a custom view gets loaded.
