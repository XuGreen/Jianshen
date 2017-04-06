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
- (void)ServerDescribeWithName : (NSMutableArray *)serverArray hour:(NSString *)hour person:(NSString *)person nameArray:(NSMutableArray *)nameArray btnTag:(NSInteger)btnTag ;
@end
@interface ServerDescribeViewController : UIViewController
@property(nonatomic,strong) NSMutableArray *nameArray;
@property(nonatomic,strong)NSString *hour;
@property(nonatomic,strong)NSString *person;
@property(nonatomic,assign)NSInteger btnTag;
@property(nonatomic,weak)id <ServerDescribeDelegate>delegate;
@end
