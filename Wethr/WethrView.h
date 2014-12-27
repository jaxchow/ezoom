//
//  ForecastView.h
//  Forecast
//
//  Created by Mike on 10/1/14.
//  Copyright (c) 2014 Mike Amaral. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

enum TempType: NSUInteger {
    TempTypeFahrenheit = 0,
    TempTypeCelcius
};

@interface WethrView : UIView <CLLocationManagerDelegate>;

@property (nonatomic, strong) UILabel *cityLabel;
@property (nonatomic, strong) UILabel *conditionsLabel;
@property (nonatomic, strong) UILabel *tempLabel;

@property (nonatomic) enum TempType tempType;

@property (nonatomic) BOOL canChangeTempType;
@property (nonatomic) BOOL showsTempType;
@property (nonatomic) BOOL showsActivityIndicator;

@end

// 版权属于原作者
// http://code4app.com (cn) http://code4app.net (en)
// 发布代码于最专业的源码分享网站: Code4App.com 
