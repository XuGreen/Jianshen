//
//  ProductTypeModel.h
//  FitNess
//
//  Created by xuqq on 2017/4/5.
//  Copyright © 2017年 xuqq. All rights reserved.
//

#import <JSONModel/JSONModel.h>

@interface ProductTypeModel : JSONModel
@property(nonatomic,copy) NSString<Optional> *typeId;

@property(nonatomic,copy) NSString<Optional> *name;

@end
