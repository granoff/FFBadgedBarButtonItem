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

Add `FFBadgedBarButtonItem.{h,m}` to your project, and include the `.h` file where you need it.

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

## License

See the LICENSE file for details.
