//
//  ServerDescribeViewController.h
//  FitNess
//
//  Created by xuqq on 2017/3/28.
//  Copyright © 2017年 xuqq. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol ServerDescribeDelegate <NSObject>

@optional
- (void)ServerDescribeWithName : (NSString *)name  hour:(NSString *)hour person:(NSString *)person;
@end
@interface ServerDescribeViewController : BaseViewController
@property(nonatomic,strong)NSString *name;
@property(nonatomic,strong)NSString *hour;
@property(nonatomic,strong)NSString *person;
@property(nonatomic,weak)id <ServerDescribeDelegate>delegate;
@end
