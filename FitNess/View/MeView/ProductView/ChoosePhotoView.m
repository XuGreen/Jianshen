//
//  ChoosePhotoView.m
//  FitNess
//
//  Created by xuqq on 2017/3/27.
//  Copyright © 2017年 xuqq. All rights reserved.
//

#import "ChoosePhotoView.h"
#import "TZImagePickerController.h"
#import <Photos/PHImageManager.h>
#import <Photos/PHAsset.h>
#import <AssetsLibrary/AssetsLibrary.h>
#import "TZImageManager.h"
#import "TZGifPhotoPreviewController.h"
#import "NetWorkManager+UploadImages.h"

@interface ChoosePhotoView()<TZImagePickerControllerDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate, UIAlertViewDelegate,UIScrollViewDelegate>{
    NSMutableArray *_selectedPhotos;
    NSMutableArray *_selectedAssets;
    BOOL _isSelectOriginalPhoto;
    NSInteger MaxNumber;
    NSInteger columnNumber;
}

@property(nonatomic,strong) UIView    *backgroundView;
@property(nonatomic,strong) UIButton *ChoosePhotoBtn;
@property(nonatomic,strong) UILabel   *ChoosrLabel;
@property (nonatomic, strong) UIImagePickerController *imagePickerVc;
@property(nonatomic,strong) UIScrollView *scrollview;



@end

@implementation ChoosePhotoView
- (instancetype)initWithFrame:(CGRect)frame{
    if (self=[super initWithFrame:frame]) {
        _selectedPhotos = [NSMutableArray array];
        _selectedAssets = [NSMutableArray array];
        MaxNumber=9;
        columnNumber=4;
        [self initUI];
    }
    return self;
}
- (void)initUI{
    
    _backgroundView=[MyView uiview:0 bColor:[UIColor whiteColor] rect:CGRectMake(0, 0, SCREENWIDTH, hight(210))];
    [self addSubview:self.backgroundView];
    _ChoosePhotoBtn = [[UIButton alloc] initWithFrame:_backgroundView.bounds];
    _ChoosePhotoBtn.hidden=NO;
    _ChoosePhotoBtn.tag=20;
    [_ChoosePhotoBtn setImage:[UIImage imageNamed:@"upload1"] forState:UIControlStateNormal];
    _ChoosePhotoBtn.imageEdgeInsets = UIEdgeInsetsMake(1.0, 1.0, 0.0, 1.0);
    [_ChoosePhotoBtn addTarget:self action:@selector(addImage) forControlEvents:UIControlEventTouchUpInside];
    [_backgroundView addSubview:_ChoosePhotoBtn];
    
    _ChoosrLabel = [[UILabel alloc] initWithFrame:CGRectMake(0.0, _backgroundView.bounds.size.height / 2.0 + 25.0, _backgroundView.bounds.size.width, 20.0)];
    _ChoosrLabel.text = @"(可多张)";
    _ChoosrLabel.hidden=NO;
    _ChoosrLabel.font = [UIFont systemFontOfSize:13.0];
    _ChoosrLabel.textAlignment = NSTextAlignmentCenter;
    _ChoosrLabel.textColor = [tools colorWithHex:0x999999];
    [_backgroundView addSubview:_ChoosrLabel];
    

}
-(void) addImages:(NSMutableArray *)photoArray{
    _scrollview=[[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, SCREENWIDTH, hight(210))];
    _scrollview.backgroundColor=[UIColor whiteColor];
    _scrollview.delegate=self;
    _scrollview.tag=200;
    _scrollview.showsVerticalScrollIndicator=NO;
    _scrollview.showsHorizontalScrollIndicator=NO;
      _scrollview.contentSize=CGSizeMake(wight(180)*photoArray.count+wight(300), 0);
    [_scrollview setContentOffset:CGPointMake(0, 0)];
    [self addSubview:self.scrollview];
    UIButton *addImageBtn=[[UIButton alloc]initWithFrame:CGRectMake(15, 10, wight(180), hight(180))];
    addImageBtn.tag=20;
    [addImageBtn addTarget:self action:@selector(addImage) forControlEvents:UIControlEventTouchUpInside];
    addImageBtn.backgroundColor=XQQColorA(237, 237, 237);
    [addImageBtn setImage:[UIImage imageNamed:@"upload1"] forState:UIControlStateNormal];
    [_scrollview addSubview:addImageBtn];
    UIImageView *imageView;
    for (int i=0; i<photoArray.count; i++) {
        imageView=[[UIImageView alloc]initWithFrame:CGRectMake(addImageBtn.xmg_right+wight(14)+wight(194)*i, 10, wight(180), hight(180))];
        imageView.userInteractionEnabled=YES;
        imageView.tag=i;
        UITapGestureRecognizer *tap1=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(singTap:)];
        [imageView addGestureRecognizer:tap1];
        imageView.image=[photoArray objectAtIndex:i];
        
        [_scrollview addSubview:imageView];
        
        UIImageView *delete=[[UIImageView alloc]initWithFrame:CGRectMake(imageView.xmg_width-wight(30), 0, wight(30), hight(30))];
        delete.userInteractionEnabled=YES;
        delete.tag=i;
        delete.image=[UIImage imageNamed:@"out"];
        UITapGestureRecognizer *tap2=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(deleteTap2:)];
        [delete addGestureRecognizer:tap2];
        [imageView addSubview:delete];

        if (i==0) {
            UIView *fengmian=[MyView uiview:0 bColor:[tools colorWithHex:0xFFb81F]rect:CGRectMake(0, imageView.xmg_height-hight(180)/5, wight(180), hight(180)/5)];
            fengmian.alpha=0.8;
   
            UILabel *fengLabel=[MyView label:@"封面" tColor: [UIColor whiteColor] font:[UIFont systemFontOfSize:14] rect:CGRectMake(0, 0, fengmian.xmg_width, fengmian.xmg_height)];
            fengLabel.textAlignment=NSTextAlignmentCenter;
            [fengmian addSubview:fengLabel];
            [imageView addSubview:fengmian];
        }
     
}

}
- (void)singTap:(UITapGestureRecognizer *)sender{
    UITapGestureRecognizer *singleTap=(UITapGestureRecognizer *)sender;
    int index=(int)[singleTap view].tag;
    //预览图片
    id asset = _selectedAssets[index];
    BOOL isVideo = NO;
    if ([asset isKindOfClass:[PHAsset class]]) {
        PHAsset *phAsset = asset;
        isVideo = phAsset.mediaType == PHAssetMediaTypeVideo;
    } else if ([asset isKindOfClass:[ALAsset class]]) {
        ALAsset *alAsset = asset;
        isVideo = [[alAsset valueForProperty:ALAssetPropertyType] isEqualToString:ALAssetTypeVideo];
    }
    if ([[asset valueForKey:@"filename"] containsString:@"GIF"]) {
        TZGifPhotoPreviewController *vc = [[TZGifPhotoPreviewController alloc] init];
        TZAssetModel *model = [TZAssetModel modelWithAsset:asset type:TZAssetModelMediaTypePhotoGif timeLength:@""];
        vc.model = model;
        [self.vc presentViewController:vc animated:YES completion:nil];
    } else { // preview photos / 预览照片
        TZImagePickerController *imagePickerVc = [[TZImagePickerController alloc] initWithSelectedAssets:_selectedAssets selectedPhotos:_selectedPhotos index:index];
        imagePickerVc.maxImagesCount = 9;
        imagePickerVc.allowPickingOriginalPhoto =YES;
        imagePickerVc.isSelectOriginalPhoto = _isSelectOriginalPhoto;
        [imagePickerVc setDidFinishPickingPhotosHandle:^(NSArray<UIImage *> *photos, NSArray *assets, BOOL isSelectOriginalPhoto) {
            _selectedPhotos = [NSMutableArray arrayWithArray:photos];
            _selectedAssets = [NSMutableArray arrayWithArray:assets];
            _isSelectOriginalPhoto = isSelectOriginalPhoto;
            [self addImages:_selectedPhotos];
        }];
        [self.vc presentViewController:imagePickerVc animated:YES completion:nil];
    }

}
- (void)deleteTap2:(UITapGestureRecognizer *)sender{
    UITapGestureRecognizer *singleTap=(UITapGestureRecognizer *)sender;
    int index=(int)[singleTap view].tag;
    if (_selectedPhotos.count>0) {
        [_selectedPhotos removeObjectAtIndex:index];
        [self addImages:_selectedPhotos];
    }
    if (_selectedPhotos.count==0) {
        for (id obj1 in self.subviews) {
            if ([obj1 isKindOfClass:[UIScrollView class]]) {
                UIScrollView *scrollview=(UIScrollView *)obj1;
                if (scrollview.tag==200) {
                    [obj1 removeFromSuperview];
                }
            }
            if ([obj1 isKindOfClass:[UIButton class]]) {
                UIButton *button=(UIButton *)obj1;
                if (button.tag==20) {
                    [obj1 removeFromSuperview];
                }
            }
        }
        [self initUI];
    }
}

- (void)addImage{
    UIAlertController * alertController = [UIAlertController alertControllerWithTitle:nil                                                                             message: nil                                                                       preferredStyle:UIAlertControllerStyleActionSheet];
    [alertController addAction: [UIAlertAction actionWithTitle: @"拍照" style: UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        [self takePhoto];
    }]];
    [alertController addAction: [UIAlertAction actionWithTitle: @"从相册选择" style: UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        [self choosePhoto];
    }]];
    [alertController addAction: [UIAlertAction actionWithTitle: @"取消" style: UIAlertActionStyleCancel handler:nil]];
    [self.vc presentViewController:alertController animated:YES completion:nil];
}
//拍照
- (void)takePhoto{
    AVAuthorizationStatus authStatus=[AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeVideo];
    if ((authStatus== AVAuthorizationStatusRestricted || authStatus==AVAuthorizationStatusDenied) && iOS7Later) {
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"无法使用相机" message:@"请在 iPhone的""设置-隐私-相机""中允许访问相机" delegate:self cancelButtonTitle:@"取消" otherButtonTitles: @"设置", nil];
        [alert show];
        //拍照之前检查相册权限
    }else if ([[TZImageManager manager]authorizationStatus] == 2){
        // 已被拒绝，没有相册权限，将无法保存拍的照片
        UIAlertView * alert = [[UIAlertView alloc]initWithTitle:@"无法访问相册" message:@"请在iPhone的""设置-隐私-相册""中允许访问相册" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"设置", nil];
        alert.tag = 1;
        [alert show];
    }else if ([[TZImageManager manager]authorizationStatus]==0){
        // 正在弹框询问用户是否允许访问相册，监听权限状态
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            return [self takePhoto];
        });
    }else{
        //调用相机
        UIImagePickerControllerSourceType sourceType=UIImagePickerControllerSourceTypeCamera;
        if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
            self.imagePickerVc.sourceType=sourceType;
            if (iOS8Later) {
                _imagePickerVc.modalPresentationStyle=UIModalPresentationCurrentContext;
            }
            [self.vc presentViewController:_imagePickerVc animated:YES completion:nil];
        }else{
            XQQLog(@"模拟器中无法打开照相机,请在真机中使用");
        }
    }
}
//从相册选择照片
- (void)choosePhoto{
    TZImagePickerController *imagePickerVc=[[TZImagePickerController alloc]initWithMaxImagesCount:MaxNumber columnNumber:columnNumber delegate:self pushPhotoPickerVc:YES];
    imagePickerVc.allowPickingOriginalPhoto=_isSelectOriginalPhoto;
    if (MaxNumber>1) {
        //设置目前已经选中的数组
        imagePickerVc.selectedAssets=_selectedAssets;
    }
    imagePickerVc.allowTakePicture=NO;
    imagePickerVc.allowPickingGif=YES;
    imagePickerVc.allowPickingImage=YES;

    imagePickerVc.allowCrop=YES;
    [self.vc presentViewController:imagePickerVc animated:YES completion:nil];
}
#pragma mark TZImagePickerControllerDelegate
-(void)imagePickerController:(TZImagePickerController *)picker didFinishPickingPhotos:(NSArray<UIImage *> *)photos sourceAssets:(NSArray *)assets isSelectOriginalPhoto:(BOOL)isSelectOriginalPhoto{
    _selectedPhotos=[NSMutableArray arrayWithArray:photos];
    _selectedAssets=[NSMutableArray arrayWithArray:assets];
    _isSelectOriginalPhoto=isSelectOriginalPhoto;
    
    if (self.backgroundView) {
        [self.backgroundView removeFromSuperview];
    }
    [self addImages:_selectedPhotos];
    [self printAssetsName:assets];
        //上传图片
        NSMutableDictionary *dic=[[NSMutableDictionary alloc]init];
        [dic setValue:@"10" forKey:@"uid"];
        [dic setValue:@"product" forKey:@"table_name"];
        
        [NetWorkManager uploadImageWithOperations:dic
                                   withImageArray: photos
                                  withtargetWidth:640
                                    withUrlString:@"http://192.168.1.187/index/attachment/upload"
                                 withSuccessBlock:^(BaseResponse *response) {
                                     NSDictionary *dict=(NSDictionary *)response;
                                     NSArray *data=response.data;
                                     XQQLog(@"data:%@  -----%@",data,dict);
                                     [self.delegate ChoosePhotoDelegateWithName:data];
                                 } withFailurBlock:^(NSError *error) {
                                     NSDictionary *dict=(NSDictionary *)error.userInfo;
                                     [MBProgressHUD showSucessNoImageText:dict[@"error"]];
                                     
                                 } withUpLoadProgress:^(float progress) {
                                     XQQLog(@"%f",progress);
                                   
                                }];
    
}
// 如果用户选择了一个gif图片，下面的handle会被执行
- (void)imagePickerController:(TZImagePickerController *)picker didFinishPickingGifImage:(UIImage *)animatedImage sourceAssets:(id)asset {
    _selectedPhotos = [NSMutableArray arrayWithArray:@[animatedImage]];
    _selectedAssets = [NSMutableArray arrayWithArray:@[asset]];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    if ([picker isKindOfClass:[UIImagePickerController class]]) {
        [picker dismissViewControllerAnimated:YES completion:nil];
    }
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self endEditing:YES];
}
#pragma mark - UIAlertViewDelegate

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    if (buttonIndex == 1) {
        // 去设置界面，开启相机访问权限
        if (iOS8Later) {
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:UIApplicationOpenSettingsURLString]];
        } else {
            NSURL *privacyUrl;
            if (alertView.tag == 1) {
                privacyUrl = [NSURL URLWithString:@"prefs:root=Privacy&path=PHOTOS"];
            } else {
                privacyUrl = [NSURL URLWithString:@"prefs:root=Privacy&path=CAMERA"];
            }
            if ([[UIApplication sharedApplication] canOpenURL:privacyUrl]) {
                [[UIApplication sharedApplication] openURL:privacyUrl];
            } else {
                UIAlertView * alert = [[UIAlertView alloc]initWithTitle:@"抱歉" message:@"无法跳转到隐私设置页面，请手动前往设置页面，谢谢" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles: nil];
                [alert show];
            }
        }
    }
}
#pragma mark - Private

/// 打印图片名字
- (void)printAssetsName:(NSArray *)assets {
    NSString *fileName;
    for (id asset in assets) {
        if ([asset isKindOfClass:[PHAsset class]]) {
            PHAsset *phAsset = (PHAsset *)asset;
            fileName = [phAsset valueForKey:@"filename"];
        } else if ([asset isKindOfClass:[ALAsset class]]) {
            ALAsset *alAsset = (ALAsset *)asset;
            fileName = alAsset.defaultRepresentation.filename;;
        }
        NSLog(@"图片名字:%@",fileName);
    }
}
- (UIImagePickerController *)imagePickerVc{
    if (_imagePickerVc == nil) {
        _imagePickerVc = [[UIImagePickerController alloc] init];
        _imagePickerVc.delegate = self;
        // set appearance / 改变相册选择页的导航栏外观
        _imagePickerVc.navigationBar.barTintColor = self.vc.navigationController.navigationBar.barTintColor;
        _imagePickerVc.navigationBar.tintColor = self.vc.navigationController.navigationBar.tintColor;
        UIBarButtonItem *tzBarItem, *BarItem;
        if (iOS9Later) {
            tzBarItem = [UIBarButtonItem appearanceWhenContainedInInstancesOfClasses:@[[TZImagePickerController class]]];
            BarItem = [UIBarButtonItem appearanceWhenContainedInInstancesOfClasses:@[[UIImagePickerController class]]];
        } else {
            tzBarItem = [UIBarButtonItem appearanceWhenContainedIn:[TZImagePickerController class], nil];
            BarItem = [UIBarButtonItem appearanceWhenContainedIn:[UIImagePickerController class], nil];
        }
        NSDictionary *titleTextAttributes = [tzBarItem titleTextAttributesForState:UIControlStateNormal];
        [BarItem setTitleTextAttributes:titleTextAttributes forState:UIControlStateNormal];
    }
    return _imagePickerVc;
}

@end
