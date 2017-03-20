//
//  NetWorkManager+UploadVideo.h
//  GuangXunCom
//
//  Created by Jiang on 16/11/30.
//  Copyright © 2016年 Jiang. All rights reserved.
//

#import "NetWorkManager.h"

@interface NetWorkManager (UploadVideo)
/**
 *  视频上传
 *
 *  @param operations   上传视频预留参数---视具体情况而定 可移除
 *  @param videoPath    上传视频的本地沙河路径
 *  @param urlString     上传的url
 *  @param successBlock 成功的回调
 *  @param failureBlock 失败的回调
 *  @param progress     上传的进度
 */

+(void)uploadVideoWithOperaitons:(NSDictionary *)operations
                   withVideoPath:(NSString *)videoPath
                   withUrlString:(NSString *)urlString
                withSuccessBlock:(requestSuccess)successBlock
                withFailureBlock:(requestFailure)failureBlock
              withUploadProgress:(uploadProgress)progress;

@end
