//
//  NetWorkManager+UploadImages.m
//  GuangXunCom
//
//  Created by Jiang on 16/11/30.
//  Copyright © 2016年 Jiang. All rights reserved.
//

#import "NetWorkManager+UploadImages.h"
#import "NetWorkManager+GET_POST.h"
#import "UIImage+compressIMG.h"

@implementation NetWorkManager (UploadImages)

+(void)uploadImageWithOperations:(NSDictionary *)operations withImageArray:(NSArray *)imageArray withtargetWidth:(CGFloat )width withUrlString:(NSString *)urlString withSuccessBlock:(requestSuccess)successBlock withFailurBlock:(requestFailure)failureBlock withUpLoadProgress:(uploadProgress)progress;
{
//    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
//    [manager.responseSerializer setAcceptableContentTypes:[NSSet setWithObjects:@"text/plain",@"application/json",@"text/json",@"text/javascript",@"text/html",@"application/x-www-form-urlencoded", nil]];
    [[NetWorkManager sharInstance] POST:urlString parameters:operations constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        
        NSUInteger index = 0 ;
        const  NSString *IMAGEFILE_KEY = @"imageData";
        /**出于性能考虑,将上传图片进行压缩*/
        for (UIImage * image in imageArray) {
            //            image的分类方法
            UIImage *  resizedImage =  [UIImage IMGCompressed:image targetWidth:width];
            NSData * imgData = UIImagePNGRepresentation(resizedImage);
            NSString *fileName = @"random.jpeg"; //文件名由服务器生成,随机数
            //            拼接data
            [formData appendPartWithFileData:imgData name:[IMAGEFILE_KEY copy] fileName:fileName mimeType:@"image/jpeg"];
            index++;
        }
        
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        
        progress((double)uploadProgress.completedUnitCount / (double)uploadProgress.totalUnitCount);
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//        NSData *data = [NSJSONSerialization dataWithJSONObject:responseObject options:NSJSONWritingPrettyPrinted error:nil];
        [NetWorkManager parseResponseWithObject:responseObject success:successBlock failure:failureBlock];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failureBlock(error);
        
    }];
}


@end
