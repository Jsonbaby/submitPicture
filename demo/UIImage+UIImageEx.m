//
//  UIImage+UIImageEx.m
//  BasicCityBao
//
//  Created by csning－pc on 16/2/23.
//  Copyright © 2016年 enjoyor. All rights reserved.
//

#import "UIImage+UIImageEx.h"

@implementation UIImage (UIImageEx)

+ (UIImage *) imageFromColor:(UIColor *)color
{
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return theImage;
}

+ (UIImage *)getImageFromView:(UIView *)theView
{
    UIGraphicsBeginImageContext(theView.bounds.size);
    UIGraphicsBeginImageContextWithOptions(theView.bounds.size, YES, theView.layer.contentsScale);
    [theView.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

+ (UIImage *) imageNamed:(NSString *)name FromCustomBundleWithName:(NSString *)bundleName {
    NSString *bundlePath = [[NSBundle mainBundle].resourcePath stringByAppendingPathComponent:bundleName];
    NSString *imagepath = [bundlePath stringByAppendingPathComponent:name];
    
    return [UIImage imageWithContentsOfFile:imagepath];
}

@end
