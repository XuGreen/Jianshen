//
//  ForgetViewController.h
//  FitNess
//
//  Created by xuqq on 2017/3/14.
//  Copyright © 2017年 xuqq. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ForgetViewController : UIViewController<ServiceAPIDelegate>{
    ServiceAPI *SA;
    UILabel *CodeLabel;
    NSTimer *timer;
    int secondCountDown;
}


@end
