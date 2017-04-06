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

/**
 *  上传带图片的内容，允许多张图片上传（URL）POST
 *
 *  @param url                 网络请求地址
 *  @param images              要上传的图片数组（注意数组内容需是图片）
 *  @param parameter           图片数组对应的参数  (注意多张图片,每张的图片名应该不同)
 *  @param parameters          其他参数字典
 *  @param ratio               图片的压缩比例（0.0~1.0之间）
 *  @param succeedBlock        成功的回调
 *  @param failedBlock         失败的回调
 *  @param uploadProgressBlock 上传进度的回调
 */
+(void)startMultiPartUploadTaskWithURL:(NSString *)url
                           imagesArray:(NSArray *)images
                     parameterOfimages:(NSString *)parameter
                        parametersDict:(NSDictionary *)parameters
                      compressionRatio:(float)ratio
                          succeedBlock:(void(^)(id operation, id responseObject))succeedBlock
                           failedBlock:(void(^)(id operation, NSError *error))failedBlock
                   uploadProgressBlock:(void(^)(float uploadPercent,long long totalBytesWritten,long long totalBytesExpectedToWrite))uploadProgressBlock;

//发布产品
+(void)IssueProduct:(NSInteger)userID
          productID:(NSInteger)productID
               productTitle:(NSString *)productTitle
               productFuTitle:(NSString *)productFuTitle
               productPrice:(NSString *)productPrice
               shichangPrice:(NSString *)shichangPrice
                serverNumber:(NSString *)serverNumber
               shiyongPerson:(NSString *)shiyongPerson
               precautions:(NSString *)precautions
              productContent:(NSString *)productContent
                productDesc:(NSString *)productDesc
            ImageID:(NSString *)ImageArrID
        limited:(NSInteger)limited
            limit_date:(NSString *)limit_date
            service_time:(NSString *)service_time
         appointment:(NSString *)appointment
              success:(requestSuccess)success
              failure:(requestFailure)failure;
//获取产品类型
+(void)getProductArraysuccess:(requestSuccess)success
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
