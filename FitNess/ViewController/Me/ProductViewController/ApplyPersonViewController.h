//
//  ApplyPersonViewController.h
//  FitNess
//
//  Created by xuqq on 2017/3/28.
//  Copyright © 2017年 xuqq. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol ApplyPersonDelegate <NSObject>

@optional
- (void)ApplyPersonWithName : (NSString *)name;
@end
@interface ApplyPersonViewController : BaseViewController
@property(nonatomic,weak)id <ApplyPersonDelegate>delegate;
@end
