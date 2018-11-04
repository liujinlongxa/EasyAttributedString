# EasyAttributedString

[![CI Status](https://img.shields.io/travis/liujinlongxa/EasyAttributedString.svg?style=flat)](https://travis-ci.org/liujinlongxa/EasyAttributedString)
[![Version](https://img.shields.io/cocoapods/v/EasyAttributedString.svg?style=flat)](https://cocoapods.org/pods/EasyAttributedString)
[![License](https://img.shields.io/cocoapods/l/EasyAttributedString.svg?style=flat)](https://cocoapods.org/pods/EasyAttributedString)
[![Platform](https://img.shields.io/cocoapods/p/EasyAttributedString.svg?style=flat)](https://cocoapods.org/pods/EasyAttributedString)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

How to use: 

```swift
let text = """
We have not one, not two, but three exciting new books for you this season: Machine Learning by Tutorials, Push Notifications by Tutorials, and Advanced iOS App Architecture! We think you’ll really enjoy what we have planned for these books. Read on below to see what’s in store for you!
We have not one, not two, but three exciting new books for you this season: Machine Learning by Tutorials, Push Notifications by Tutorials, and Advanced iOS App Architecture! We think you’ll really enjoy what we have planned for these books. Read on below to see what’s in store for you!
"""
label.attributedText = text.eas
    .font(UIFont.systemFont(ofSize: 18))
    .foregroundColor(UIColor.red)
    .backgroundColor(UIColor.green)
    .ligature(0)
    .kern(2)
    .lineSpacing(5, range: NSRange(location: 0, length: 20))
    .paragraphSpacing(10)
    .alignment(.center)
    .headIndent(10, range: NSRange(location: 0, length: 10))
    .attributedString
```

## Requirements

## Installation

EasyAttributedString is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'JLEasyAttributedString'
```

## Author

liujinlongxa, liujinlongxa@gmail.com

## License

EasyAttributedString is available under the MIT license. See the LICENSE file for more info.
