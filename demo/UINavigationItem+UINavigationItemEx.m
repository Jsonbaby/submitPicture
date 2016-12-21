//
//  UINavigationItem+UINavigationItemEx.m
//  CityBao
//
//  Created by ios team on 15/5/19.
//  Copyright (c) 2015年 wangpj. All rights reserved.
//

#import "UINavigationItem+UINavigationItemEx.h"
#import "Constans.h"
#import "UIImage+UIImageEx.h"

@implementation UINavigationItem (UINavigationItemEx)


// 设置返回主页的按钮
+ (void)setHomeBackButtonOn:(UIViewController*)vc target:(id)theTarget callbackSelector:(SEL)sel
{
    UIImage* image = [UIImage imageNamed:@"menu.png"];
    UIImage* imageC = [UIImage imageNamed:@"menu_clicked.png"];
    UIButton* btn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, image.size.width+10, 40)];
    btn.showsTouchWhenHighlighted = YES;
    [btn setImage:image forState:UIControlStateNormal];
    [btn setImage:imageC forState:UIControlStateHighlighted];
    [btn addTarget:theTarget action:sel forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *backBtn = [[UIBarButtonItem alloc] initWithCustomView:btn];
    backBtn.tag = 9527;

    vc.navigationItem.leftBarButtonItem = backBtn;
}


// 设置返回按钮--------++++++=
+ (void)setBackButtonOn:(UIViewController*)vc target:(id)theTarget callbackSelector:(SEL)sel
{
    
    UIImage *image = [UIImage imageNamed:@"back"];
    //UIImage *highImage = [UIImage imageNamed:@"back"];
    
    UIButton* btn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 25, 25)];
    //btn.showsTouchWhenHighlighted = YES;
    [btn setImage:image forState:UIControlStateNormal];
    //[btn setImage:highImage forState:UIControlStateHighlighted];
    [btn addTarget:theTarget action:sel forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *backBtn = [[UIBarButtonItem alloc] initWithCustomView:btn];
    backBtn.tag = 9526;
    
    vc.navigationItem.leftBarButtonItem = backBtn;
}
+ (void)setBackButtonsOn:(UIViewController*)vc target:(id)theTarget callbackSelector:(SEL)sel closeSelector:(SEL)sel2
{
    
    UIImage *image = [UIImage imageNamed:@"back"];
    
    UIButton* btn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 25, 25)];
    //btn.showsTouchWhenHighlighted = YES;
    [btn setImage:image forState:UIControlStateNormal];
    [btn addTarget:theTarget action:sel forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *backBtn = [[UIBarButtonItem alloc] initWithCustomView:btn];
    backBtn.tag = 9527;
    
    
    UIButton* btn2 = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 25, 25)];
    btn2.showsTouchWhenHighlighted = YES;
    [btn2 setTitle:@"关闭" forState:UIControlStateNormal];
    [btn2 setTitleColor:UIFontColorWhiteText forState:UIControlStateNormal];
    btn2.titleLabel.font = UIFontNormalText;
    btn2.titleLabel.textAlignment = NSTextAlignmentRight;
    [btn2 addTarget:theTarget action:sel2 forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *backBtn2 = [[UIBarButtonItem alloc] initWithCustomView:btn2];
    vc.navigationItem.leftBarButtonItems = [NSArray arrayWithObjects:backBtn,backBtn2, nil];
    
   // vc.navigationItem.leftBarButtonItem = backBtn;
}
+ (void)setBackButtonOn:(UIViewController*)vc target:(id)theTarget callbackSelector:(SEL)sel title:(NSString *)title
{
    UIButton* btn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 60, 40)];
    btn.showsTouchWhenHighlighted = YES;
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setTitleColor:UIFontColorWhiteText forState:UIControlStateNormal];
    btn.titleLabel.font = UIFontNormalText;
    btn.titleLabel.textAlignment = NSTextAlignmentRight;
    [btn addTarget:theTarget action:sel forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *backBtn = [[UIBarButtonItem alloc] initWithCustomView:btn];
    backBtn.tag = 9529;
    vc.navigationItem.leftBarButtonItem = backBtn;
}




 //设置返回按钮
+ (void)setBackButton:(UIViewController*)vc target:(id)theTarget callbackSelector:(SEL)sel
{
    
    UIImage *image = [UIImage imageNamed:@"ic_back"];
    UIImage *highImage = [UIImage imageNamed:@"ic_back_high"];
    
    UIButton* btn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, image.size.width+10, 40)];
    btn.showsTouchWhenHighlighted = YES;
    [btn setImage:image forState:UIControlStateNormal];
    [btn setImage:highImage forState:UIControlStateHighlighted];
    [btn addTarget:theTarget action:sel forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *backBtn = [[UIBarButtonItem alloc] initWithCustomView:btn];
    backBtn.tag = 9527;
    
    vc.navigationItem.backBarButtonItem = backBtn;
}


// 设置无返回按钮
+ (void)setBackButtonNil:(UIViewController*)vc
{
    vc.navigationItem.leftBarButtonItem = nil;
}







+ (void)setLeftButtonOn:(UIViewController*)vc target:(id)theTarget callbackSelector:(SEL)sel image:(UIImage *)image highImage:(UIImage *)highImage
{
    UIButton* btn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, image.size.width+10, 40)];
    btn.showsTouchWhenHighlighted = YES;
    [btn setImage:image forState:UIControlStateNormal];
    [btn setImage:highImage forState:UIControlStateHighlighted];
    [btn addTarget:theTarget action:sel forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *backBtn = [[UIBarButtonItem alloc] initWithCustomView:btn];
    backBtn.tag = 9528;
    
    vc.navigationItem.leftBarButtonItem = backBtn;
}





// 设置右侧的按钮------------------+++++--------
+ (void)setRightButtonOn:(UIViewController*)vc target:(id)theTarget callbackSelector:(SEL)sel image:(UIImage *)image
{
    UIButton* btn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 25, 25)];
    //btn.showsTouchWhenHighlighted = YES;
    [btn setImage:image forState:UIControlStateNormal];
    btn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    [btn addTarget:theTarget action:sel forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *backBtn = [[UIBarButtonItem alloc] initWithCustomView:btn];
    backBtn.tag = 9529;
    vc.navigationItem.rightBarButtonItem = backBtn;
}


+ (void)setRightButtonOnTransform:(UIViewController*)vc target:(id)theTarget callbackSelector:(SEL)sel image:(UIImage *)image
{
    UIButton* btn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, image.size.width, image.size.height)];
    btn.showsTouchWhenHighlighted = YES;
    [btn setImage:image forState:UIControlStateNormal];
    [btn addTarget:theTarget action:sel forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *backBtn = [[UIBarButtonItem alloc] initWithCustomView:btn];
    backBtn.tag = 9529;
    vc.navigationItem.rightBarButtonItem = backBtn;
    
    
    [UIView animateWithDuration:0.2 animations:^{
        CGAffineTransform rotate = CGAffineTransformMakeRotation(M_PI*2);
        btn.transform = rotate;
    } completion:^(BOOL finished) {
        
    }];
}

//设置右侧的barButton (按钮格式)
+ (void)setRightButtonOn:(UIViewController*)vc target:(id)theTarget callbackSelector:(SEL)sel title:(NSString *)title
{
    UIButton* btn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 45, 25)];
   // btn.showsTouchWhenHighlighted = YES;
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setTitleColor:PURE_WHITE_COLOR forState:UIControlStateNormal];
    btn.titleLabel.font = UIFontRightText;
    btn.titleLabel.textAlignment = NSTextAlignmentCenter;
    btn.layer.cornerRadius = 2;
    btn.layer.masksToBounds = YES;
    //btn.backgroundColor = BASIC_GREEN_COLOR;
    [btn setBackgroundImage:[UIImage imageFromColor:BASIC_GREEN_COLOR] forState:UIControlStateNormal];
    [btn setBackgroundImage:[UIImage imageFromColor:BASIC_GREEN_COLOR_HIGHT] forState:UIControlStateHighlighted];
    //btn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    [btn addTarget:theTarget action:sel forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *backBtn = [[UIBarButtonItem alloc] initWithCustomView:btn];
    backBtn.tag = 9529;
    
    vc.navigationItem.rightBarButtonItem = backBtn;
}


/**
 *  设置右侧的barButton (纯文字)
 *
 *  @param vc        控制器
 *  @param theTarget 目标对象
 *  @param sel       方法对象
 *  @param title     设置的title
 */
+ (void)setPureRightButtonOn:(UIViewController*)vc target:(id)theTarget callbackSelector:(SEL)sel title:(NSString *)title
{
    UIButton* btn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 80, 40)];
    //btn.showsTouchWhenHighlighted = YES;
    btn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setTitleColor:UIFontColorWhiteText forState:UIControlStateNormal];
    [btn setTitleColor:UIFontColorLightGrayText forState:UIControlStateHighlighted];

    btn.titleLabel.font = UIFontRightText;
    btn.titleLabel.textAlignment = NSTextAlignmentRight;
    [btn addTarget:theTarget action:sel forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *backBtn = [[UIBarButtonItem alloc] initWithCustomView:btn];
    backBtn.tag = 9529;
    
    vc.navigationItem.rightBarButtonItem = backBtn;
}

// 设置右侧的按钮
+ (void)setRightButtonOn:(UIViewController*)vc target:(id)theTarget callbackSelector:(SEL)sel
                  image:(UIImage *)image highImage:(UIImage *)highImage
{
    UIButton* btn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, image.size.width+10, 40)];
    btn.showsTouchWhenHighlighted = YES;
    btn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    [btn setImage:image forState:UIControlStateNormal];
    [btn setImage:highImage forState:UIControlStateHighlighted];
    [btn addTarget:theTarget action:sel forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *backBtn = [[UIBarButtonItem alloc] initWithCustomView:btn];
    backBtn.tag = 9529;
    
    vc.navigationItem.rightBarButtonItem = backBtn;
    
}

+(void)setRightButtonOn:(UIViewController*)vc target:(id)theTarget callbackSelector:(SEL)sel image:(UIImage *)image title:(NSString*)title
{
    CGRect labelRect = [title boundingRectWithSize:CGSizeMake(999, 999) options:(NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading)  attributes:[NSDictionary dictionaryWithObject:UIFontRightText forKey:NSFontAttributeName] context:nil];
    UIButton* btn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, labelRect.size.width + image.size.width + 20, 40)];
    btn.showsTouchWhenHighlighted = YES;
    [btn setImage:image forState:UIControlStateNormal];
    [btn setTitle:title forState:UIControlStateNormal];
    btn.titleLabel.font = UIFontRightText;
    btn.titleLabel.textColor = UIFontColorWhiteText;
    btn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    [btn setTitleColor:UIFontColorWhiteText forState:UIControlStateNormal];
    btn.titleLabel.textAlignment = NSTextAlignmentLeft;
    [btn setImageEdgeInsets:UIEdgeInsetsMake(0, labelRect.size.width + image.size.width , 0, -(labelRect.size.width + image.size.width ))];

    [btn addTarget:theTarget action:sel forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *backBtn = [[UIBarButtonItem alloc] initWithCustomView:btn];
    
    backBtn.tag = 9529;
    
    vc.navigationItem.rightBarButtonItem = backBtn;

}


+ (void)setRightButtonOn:(UIViewController*)vc target:(id)theTarget callbackSelector:(SEL)sel
                   image:(UIImage *)image highImage:(UIImage *)highImage Title:(NSString *)title
{
    UIButton* btn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, image.size.width+10, 40)];
    btn.showsTouchWhenHighlighted = YES;
//    btn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
    
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setTitle:title forState:UIControlStateHighlighted];
    btn.titleLabel.font = UIFontRightText;
    btn.titleLabel.textColor = UIFontColorWhiteText;
//    btn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    [btn setTitleColor:UIFontColorWhiteText forState:UIControlStateNormal];
    [btn setTitleColor:UIFontColorWhiteText forState:UIControlStateHighlighted];
    btn.titleLabel.textAlignment = NSTextAlignmentLeft;
    
//    [btn setImage:image forState:UIControlStateNormal];
//    [btn setImage:highImage forState:UIControlStateHighlighted];
    [btn setBackgroundImage:image forState:UIControlStateNormal];
    [btn setBackgroundImage:highImage forState:UIControlStateHighlighted];
    [btn addTarget:theTarget action:sel forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *backBtn = [[UIBarButtonItem alloc] initWithCustomView:btn];
    backBtn.tag = 9529;
    
    vc.navigationItem.rightBarButtonItem = backBtn;
    
}

- (void)setTitle:(NSString *)title
{
    UIFont* font = [UIFont boldSystemFontOfSize:18.0f];
    CGSize textSize = [title sizeWithFont:font];
    UILabel* label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, textSize.width, textSize.height)];
    label.adjustsFontSizeToFitWidth = YES;
    label.minimumScaleFactor = 10.f;
    
    label.backgroundColor = [UIColor clearColor];
    label.font = font;

    label.textAlignment = NSTextAlignmentCenter;
    label.textColor = PURE_WHITE_COLOR;
    label.text = title;
    self.titleView = label;
}


@end
