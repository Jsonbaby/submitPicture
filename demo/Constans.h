//
//  Constans.h
//  CityBao
//
//  Created by ios team on 16/1/1.
//  Copyright (c) 2016年 csning. All rights reserved.
//

//输出相关信息
#ifndef __OPTIMIZE__
#define BXLog(x, ...) NSLog(@"%s   %d行: " x, __FUNCTION__, __LINE__, ##__VA_ARGS__)
#else
#define BXLog(...) /* */
#endif


//断言宏
#ifdef __OPTIMIZE__
#define	BXAssert(x) if(!(x)) {int a=1;int b=0;int c=a/b;c++;}
#else
#define	BXAssert(x) if(!(x)) {}
#endif


// 对字符串做特殊的宏，即保证返回的值不为空
#define ISNIL(x) ((x) == nil ? @"" : (x))
#define ISNILDefault(x, y) ((x) == nil ? y : (x))
#define ISNULL(x) ((x) == nil || [(x) isEqualToString:@"NULL"] || [(x) isEqualToString:@"null"] ? @"" : (x))

// 语言本地化
#define BXLocalizedString(x) NSLocalizedStringFromTable((x),@"LocationString",nil)



// 设备
#define iOS7_Version [[[UIDevice currentDevice]systemVersion]floatValue] >= 7.0

#define IS_IPHONE_5 ( fabs( ( double )[ [ UIScreen mainScreen ] bounds ].size.height - ( double )568 ) < DBL_EPSILON )
#define IS_IPHONE_4 ( fabs( ( double )[ [ UIScreen mainScreen ] bounds ].size.height - ( double )480 ) < DBL_EPSILON )
//颜色设置

#define UIColorFromIntRBG(RED, GREEN, BLUE) [UIColor colorWithRed:RED/255.0 green:GREEN/255.0 blue:BLUE/255.0 alpha:1.0]

#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

#define RGBACOLOR(r,g,b,a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)]


//主色
#define BASIC_BLACK_COLOR     UIColorFromIntRBG(38, 53, 58)
#define BASIC_GREEN_COLOR     UIColorFromIntRBG(0, 131, 143)
#define BASIC_GRAY_COLOR      UIColorFromIntRBG(222, 223, 224)
#define BASIC_RED_COLOR       UIColorFromIntRBG(221, 72, 92)
//点击色
#define BASIC_GREEN_COLOR_HIGHT  UIColorFromRGB(0x66b5bc)
#define BASIC_RED_COLOR_HIGHT    UIColorFromRGB(0xeb919d)

#define CLICK_GREEN_COLOR     UIColorFromIntRBG(102, 181, 188)
#define CLICK_RED_COLOR       UIColorFromIntRBG(235, 145, 157)
#define NORMAL_TXT_COLOR      UIColorFromIntRBG(85, 86, 83)
//secondary
//UIColorFromRGB(0xf0f0ee)

#define NORMAL_BACK_COLOR       UIColorFromRGB(0xf0f0ee)
#define SECONDARY_TXT_COLOR     UIColorFromIntRBG(153, 154, 152)
#define BACKVIEW_COLOR          UIColorFromIntRBG(223, 228, 227)
#define PURE_WHITE_COLOR        UIColorFromIntRBG(255, 255, 255)
#define PURE_BLACK_COLOR        UIColorFromIntRBG(0, 0, 0)
#define UIClearColor   [UIColor clearColor]

//圈子人名颜色
#define NORMAL_INTERACT_COLOR       UIColorFromRGB(0x89C9F2)
//评论人名颜色
#define NORMAL_COMMENT_COLOR      UIColorFromRGB(0xff9f57)
//0x89C9F2   0xff9f57

//最美大理-奖
#define ELEC_LEVEL_COLOR      UIColorFromRGB(0xdd485b)
#define ELEC_AWRDING_COLOR    UIColorFromRGB(0xdd485c)

//屏幕尺寸相关
#define ScreenBounds [UIScreen mainScreen].bounds
#define ScreenWidth ScreenBounds.size.width
#define ScreenHeight ScreenBounds.size.height
#define ScreenRate ScreenWidth/320.0
#define ScreenRateHeight  ScreenHeight/960.0
#define ViewHeight CGRectGetHeight(ScreenBounds) - 44 - 20
//#define UIFirstWindow ((UIWindow*)[[[UIApplication sharedApplication] windows] objectAtIndex:0])
//#define KNOTIFICATION_LOGINCHANGE @"loginStateChange"
//
//#ifdef DEBUG
//
//#else
//
//#endif
#define PAGECOUNT 20
// 系统控件默认高度
#define kStatusBarHeight        (20.f)
#define kTopBarHeight           (44.f)
#define kBottomBarHeight        (49.f)

#define kCellDefaultHeight      (44.f)

#define kEnglishKeyboardHeight  (216.f)
#define kChineseKeyboardHeight  (252.f)
//
#define WEAKSELF typeof(self) __weak weakSelf = self;
#define STRONGSELF typeof(weakSelf) __strong strongSelf = weakSelf;


//字体大小及颜色
#define UIFontNavCenterTitle [UIFont boldSystemFontOfSize:18]
#define UIFontNavRightTitle  [UIFont systemFontOfSize:16]
#define UIFontNormalText     [UIFont systemFontOfSize:16]       //默认字体大小
#define UIFontRightText      [UIFont systemFontOfSize:14]        //内容字体大小
#define UIFontFlagText       [UIFont systemFontOfSize:13]
#define UIFontIconText       [UIFont systemFontOfSize:12]        //内容字体大小
#define UIFontOfConfirmBtn   [UIFont systemFontOfSize:16]

#define UIFontColorBlackText     UIColorFromRGB(0x494949)       //字体默认色 偏黑
#define UIFontColorLightGrayText UIColorFromRGB(0x999999)       //字体默认色 浅灰
#define UIFontColorWhiteText     UIColorFromRGB(0xffffff)       //字体默认色 白色
#define UIFontColorGreenText     UIColorFromRGB(0x47cabb)       //字体默认色 主色（绿的）
//(f0f0ee)
#define UIFontColorLightBackGroundView  UIColorFromRGB(0xf0f0ee) //最浅色背景！！！
#define HOMEPAGEBACKVIEW  UIColorFromIntRBG(250,250,250)

#define BOLDSYSTEMFONT(FONTSIZE)[UIFont boldSystemFontOfSize:FONTSIZE]
#define SYSTEMFONT(FONTSIZE)    [UIFont systemFontOfSize:FONTSIZE]
#define FONT(NAME, FONTSIZE)    [UIFont fontWithName:(NAME) size:(FONTSIZE)]


//** 沙盒路径 ***********************************************************************************
#define PATH_OF_APP_HOME    NSHomeDirectory()
#define PATH_OF_TEMP        NSTemporaryDirectory()
#define PATH_OF_DOCUMENT    [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0]stringByAppendingPathComponent:@"iconImage.png"]









