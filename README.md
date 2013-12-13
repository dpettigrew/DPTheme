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

