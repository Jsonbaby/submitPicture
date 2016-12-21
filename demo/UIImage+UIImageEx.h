//
//  UIImage+UIImageEx.h
//  BasicCityBao
//
//  Created by csning－pc on 16/2/23.
//  Copyright © 2016年 enjoyor. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (UIImageEx)
+ (UIImage *) imageFromColor:(UIColor *)color;
+ (UIImage *) getImageFromView:(UIView *)theView;

+ (UIImage *) imageNamed:(NSString *)name FromCustomBundleWithName:(NSString *)bundleName;
@end
