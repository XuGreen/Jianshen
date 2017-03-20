//
//  NetWorkManager+UploadImages.h
//  GuangXunCom
//
//  Created by Jiang on 16/11/30.
//  Copyright © 2016年 Jiang. All rights reserved.
//

#import "NetWorkManager.h"

@interface NetWorkManager (UploadImages)

/**
 *  上传图片
 *
 *  @param operations   上传图片预留参数---视具体情况而定 可移除
 *  @param imageArray   上传的图片数组
 *  @parm width      图片要被压缩到的宽度
 *  @param urlString    上传的url
 *  @param successBlock 上传成功的回调
 *  @param failureBlock 上传失败的回调
 *  @param progress     上传进度
 */

+ (void)uploadImageWithOperations:(NSDictionary *)operations
                   withImageArray:(NSArray *)imageArray
                  withtargetWidth:(CGFloat )width
                    withUrlString:(NSString *)urlString
                 withSuccessBlock:(requestSuccess)successBlock
                  withFailurBlock:(requestFailure)failureBlock
               withUpLoadProgress:(uploadProgress)progress;

@end
