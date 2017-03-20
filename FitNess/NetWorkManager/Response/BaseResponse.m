//
//  BaseResponse.m
//  GuangXunCom
//
//  Created by Jiang on 16/11/22.
//  Copyright © 2016年 Jiang. All rights reserved.
//

#import "BaseResponse.h"

#define successKey @"1000"

@implementation BaseResponse


+ (instancetype)buildWithDict:(NSDictionary *)dict{
    return [[self alloc] initWithDict:dict];
}

- (instancetype)initWithDict:(NSDictionary *)dict{
    if (self = [super init]) {
//        code = @"1";
//        data = dict;
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}
- (void)setValue:(id)value forKey:(NSString *)key{
    if ([value isKindOfClass:[NSNumber class]]) { //如果是int类型的，转为NSString
        value = [NSString stringWithFormat:@"%@",value];
    }
    [super setValue:value forKey:key];
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key{

}
- (id)data{
    return self.isSuccess ? data : nil;
}

- (NSString *)code{

    return code;
}

- (BOOL)isSuccess{
    
    return [code isEqualToString:successKey];
}

- (NSString  *)msg{
    return msg == nil ? @"发生未知错误" : msg;
}

@end
