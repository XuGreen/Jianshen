//
//  NSObject+Property.h
//  property
//
//  Created by jiang on 16/10/22.
//  Copyright © 2016年 jiang. All rights reserved.
//  通过解析字典自动生成属性代码

#import <Foundation/Foundation.h>

@interface NSObject (Property)

+ (void)createPropertyCodeWithDict:(NSDictionary *)dict;


@end
