//
//  tools.h
//  MemoryBox
//
//  Created by YangJoe on 10/28/13.
//
//

#import <Foundation/Foundation.h>
#import "Reachability.h"
#import <UIKit/UIKit.h>

@interface tools : NSObject
+(void)saveArray:(NSMutableArray*)array saveKey:(NSString*)key;// 保存对象数组
+(NSMutableArray*)readArray:(NSString*)key;// 读取保存的是数组
+(void)saveObject:(NSObject*)object saveKey:(NSString*)key;// 保存对象
+(NSObject*)readObkect:(NSString*)key;// 读取保存的对象
+(BOOL)isExistenceNetwork;// 判断网络是否存在
-(void)refreshDicsStatus;// 修改词库的状态
-(void)deleteAllData;// 删除所有文件
-(NSString*)CountDays;// 计算天数
+(NSString*)toDate:(NSString*)Chuo;//时间戳转时间
+(NSString*)toDateHour:(NSString*)Chuo;//时间戳转详细时间
+(NSString*)toDateMinute:(NSString*)Chuo;
+(NSString*)toDateFormat:(NSString*)dateString;//时间转时间戳
+ (NSString*)weekdayStringFromDate:(NSDate*)inputDate;
+(NSString*)nowDate;// 获取当前时间
+(NSString*)nowDateInDay;//获得当前日期
+(BOOL)isValidateMobile:(NSString *)mobile;//判断是不是手机号
+(void)showMessage:(NSString *)messageString:(CGRect)frame;// 黑色的消息提醒框
+(NSString *)changeFloat:(NSString *)stringFloat;// 去掉 float后面多余的0
+(UIImage *)scaleImage:(UIImage *)image toScale:(float)scaleSize; // 等比例缩放
+(UIColor*) colorWithHex:(NSInteger)hexValue; // 16进制颜色值转换
+(NSObject*)loadCustomObjectWithKey:(NSString *)key;
+(NSString *)flattenHTML:(NSString *)html;// 清除富文本的网页标签
+(BOOL)isLogin;
@end
