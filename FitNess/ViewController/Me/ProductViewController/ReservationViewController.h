//
//  ReservationViewController.h
//  FitNess
//
//  Created by xuqq on 2017/3/29.
//  Copyright © 2017年 xuqq. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol ReservationDelegate <NSObject>

@optional
- (void)ReservationWithArray:(NSMutableArray *)DateTimeArray serverTime:(NSString *)serverTime;

@end
@interface ReservationViewController : UIViewController
@property(nonatomic,weak)id <ReservationDelegate>delegate;
@property (strong, nonatomic) NSMutableArray *AllTimeArray;
@end
