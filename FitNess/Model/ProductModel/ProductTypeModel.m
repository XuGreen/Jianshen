//
//  ProductTypeModel.m
//  FitNess
//
//  Created by xuqq on 2017/4/5.
//  Copyright © 2017年 xuqq. All rights reserved.
//

#import "ProductTypeModel.h"

@implementation ProductTypeModel
+ (JSONKeyMapper *)keyMapper{
    return [[JSONKeyMapper alloc] initWithDictionary:
            @{@"id":@"typeId"}];
}
@end
