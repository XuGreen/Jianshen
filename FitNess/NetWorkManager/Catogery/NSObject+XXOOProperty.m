//
//  NSObject+XXOOProperty.m
//  YFSoccerC
//
//  Created by Jiang on 16/11/5.
//  Copyright © 2016年 zhyu. All rights reserved.
//

#import "NSObject+XXOOProperty.h"

@implementation NSObject (XXOOProperty)

- (NSMutableDictionary *)request{
    return [self getAllPropertiesAndVaules];
}
/* 获取对象的所有属性名和属性内容 */
- (NSMutableDictionary *)getAllPropertiesAndVaules
{
    NSMutableDictionary *props = [NSMutableDictionary dictionary];
    Class superClass = [self class];
    //获取包括父类中的所有属性
    while (![NSStringFromClass(superClass) isEqualToString:@"NSObject"]) {
        unsigned int outCount, i;
        objc_property_t *properties =class_copyPropertyList([superClass class], &outCount);
        
        for (i = 0; i<outCount; i++)
        {
            objc_property_t property = properties[i];
            const char* char_n = property_getName(property);
            const char* char_a = property_getAttributes(property);
            NSString *propertyName = [NSString stringWithUTF8String:char_n];
            id propertyValue = [self valueForKey:propertyName];
            //如果不为空,进行赋值
            if (propertyValue)
            {
                [props setValue:propertyValue forKey:propertyName];
            }
        }
        free(properties);
        superClass = [superClass superclass];
    }
    return props;
}

//将所有属性赋予初值
- (void)setAllPropertiesIsNotNull{
    Class superClass = [self class];
    //获取包括父类中的所有属性
    while (![NSStringFromClass(superClass) isEqualToString:@"NSObject"]) {
        unsigned int outCount, i;
        objc_property_t *properties =class_copyPropertyList([superClass class], &outCount);
        
        for (i = 0; i<outCount; i++)
        {
            objc_property_t property = properties[i];
            const char* char_n = property_getName(property);
            const char* char_a = property_getAttributes(property);
            NSString *propertyName = [NSString stringWithUTF8String:char_n];
            
            NSString *attributes = [NSString stringWithUTF8String:char_a];
            NSString *typeString = [attributes componentsSeparatedByString:@","].firstObject;
            NSArray *lastArr = [typeString componentsSeparatedByString:@"\""];
            //当为基础数据类型时直接跳过
            if (lastArr.count == 1) {
                continue;
            }
            NSString *valueClassString = lastArr[1];
            id propertyValue = [self valueForKey:propertyName];
            //如果为空,进行赋值
            if (!propertyValue) [self setValue:[[NSClassFromString(valueClassString) alloc]init] forKey:propertyName];
        }
        free(properties);
        superClass = [superClass superclass];
    }
}

/* 获取对象的所有属性 */
- (NSArray *)getAllProperties
{
    u_int count;
    
    objc_property_t *properties  =class_copyPropertyList([self class], &count);
    
    NSMutableArray *propertiesArray = [NSMutableArray arrayWithCapacity:count];
    
    for (int i = 0; i < count ; i++)
    {
        const char* propertyName =property_getName(properties[i]);
        [propertiesArray addObject: [NSString stringWithUTF8String: propertyName]];
    }
    
    free(properties);
    
    return propertiesArray;
}

/* 获取对象的所有方法 */
-(void)getAllMethods
{
    unsigned int mothCout_f =0;
    Method* mothList_f = class_copyMethodList([self class],&mothCout_f);
    for(int i=0;i<mothCout_f;i++)
    {
//        Method temp_f = mothList_f[i];
//        IMP imp_f = method_getImplementation(temp_f);
//        SEL name_f = method_getName(temp_f);
//        const char* name_s =sel_getName(method_getName(temp_f));
//        int arguments = method_getNumberOfArguments(temp_f);
//        const char* encoding =method_getTypeEncoding(temp_f);
//        NSLog(@"方法名：%@,参数个数：%d,编码方式：%@",[NSString stringWithUTF8String:name_s],
//              arguments,
//              [NSString stringWithUTF8String:encoding]);
    }
    free(mothList_f);
}


@end
