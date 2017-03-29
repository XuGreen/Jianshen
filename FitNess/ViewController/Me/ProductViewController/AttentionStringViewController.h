//
//  AttentionStringViewController.h
//  FitNess
//
//  Created by xuqq on 2017/3/28.
//  Copyright © 2017年 xuqq. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol AttentionStringDelegate <NSObject>

@optional
- (void)AttentionStringWithName : (NSString *)name;
@end
@interface AttentionStringViewController : BaseViewController
@property(nonatomic,weak)id <AttentionStringDelegate>delegate;
@end
