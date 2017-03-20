//
//  NetWorkManager+GET_POST.m
//  GuangXunCom
//
//  Created by Jiang on 16/11/30.
//  Copyright © 2016年 Jiang. All rights reserved.
//

#import "NetWorkManager+GET_POST.h"

#define FINAL_BLOCK \
success:(requestSuccess)success failure:(requestFailure)failure;

#define IM_FINAL_BLOCK \
success:(requestSuccess)success failure:(requestFailure)failure{

@implementation NetWorkManager (GET_POST)

+ (void)GET:(NSString *)URLString parameters:(id)parameters success:(requestSuccess)success failure:(requestFailure)failure{
    
    [[NetWorkManager sharInstance] GET:URLString parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [NetWorkManager parseResponseWithObject:responseObject success:success failure:failure];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failure(error);
    }];
    
}

///参数里追加id
+ (void)personalPOST:(NSString *)url Parameters:(NSDictionary *)parameters success:(requestSuccess)success failure:(requestFailure)failure{
    if (parameters == nil) {
        parameters = @{};
    }
    
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionaryWithDictionary:parameters];
    
    [NetWorkManager POST:url parameters:mutableDict success:success failure:failure];
}

+(void)POST:(NSString *)URLString parameters:(id)parameters AFMultipartFormData:(NSDictionary *)multipar  success:(requestSuccess)success failure:(requestFailure)failure{
    [[NetWorkManager sharInstance] POST:URLString parameters:parameters constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        NSArray *keys = [multipar allKeys];
        for (NSString  *key in keys) {
            id data = multipar[key];
            if ([data isKindOfClass:[NSData class]] && data) {
                [formData appendPartWithFileData:data name:key fileName:[NSString stringWithFormat:@"%@.JPG",key] mimeType:@"image/JPG"];
            }else{
                continue;
            }
        }
    } progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [NetWorkManager parseResponseWithObject:responseObject success:success failure:failure];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failure(error);
    }];

}

+ (void )POST:(NSString *)URLString parameters:(id)parameters success:(requestSuccess)success failure:(requestFailure)failure{
    NSLog(@"%@",parameters);
    [[NetWorkManager sharInstance] POST:URLString parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"\n%@\n",task.response.URL.absoluteString);
        //使用响应基类解析响应信息
        [NetWorkManager parseResponseWithObject:responseObject success:success failure:failure];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//        NSDictionary *dict = error.userInfo;
//        id object = dict[@"com.alamofire.serialization.response.error.data"];
//        NSData *newData = [NetWorkManager getNewDataWhenServerReturnHTML:object];
//        NSDictionary *data  = [NSJSONSerialization JSONObjectWithData:newData options:NSJSONReadingMutableContainers error:&error];
//            NSError *custError = [[NSError alloc] initWithDomain:NSOSStatusErrorDomain code:404 userInfo:@{error: data[@"error"]}];
        failure(error);
    }];
}

///使用基础响应类解析返回信息
+ (void)parseResponseWithObject:(id)object success:(requestSuccess)success failure:(requestFailure)failure{
    NSError *error = nil;
    
    NSData *newData = [NetWorkManager getNewDataWhenServerReturnHTML:object];
    
    NSDictionary *data  = [NSJSONSerialization JSONObjectWithData:newData options:NSJSONReadingMutableContainers error:&error];
    
    NSLog(@"%@",data);
    BaseResponse *response = [BaseResponse buildWithDict:data];
    success(response);
//    if (error == nil) { //数据解析成功
//        BaseResponse *response = [BaseResponse buildWithDict:data];
//        if (response.isSuccess) {
//            success(response);
//        }else{
//            NSError *serverError = [NSError errorWithDomain:NSCocoaErrorDomain code:[response.code integerValue] userInfo:@{NSLocalizedDescriptionKey:response.msg}];
//            failure(serverError);
//        }
//    }else{
////        NSString *response = [[NSString alloc] initWithData:object encoding:NSUTF8StringEncoding];
////        //数据解析错误
////        NSError *serializationError = [NSError errorWithDomain:NSCocoaErrorDomain code:998 userInfo:@{NSLocalizedDescriptionKey:response}];
////        NSError *serializationError = [NSError errorWithDomain:NSCocoaErrorDomain code:998 userInfo:@{NSLocalizedDescriptionKey:@"服务器出错"}];
//        failure(error);
//    }
}

//如果服务器有HTML代码截取JSON数据
+ (NSData *)getNewDataWhenServerReturnHTML:(NSData *)data{
    
    NSString *string = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
    
    if (![string hasPrefix:@"<b"]) { //如果不含有
        return data;
    }
    
    NSRange startRang = [string rangeOfString:@"{\""]; // {"
    if (startRang.length == 0) {
        return data;
    }
    
    NSRange endRang = [string rangeOfString:@"}"];
    
    NSInteger addCount = 1;
    
    if ([string rangeOfString:@"}}"].length != 0) {
        addCount = 2;
    }
    
    if ([string rangeOfString:@"}}}"].length != 0) {
        addCount = 3;
    }
    
    NSString *needString = [string substringWithRange:NSMakeRange(startRang.location, endRang.location - startRang.location + addCount)];
    
    return [needString dataUsingEncoding:NSUTF8StringEncoding];
}
@end
