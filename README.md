CCLRequestLogger
================

A simple view controller showing you all the network requests made from the app.

## Usage

Present the view controller from a debug menu or secret gesture.

```swift
let viewController = CCLRequestListViewController()
presentViewController(viewController, animated:true)
```

## Installation

```ruby
pod 'CCLRequestLogger', :git => 'https://github.com/kylef/CCLRequestLogger'
```

Or to install only to debug configurations

```ruby
pod 'CCLRequestLogger', :configurations => ['Debug'], :git => 'https://github.com/kylef/CCLRequestLogger'
```
