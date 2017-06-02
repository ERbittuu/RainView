# RainView

[![CI Status](http://img.shields.io/travis/erbittuu/RainView.svg?style=flat)](https://travis-ci.org/erbittuu/RainView)
[![Version](https://img.shields.io/cocoapods/v/RainView.svg?style=flat)](http://cocoapods.org/pods/RainView)
[![License](https://img.shields.io/cocoapods/l/RainView.svg?style=flat)](http://cocoapods.org/pods/RainView)
[![Platform](https://img.shields.io/cocoapods/p/RainView.svg?style=flat)](http://cocoapods.org/pods/RainView)

![RainViewLogo](https://github.com/ERbittuu/RainView/blob/master/Resource/RainView_logo.png)

## Demo

![](https://github.com/ERbittuu/RainView/blob/master/Resource/RainView.gif)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

## Installation

### 1. CocoaPods

UIRainView is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "RainView"
```

### 2. Manual

Add `RainView.swift` file into your project.

## Usage

### 1. Import RainView in any class you want to use it.

```swift
    import RainView
```


### 2.1. Add direcly into the code.

```swift
import UIKit
import RainView


    var rainPlace = RainView.init(view: self.view)
    
    // Start normal Rain
    rainPlace.startRain()
    
    // Start heavy Rain
    rainPlace.startHeavyRain()
    
    // Start drizzle
    rainPlace.startDrizzle()
```
sometime if you want to **Pause** or **Restart** raining then following,

```swift
    //Stop rain
    rainPlace.stopRain()
    
    //restart rain 
    rainPlace.startRain()
```
If youwat to check **Raining status** then use,

```swift
    //Raining status 
     let alreadyRaining =  rainPlace.isRaining
```

## Screenshots
![alt Home](https://github.com/ERbittuu/RainView/blob/master/Resource/Home.PNG)
![alt HeavyRain](https://github.com/ERbittuu/RainView/blob/master/Resource/HeavyRain.PNG)
![alt Rain](https://github.com/ERbittuu/RainView/blob/master/Resource/Rain.PNG)
![alt Drizzle](https://github.com/ERbittuu/RainView/blob/master/Resource/Drizzle.PNG)

## Contribution

Feel free to raise issue and pull requests accepted to imrove this library.

## Author

erbittuu , erbittuu@gmail.com

## License

RainView is available under the MIT license. See the LICENSE file for more info.
