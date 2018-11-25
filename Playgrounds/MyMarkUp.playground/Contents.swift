/*:
 For more information, see [XCode Markup Reference]
 (https://developer.apple.com/library/archive/documentation/Xcode/Reference/xcode_markup_formatting_ref/index.html#//apple_ref/doc/uid/TP40016497-CH2-SW1)
 
*/

import UIKit
import MyReusableFramework


// Markup
// Multi-lines

/*:
 Roses are red
 
 Violets are blue
 
 Writing your markup
 
 Is so fun to do!
*/

var str = "Hello, playground"


// Markup
// Headings

//: # Roses Are Red
//: ## An ode to markup
//: ### By: Tibet Rooney-Rabdau

// Markup
// Formatting Characters
//: Roses are *red*
//:
//: Violets are *blue*
//:
//: Writing your `markup`
//:
//: Is so **fun** to do!


// Markup
// Numbered Lists
//: 1. Roses are red
//: 2. Violets are blue
//: 3. Writing your markup
//: 4. Is so fun to do!

// Markup
// Bulleted Lists
//: * Roses are red
//: * Violets are blue
//: * Writing your markup
//: * Is so fun to do!


// Markup
// Links
//: [Roses](https://en.wikipedia.org/wiki/Rose) are red
//:
//: [Violets](https://en.wikipedia.org/wiki/Viola_(plant)) are blue
//:
//: Writing your markup
//:
//: Is so [fun][1] to do!
//:
//: [1]: https://en.wikipedia.org/wiki/Fun

// Markup
// Navigating Between Pages
//: [Previous](@previous)
//:
//: [Next](@next)
//:
//: [Formatting Characters](Formatting%20Characters)


// Using Resources in Playgrounds

//: You can embed an image in markup:
//: ![alternate text](PeterXu.jpg "hover title")


//: You can use videos in markup:
//: ![alternate text](MyVideo.mp4 poster="MyPoster.jpg" width="integer width" height="integer height")


