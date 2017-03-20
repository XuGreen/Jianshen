//
//  BaseResponse.h
//  GuangXunCom
//
//  Created by Jiang on 16/11/22.
//  Copyright © 2016年 Jiang. All rights reserved.
//
#import <Foundation/Foundation.h>
NS_ASSUME_NONNULL_BEGIN

@interface BaseResponse : NSObject
{
    id data;
    NSString *code;
    NSString *msg;
}

- (id __nullable)data;
- (NSString * __nullable)code;
- (NSString * __nullable)msg;

@property(nonatomic,assign,readonly)BOOL isSuccess;
+ (instancetype)buildWithDict:(NSDictionary *)dict;

NS_ASSUME_NONNULL_END

@end
