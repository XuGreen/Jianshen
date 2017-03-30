//
//  ProductLanunchViewController.h
//  FitNess
//
//  Created by xuqq on 2017/3/25.
//  Copyright © 2017年 xuqq. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ProductTypeViewController.h"
#import "ChoosePhotoView.h"
#import "ProductDetailViewController.h"
#import "ServerDescribeViewController.h"
#import "ApplyPersonViewController.h"
#import "AttentionStringViewController.h"
#import "ProtectionViewController.h"
#import "ReservationViewController.h"
#import "ZHDatePickerView.h"


@interface ProductLanunchViewController : UIViewController<UITextFieldDelegate,UITableViewDelegate,UITableViewDataSource,SelectTypeDelegate,UITextViewDelegate,InputProductDetailDelegate,ServerDescribeDelegate,ApplyPersonDelegate,AttentionStringDelegate,ZHDatePickerViewDelegate>

@end
