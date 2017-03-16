//
//  NSString+MD5.m
//  FitNess
//
//  Created by xuqq on 2017/3/16.
//  Copyright © 2017年 xuqq. All rights reserved.
//

#import "NSString+MD5.h"
#import <CommonCrypto/CommonCrypto.h>

@implementation NSString (MD5)
- (NSString *)stringToMD5:(NSString *)str{
    //首先将字符串转换成 UTF-8编码，因为 MD5加密是基于 c 语言的所有要先把字符串转化成 c语言的字符串
    const  char *footData=[str UTF8String];
    //然后创建一个字符串数组，接受 MD5的值
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    //计算 MD5的值，这是官方封装好的加密方法，把我们输入的字符串转换成16进制的32位数，然后存储到 result 中
    CC_MD5(footData, (CC_LONG)strlen(footData), result);
    /*
     第一个参数:要加密的字符串
     第二个参数：获取要加密字符串的长度
     第三个参数:接受结果的数组
     */
    //创建一个字符串保存加密结果
    NSMutableString *saveResult=[NSMutableString string];
    //从 result 数组中获取加密结果并放到 saveResult 中
    for (int i=0; i<CC_MD5_DIGEST_LENGTH; i++) {
        [saveResult appendFormat:@"%02x",result[i]];
    }
    /*
     x表示十六进制，%02X  意思是不足两位将用0补齐，如果多余两位则不影响
     NSLog("%02X", 0x888);  //888
     NSLog("%02X", 0x4); //04
     */
    return saveResult;
}
@end
