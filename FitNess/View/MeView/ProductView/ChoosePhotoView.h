//
//  ChoosePhotoView.h
//  FitNess
//
//  Created by xuqq on 2017/3/27.
//  Copyright © 2017年 xuqq. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ChoosePhotoDelegate <NSObject>

@optional
- (void)ChoosePhotoDelegateWithName : (NSArray *)DataArray;
@end
@interface ChoosePhotoView : UIView
@property(nonatomic,strong) UIViewController *vc;
@property(nonatomic,weak)id <ChoosePhotoDelegate>delegate;
@end
