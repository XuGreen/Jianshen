//
//  NetWorkManager.h
//  GuangXunCom
//
//  Created by Jiang on 16/11/22.
//  Copyright © 2016年 Jiang. All rights reserved.
//

#import <Foundation/Foundation.h>

/**定义请求类型的枚举*/

typedef NS_ENUM(NSUInteger,HttpRequestType)
{
    
    HttpRequestTypeGet = 0,
    HttpRequestTypePost
    
};

@class BaseResponse;
/**定义请求成功的block*/
typedef void(^requestSuccess)(BaseResponse *response);

/**定义请求失败的block*/
typedef void(^requestFailure)( NSError *error);

/**定义上传进度block*/
typedef void(^uploadProgress)(float progress);

/**定义下载进度block*/
typedef void(^downloadProgress)(float progress);


@interface NetWorkManager : AFHTTPSessionManager
#pragma mark - 登录注册
//登录
+ (void)LoginWithTel:(NSString *)tel
            PassWord:(NSString *)passWord
            StringMD5:(NSString *)StrMD5
             success:(requestSuccess)success
             failure:(requestFailure)failure;

//注册
+ (void)RegisterWithPhoneNumber:(NSString *)phoneNumber
                       Code:(NSString *)code
                       PassWord:(NSString *)passWord
                      StringMD5:(NSString *)StrMD5
                        success:(requestSuccess)success
                        failure:(requestFailure)failure;

//获取验证码
+ (void)getVerifyCodeWithPhoneNumber:(NSString *)phoneNumber
                            IsForget:(BOOL)isForget
                             success:(requestSuccess)success
                             failure:(requestFailure)failure;


//验证验证码
+ (void)VerificationCode:(NSString *)code
                 success:(requestSuccess)success
                 failure:(requestFailure)failure;

//忘记密码
+ (void)ForgetPassWord:(NSString *)tel
           NewPassWord:(NSString *)New
                  Code:(NSString *)code
               success:(requestSuccess)success
               failure:(requestFailure)failure;

#pragma mark - init
/**
 *  单例方法
 *
 *  @return 实例对象
 */
+(instancetype)sharInstance;


/**
 *  取消所有的网络请求
 */


+(void)cancelAllRequest;
/**
 *  取消指定的url请求
 *
 *  @param requestType 该请求的请求类型
 *  @param string      该请求的url
 */

+(void)cancelHttpRequestWithRequestType:(NSString *)requestType requestUrlString:(NSString *)string;
@end
