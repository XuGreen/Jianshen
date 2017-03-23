//
//  JobsModel.m
//  FitNess
//
//  Created by xuqq on 2017/3/22.
//  Copyright © 2017年 xuqq. All rights reserved.
//

#import "JobsModel.h"

@implementation JobsModel
- (NSArray *)PhotoArray{
    if (!_PhotoArray) {
        _PhotoArray = [NSArray array];
    }
    return _PhotoArray;
}
@end
