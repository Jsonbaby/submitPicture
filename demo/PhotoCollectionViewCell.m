//
//  PhotoCollectionViewCell.m
//  BasicCityBao
//
//  Created by csning－pc on 16/3/4.
//  Copyright © 2016年 enjoyor. All rights reserved.
//

#import "PhotoCollectionViewCell.h"

@implementation PhotoCollectionViewCell

- (UIImageView *)photoView {
    if (!_photoView) {
        _photoView = [[UIImageView alloc]initWithFrame:self.bounds];
    }
    return _photoView;
}
/**
 *  创建自定义cell的时候调用该方法
 */
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self.contentView addSubview:self.photoView];
    }
    return self;
}
@end
