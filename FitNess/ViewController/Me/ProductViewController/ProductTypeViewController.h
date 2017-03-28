//
//  ProductTypeViewController.h
//  FitNess
//
//  Created by xuqq on 2017/3/27.
//  Copyright © 2017年 xuqq. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SelectTypeDelegate <NSObject>

@optional
- (void)selectTypeWithName : (NSString *)name;
@end
@interface ProductTypeViewController : UIViewController
@property(nonatomic,weak)id <SelectTypeDelegate>delegate;
@end
