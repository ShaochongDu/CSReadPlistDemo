//
//  UIColor+DXUtils.h
//  DXDesign
//
//  Created by caxa on 15-7-9.
//  Copyright (c) 2015年 mlf. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (DXUtils)

//  转换16进制颜色值 以“#”开头 如#696969
+ (UIColor *)colorWithHexString:(NSString *)stringToConvert;

//  转换16进制颜色值 以“0X”开头 如0X151515
+ (UIColor *)colorWithHexInteger:(NSInteger)rgbValue;

//  color转string
+ (NSString *)stringFromColor:(UIColor*)color;
//  随机色
+ (UIColor *)randomColor;

- (void)getRGBComponents:(CGFloat [3])components;


@end
