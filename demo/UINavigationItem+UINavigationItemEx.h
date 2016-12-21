//
//  UINavigationItem+UINavigationItemEx.h
//  CityBao
//
//  Created by ios team on 15/5/19.
//  Copyright (c) 2015年 wangpj. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UINavigationItem (UINavigationItemEx)

+(void)setHomeBackButtonOn:(UIViewController*)vc target:(id)theTarget callbackSelector:(SEL)sel;
+ (void)setBackButtonOn:(UIViewController*)vc target:(id)theTarget callbackSelector:(SEL)sel;
//+ (void)setBackButton:(UIViewController*)vc target:(id)theTarget callbackSelector:(SEL)sel;
+ (void)setBackButtonOn:(UIViewController*)vc target:(id)theTarget callbackSelector:(SEL)sel title:(NSString *)title;


+ (void)setLeftButtonOn:(UIViewController*)vc target:(id)theTarget callbackSelector:(SEL)sel image:(UIImage *)image;
+ (void)setLeftButtonOn:(UIViewController*)vc target:(id)theTarget callbackSelector:(SEL)sel image:(UIImage *)image highImage:(UIImage *)highImage;

+ (void)setRightButtonOn:(UIViewController*)vc target:(id)theTarget callbackSelector:(SEL)sel image:(UIImage *)image;

+ (void)setRightButtonOnTransform:(UIViewController*)vc target:(id)theTarget callbackSelector:(SEL)sel image:(UIImage *)image;

+ (void)setRightButtonOn:(UIViewController*)vc target:(id)theTarget callbackSelector:(SEL)sel title:(NSString *)title;


+ (void)setRightButtonOn:(UIViewController*)vc target:(id)theTarget callbackSelector:(SEL)sel image:(UIImage *)image title:(NSString*)title;

+ (void)setRightButtonOn:(UIViewController*)vc target:(id)theTarget callbackSelector:(SEL)sel
                   image:(UIImage *)image highImage:(UIImage *)highImage;
+ (void)setRightButtonOn:(UIViewController*)vc target:(id)theTarget callbackSelector:(SEL)sel
                   image:(UIImage *)image highImage:(UIImage *)highImage Title:(NSString *)title;

+ (void)setBackButtonNil:(UIViewController*)vc;

- (void)setTitle:(NSString *)title;

+ (void)setBackButtonsOn:(UIViewController*)vc target:(id)theTarget callbackSelector:(SEL)sel closeSelector:(SEL)sel2;


/**
 *  设置右侧的barButton (平安校车专用)
 *
 *  @param vc        控制器
 *  @param theTarget 目标对象
 *  @param sel       方法对象
 *  @param title     设置的title
 */
+ (void)setPureRightButtonOn:(UIViewController*)vc target:(id)theTarget callbackSelector:(SEL)sel title:(NSString *)title;
@end
