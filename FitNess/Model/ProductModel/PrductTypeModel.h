//
//  PrductTypeModel.h
//  FitNess
//
//  Created by xuqq on 2017/4/6.
//  Copyright © 2017年 xuqq. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PrductTypeModel : NSObject{
    NSString *typeId;
    NSString *name;
}
@property(nonatomic,copy) NSString *typeId;

@property(nonatomic,copy) NSString *name;
@end
