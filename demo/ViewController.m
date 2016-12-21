//
//  ViewController.m
//  demo
//
//  Created by 张璠 on 16/12/20.
//  Copyright © 2016年 张璠. All rights reserved.
//

#import "ViewController.h"
#import "PhotoCollectionViewCell.h"
#import "SelectedPictureViewController.h"

#import "MLSelectPhotoPickerViewController.h"
#import "MLSelectPhotoAssets.h"
#import "MLSelectPhotoBrowserViewController.h"

#import "LCActionSheet.h"
#define Screen_Width                 ([UIScreen mainScreen].bounds.size.width)
#define Screen_Height                ([UIScreen mainScreen].bounds.size.height)


@interface ViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,UIImagePickerControllerDelegate,UINavigationControllerDelegate,ZLPhotoPickerViewControllerDelegate>
// 上传图片相关
@property (nonatomic, weak) UIView *pictureView;
//--上传图片的个数
@property (nonatomic, copy) NSMutableArray *photoArrayM;

//@property(nonatomic,strong)UIView *aView;
//上传触发button
@property (nonatomic,strong)UIButton *photoBtn;

@property (nonatomic,strong) UICollectionView *collectionView;
/**
 *  图片地址数组
 */
@property (nonatomic, copy) NSMutableArray *picAdd;

@end

@implementation ViewController
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
   
    [self resetButtonFrame];
    
}
- (NSMutableArray *)picAdd {
    if (!_picAdd) {
        _picAdd = [NSMutableArray arrayWithCapacity:3];
    }
    return _picAdd;
}

- (NSMutableArray *)photoArrayM {
    if (!_photoArrayM) {
        _photoArrayM = [NSMutableArray arrayWithCapacity:0];
    }
    return _photoArrayM;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    //创建一种布局
    
    UICollectionViewFlowLayout *flowL = [[UICollectionViewFlowLayout alloc]init];
    //设置每一个item的大小
    flowL.itemSize = CGSizeMake((Screen_Width - 15-20-20) / 3 , (Screen_Width - 15-20-20) /3 );
    flowL.sectionInset = UIEdgeInsetsMake(3, 0, 3, 0);
    //列
    flowL.minimumInteritemSpacing = 2;
    //行最小间距，低于该值就会另起一行
    flowL.minimumLineSpacing = 2;
    //创建集合视图
    self.collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(20, 10+340, Screen_Width-40,(Screen_Width - 15-20-20) / 3) collectionViewLayout:flowL];
    self.collectionView.backgroundColor = [UIColor whiteColor];
    self.collectionView.scrollEnabled = NO;
    // NSLog(@"-----%f",([UIScreen mainScreen].bounds.size.width - 60) / 5);
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    
    //注册对应的cell
    [self.collectionView registerClass:[PhotoCollectionViewCell class] forCellWithReuseIdentifier:@"cell9"];
    /**
     添加图片的按钮
     */
    UIButton *addButton = [[UIButton alloc]initWithFrame:CGRectMake(0, 5, 90, 90)];
    [addButton setBackgroundImage:[UIImage imageNamed:@"addImage"] forState:UIControlStateNormal];
    [addButton addTarget:self action:@selector(addPicture) forControlEvents:UIControlEventTouchUpInside];
    self.photoBtn = addButton;
    
    //添加集合视图
    [self.collectionView addSubview:self.photoBtn];
    [self.view addSubview:self.collectionView];
}
- (void)addPicture{
    LCActionSheet *sheet = [LCActionSheet sheetWithTitle:@"选取图像" buttonTitles:@[@"相机",@"从相册选择"] redButtonIndex:-1 clicked:^(NSInteger buttonIndex) {
        //
        if (buttonIndex == 0) {
            //
            [self selectePicWithCam];
        }else{
            MLSelectPhotoPickerViewController *mlVC = [[MLSelectPhotoPickerViewController alloc] init];
            //mlVC.selectPickers = self.photoArrayM;
            //mlVC.topShowPhotoPicker = YES;
            mlVC.status = PickerViewShowStatusCameraRoll;
            mlVC.maxCount = 3 - self.photoArrayM.count;
            [mlVC showPickerVc:self];
            mlVC.delegate = self;
            //WEAKSELF;
            //                        mlVC.callBack = ^(NSArray *assets){
            //                            STRONGSELF;
            //                            NSMutableArray *photo = assets.mutableCopy;
            //                            [self.photoArrayM addObjectsFromArray:photo];
            //                            [self.collectionView reloadData];
            //                        };
            
        }
    }];
    
    [sheet show];
    
    
}

- (void)pickerViewControllerDoneAsstes:(NSArray *)assets {
    NSMutableArray *photo = assets.mutableCopy;
    [self.photoArrayM addObjectsFromArray:photo];
    [self resetButtonFrame];
    NSLog(@"-------%zd",photo.count);
}

- (void)resetButtonFrame {
    if (self.photoArrayM.count < 3) {
        [self.collectionView reloadData];
        self.photoBtn.frame = CGRectMake(4 * (self.photoArrayM.count + 1) + (self.collectionView.frame.size.width - 15) / 3 * self.photoArrayM.count,
                                         3,
                                         90,
                                         90);
        //(self.collectionView.frame.size.width - 15) / 3 )
    }else{
        self.photoBtn.frame = CGRectMake(0, 0, 0, 0);
        [self.collectionView reloadData];
    }
    
}
- (void)selectePicWithCam {
    if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera])
    {
        UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
        imagePicker.delegate = self;
        //imagePicker.allowsEditing = YES;
        imagePicker.allowsEditing = NO;
        imagePicker.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
        imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
        [self presentViewController:imagePicker animated:YES completion:nil];
        
    }
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info
{
    UIImage *image=[info objectForKey:UIImagePickerControllerOriginalImage];
    //    [self.btn setImage:image forState:UIControlStateNormal];
    [self.photoArrayM addObject:image];
    [self resetButtonFrame];
    //[self.collectionView reloadData];
    
    //选取完图片之后关闭视图
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    [picker dismissViewControllerAnimated:YES completion:nil];
    
}

#pragma mark - CollectionView DataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    if (_photoArrayM.count == 0) {
        return 0;
    }
    else{
        return _photoArrayM.count;
    }
}
//返回每一个cell
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    PhotoCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell9" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor grayColor];
    MLSelectPhotoAssets *asset = self.photoArrayM[indexPath.item];
    
    NSLog(@"%zd",self.photoArrayM.count);
    cell.photoView.image = [MLSelectPhotoPickerViewController getImageWithImageObj:asset];
    return cell;
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    SelectedPictureViewController *sVC = [[SelectedPictureViewController alloc]init];
    [sVC returnControl:^(BOOL deleteImage) {
        if (deleteImage) {
            [self.photoArrayM removeObjectAtIndex:indexPath.row];
        }
    }];
    sVC.asset = self.photoArrayM[indexPath.row];
    //NSLog(@"%ld",(long)indexPath.item);
    [self.navigationController pushViewController:sVC animated:YES];
    
    //    MLSelectPhotoBrowserViewController *browserVC = [[MLSelectPhotoBrowserViewController alloc]init];
    //    browserVC.currentPage = indexPath.item;
    //    browserVC.photos = self.photoArrayM;
    //    //browserVC.isEditing  = YES;
    //    [self.navigationController pushViewController:browserVC animated:YES];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
