//
//  ResponseBase.h
//  MedicalCare
//
//  Created by liujiang on 16/5/16.
//  Copyright © 2016年 Yang Joe. All rights reserved.
//

#import <JSONModel/JSONModel.h>
@interface ResponseBase : JSONModel


/**
 * 网络请求是否成功
 */
- (BOOL)isSuccess;

@end
