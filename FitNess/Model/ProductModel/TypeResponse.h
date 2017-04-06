//
//  TypeResponse.h
//  FitNess
//
//  Created by xuqq on 2017/4/5.
//  Copyright © 2017年 xuqq. All rights reserved.
//

#import "ResponseBase.h"
#import "ProductTypeModel.h"

@interface TypeResponse : ResponseBase
@property(nonatomic,strong) NSArray<ProductTypeModel *> *data;
@end
