# FFBadgedBarButtonItem

[![Build Status](https://travis-ci.org/granoff/FFBadgedBarButtonItem.png)](https://travis-ci.org/granoff/FFBadgedBarButtonItem)

`FFBadgedBarButtonItem` is a `UIBarButtonItem` subclass that allows you to
create a button with a custom image that supports badging _for the
Navigation Bar_.

## Overview

Icon badges and tab badges are used commonly to convey information to the
user that there is something that needs their attention. A bit
surprisingly, there is no support for badging `UIBarButtonItem`'s,
however. Enter `FFBadgedBarButtonItem`.

Utilizing the `UIBarButtonItem`'s `customView` attribute, `FFBadgedBarButtonItem`
allows you to create a button with a custom image that supports badging.

## Usage

Using `FFBadgedBarButtonItem` is easy:

Create the button:

```
UIImage *image = /* ... */
self.navigationItem.leftBarButtonItem = [[FFBadgedBarButtonItem alloc] initWithImage:image target:self action:@selector(doSomething:)];
```

Update the badge:

```
FFBadgedBarButtonItem *button = (FFBadgedBarButtonItem *)self.navigationItem.leftBarButtonItem;
button.badge = @"3";
```

## Limitations

To use this class you will need to add the `Security` framework to your project.

This class was written for use under Cocoa Touch and iOS. The code and tests run fine in the iOS simulator under Mac OS. But there are some issues using this class under Cocoa and Mac OS. There are some keychain API differences between the 2 platforms, as it happens. Feel free to fork this repo to make it work for both Cocoa and Cocoa Touch and I'll be happy to consider your pull request!

## License

See the LICENSE file for details.
