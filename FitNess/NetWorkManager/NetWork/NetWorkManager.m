//
//  NetWorkManager.m
//  GuangXunCom
//
//  Created by Jiang on 16/11/22.
//  Copyright © 2016年 Jiang. All rights reserved.
//

#import "NetWorkManager.h"
#import "NetWorkManager+GET_POST.h"
#import "NetWorkManager+UploadImages.h"

const int  Count = 1;
//static NSString *const User_ID = GlobalUser.user_id;
#define User_ID GlobalUser.user_id
#define BaseURL  @"http://192.168.1.164/public/index.php/index/"

@implementation NetWorkManager
#pragma mark - 登录注册

+ (void)LoginWithTel:(NSString *)tel
            PassWord:(NSString *)passWord
           StringMD5:(NSString *)StrMD5
             success:(requestSuccess)success
             failure:(requestFailure)failure{
    NSDictionary *param =  @{@"mobile":tel,
                             @"password":passWord,
                             @"key":StrMD5};
    [NetWorkManager POST:@"login/login" parameters:param success:success failure:failure];
}


+ (void)RegisterWithPhoneNumber:(NSString *)phoneNumber
                           Code:(NSString *)code
                       PassWord:(NSString *)passWord
                      StringMD5:(NSString *)StrMD5
                        success:(requestSuccess)success
                        failure:(requestFailure)failure{
    NSDictionary *param = @{@"mobile":phoneNumber,
                            @"password":passWord,
                            @"verify":code,
                            @"key":StrMD5};
    [NetWorkManager POST:@"register/add_user" parameters:param success:success failure:failure];
}

+ (void)getVerifyCodeWithPhoneNumber:(NSString *)phoneNumber
                          IsForget:(BOOL)isForget
                             success:(requestSuccess)success
                             failure:(requestFailure)failure{

    NSDictionary *param = @{@"phone":phoneNumber};
    NSString *url = @"";
    if (isForget) {
        url = @"postSms";
    }else{
        url = @"postSms";
    }
    [NetWorkManager POST:url parameters:param success:success failure:failure];
}

//验证验证码
+ (void)VerificationCode:(NSString *)code
                 success:(requestSuccess)success
                 failure:(requestFailure)failure{
    
    NSDictionary *param = @{@"code":code};
     [NetWorkManager POST:@"/youlechuan2/controller/validateCode.php" parameters:param success:success failure:failure];
}
+ (void)ForgetPassWord:(NSString *)tel
          NewPassWord:(NSString *)New
                  Code:(NSString *)code
              success:(requestSuccess)success
              failure:(requestFailure)failure{
    NSDictionary *param = @{@"phoneNumber":tel,
                            @"password":New,
                            @"code":code};
    [NetWorkManager POST:@"/youlechuan2/controller/resetPassword.php" parameters:param success:success failure:failure];

}
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
         limit_date:(NSInteger)limit_date
            success:(requestSuccess)success
            failure:(requestFailure)failure{
    NSDictionary *param=@{@"uid":@(userID),
                           @"class_id":@(productID),
                          @"title":productTitle,
                          @"subtitle":productFuTitle,
                          @"price":productPrice,
                          @"number":serverNumber,
                          @"market_price":shichangPrice,
                          @"intended_for":shiyongPerson,
                          @"precautions":precautions,
                          @"content":productContent,
                          @"desc":productDesc,
                          @"att_id":ImageArrID,
                          @"limited":@(limited),
                          @"limit_date":@(limit_date)};
    NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithDictionary:param];
    NSArray *keys = [dict allKeys];
    for (NSString  *key in keys) {
        id value = dict[key];
        if ([value isKindOfClass:[NSString class]]) {
            if ([value isEqualToString:@""]) {
                [dict removeObjectForKey:key];
            }
        }
    }
    [NetWorkManager POST:@"http://192.168.1.187/product" parameters:param success:success failure:failure];
}
+(instancetype)sharInstance
{
    
    static NetWorkManager * manager = nil;
    
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        
        manager = [[self alloc] initWithBaseURL:[NSURL URLWithString:BaseURL]];
        
    });
//    if (GlobalUser.token) {
//        [manager.requestSerializer setValue:[NSString stringWithFormat:@"Bearer %@",GlobalUser.token] forHTTPHeaderField:@"Authorization"];
//    }
    return manager;
}

-(instancetype)initWithBaseURL:(NSURL *)url
{
    
    if (self = [super initWithBaseURL:url]) {
        
        NSAssert(url,@"您需要为您的请求设置baseUrl");
        
        /**设置请求超时时间*/
        
        self.requestSerializer.timeoutInterval = 3;
        
        /**设置相应的缓存策略*/
        
        self.requestSerializer.cachePolicy = NSURLRequestReloadIgnoringLocalCacheData;
        
        /**分别设置请求以及相应的序列化器*/
        self.requestSerializer = [AFHTTPRequestSerializer serializer];
        
//        AFJSONResponseSerializer * response = [AFJSONResponseSerializer serializer];
//        response.removesKeysWithNullValues = YES; //移除json中的空值
        
        self.responseSerializer = [AFHTTPResponseSerializer serializer];
        
        /**复杂的参数类型 需要使用json传值-设置请求内容的类型*/
        [self.requestSerializer setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
        
        
        /**设置apikey ------类似于自己应用中的tokken---此处仅仅作为测试使用*/
        
        //        [self.requestSerializer setValue:apikey forHTTPHeaderField:@"apikey"];
        /**设置接受的类型*/
        [self.responseSerializer setAcceptableContentTypes:[NSSet setWithObjects:@"text/plain",@"application/json",@"text/json",@"text/javascript",@"text/html",@"application/x-www-form-urlencoded", nil]];
        
    }
    
    return self;
}



#pragma mark -  取消所有的网络请求

/**
 *  取消所有的网络请求
 *  a finished (or canceled) operation is still given a chance to execute its completion block before it iremoved from the queue.
 */

+(void)cancelAllRequest
{
    
    [[NetWorkManager sharInstance].operationQueue cancelAllOperations];
    
    
    
}

#pragma mark -   取消指定的url请求/
/**
 *  取消指定的url请求
 *
 *  @param requestType 该请求的请求类型
 *  @param string      该请求的完整url
 */

+(void)cancelHttpRequestWithRequestType:(NSString *)requestType requestUrlString:(NSString *)string
{
    
    NSError * error;
    
    /**根据请求的类型 以及 请求的url创建一个NSMutableURLRequest---通过该url去匹配请求队列中是否有该url,如果有的话 那么就取消该请求*/
    
    NSString * urlToPeCanced = [[[[NetWorkManager sharInstance].requestSerializer requestWithMethod:requestType URLString:string parameters:nil error:&error] URL] path];
    
    
    for (NSOperation * operation in [NetWorkManager sharInstance].operationQueue.operations) {
        
        //如果是请求队列
        if ([operation isKindOfClass:[NSURLSessionTask class]]) {
            
            //请求的类型匹配
            BOOL hasMatchRequestType = [requestType isEqualToString:[[(NSURLSessionTask *)operation currentRequest] HTTPMethod]];
            
            //请求的url匹配
            
            BOOL hasMatchRequestUrlString = [urlToPeCanced isEqualToString:[[[(NSURLSessionTask *)operation currentRequest] URL] path]];
            
            //两项都匹配的话  取消该请求
            if (hasMatchRequestType&&hasMatchRequestUrlString) {
                
                [operation cancel];
                
            }
        }
        
    }
}
@end
