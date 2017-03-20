//
//  NetWorkManager+GET_POST.h
//  GuangXunCom
//
//  Created by Jiang on 16/11/30.
//  Copyright © 2016年 Jiang. All rights reserved.
//

#import "NetWorkManager.h"



@interface NetWorkManager (GET_POST)

+ (void)GET:(NSString *)URLString parameters:(id)parameters success:(requestSuccess)success failure:(requestFailure)failure;

//追加id
+ (void)personalPOST:(NSString *)url Parameters:(NSDictionary *)parameters success:(requestSuccess)success failure:(requestFailure)failure;


+ (void )POST:(NSString *)URLString parameters:(id)parameters success:(requestSuccess)success failure:(requestFailure)failure;

+(void)POST:(NSString *)URLString parameters:(id)parameters AFMultipartFormData:(NSDictionary *)multipar  success:(requestSuccess)success failure:(requestFailure)failure;

+ (void)parseResponseWithObject:(id)object success:(requestSuccess)success failure:(requestFailure)failurep;

@end
