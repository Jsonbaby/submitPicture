//
//  SelectedPictureViewController.m
//  BasicCityBao
//
//  Created by csning－pc on 16/3/8.
//  Copyright © 2016年 enjoyor. All rights reserved.
//
#define PURE_WHITE_COLOR        UIColorFromIntRBG(255, 255, 255)
#define UIColorFromIntRBG(RED, GREEN, BLUE) [UIColor colorWithRed:RED/255.0 green:GREEN/255.0 blue:BLUE/255.0 alpha:1.0]
#define PURE_BLACK_COLOR        UIColorFromIntRBG(0, 0, 0)
#import "SelectedPictureViewController.h"
#import "MLSelectPhotoPickerBrowserPhotoScrollView.h"
#import "UIView+MLExtension.h"
#import "UIImage+UIImageEx.h"
#import "UINavigationItem+UINavigationItemEx.h"
@interface SelectedPictureViewController ()<ZLPhotoPickerPhotoScrollViewDelegate>

@property (nonatomic,copy)DeleteImageBlock deleteImageBlock;

@end

@implementation SelectedPictureViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.view.backgroundColor = PURE_BLACK_COLOR;

    // Do any additional setup after loading the view.
    [self initView];
}
- (void)initView {
    self.navigationItem.title = @"意见反馈";
    [UINavigationItem setBackButtonOn:self target:self callbackSelector:@selector(back)];
    
    [UINavigationItem setRightButtonOn:self target:self callbackSelector:@selector(deleteImage) title:@"删除"];
    
    UIView *scrollBoxView = [[UIView alloc] init];
    scrollBoxView.frame = self.view.bounds;
    scrollBoxView.ml_y = self.view.ml_y ;

    MLSelectPhotoPickerBrowserPhotoScrollView *scrollView =  [[MLSelectPhotoPickerBrowserPhotoScrollView alloc] init];
    
    scrollView.backgroundColor = [UIColor clearColor];
    // 为了监听单击photoView事件
    scrollView.frame = [UIScreen mainScreen].bounds;
    scrollView.photoScrollViewDelegate = self;
    scrollView.photo = self.asset;
    scrollView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    [scrollBoxView addSubview:scrollView];
    [self.view addSubview:scrollBoxView];

}




- (void)returnControl:(DeleteImageBlock)returnControl {
    self.deleteImageBlock = returnControl;
}

- (void)back {
    [self.navigationController popViewControllerAnimated:YES];
    
}

- (void)deleteImage {
    if (self.deleteImageBlock) {
        self.deleteImageBlock(YES);
    }
    [self.navigationController popViewControllerAnimated:YES];
}


// 单击调用
//- (void) pickerPhotoScrollViewDidSingleClick:(MLSelectPhotoPickerBrowserPhotoScrollView *)photoScrollView{
//    self.navigationController.navigationBar.hidden = !self.navigationController.navigationBar.isHidden;
////    if (self.isEditing) {
////        self.toolBar.hidden = !self.toolBar.isHidden;
////    }
//}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
