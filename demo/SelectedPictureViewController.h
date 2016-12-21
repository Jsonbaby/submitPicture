//
//  SelectedPictureViewController.h
//  BasicCityBao
//
//  Created by csning－pc on 16/3/8.
//  Copyright © 2016年 enjoyor. All rights reserved.
//


#import "MLSelectPhotoAssets.h"

typedef void (^DeleteImageBlock)(BOOL deleteImage);

@interface SelectedPictureViewController : UIViewController

- (void)returnControl:(DeleteImageBlock)returnControl;

//@property (nonatomic,strong)UIImage *image;

@property (nonatomic,strong)MLSelectPhotoAssets *asset;

@end
