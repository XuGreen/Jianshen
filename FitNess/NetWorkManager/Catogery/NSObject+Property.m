//
//  NSObject+Property.m
//  property
//
//  Created by jiang on 16/10/22.
//  Copyright © 2016年 jiang. All rights reserved.
//  通过解析字典自动生成属性代码

#import "NSObject+Property.h"

@implementation NSObject (Property)

+ (void)createPropertyCodeWithDict:(NSDictionary *)dict
{
    
    NSMutableString *strM = [NSMutableString string];

    // 遍历字典
    [dict enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull propertyName, id  _Nonnull value, BOOL * _Nonnull stop) {
        //        NSLog(@"%@ %@",propertyName,[value class]);
        NSString *code;
        if ([value isKindOfClass:[NSDictionary class]]) {
            code = [NSString stringWithFormat:@"@property (nonatomic, strong) NSDictionary *%@;",propertyName];
        }else if ( [value isKindOfClass:[NSArray class]]){
            code = [NSString stringWithFormat:@"@property (nonatomic, strong) NSArray *%@;",propertyName];
        }else{
            code = [NSString stringWithFormat:@"@property (nonatomic, copy) NSString *%@;",propertyName];
        }
//        if ([value isKindOfClass:NSClassFromString(@"__NSCFString")]) {
//            code = [NSString stringWithFormat:@"@property (nonatomic, copy) NSString *%@;",propertyName]
//            ;
//        }else if ([value isKindOfClass:NSClassFromString(@"__NSCFNumber")]){
//            code = [NSString stringWithFormat:@"@property (nonatomic, assign) int %@;",propertyName]
//            ;
//        }else if ([value isKindOfClass:NSClassFromString(@"__NSCFArray")]){
//            code = [NSString stringWithFormat:@"@property (nonatomic, strong) NSArray *%@;",propertyName]
//            ;
//        }else if ([value isKindOfClass:NSClassFromString(@"__NSCFDictionary")]){
//            code = [NSString stringWithFormat:@"@property (nonatomic, strong) NSDictionary *%@;",propertyName]
//            ;
//        }else if ([value isKindOfClass:NSClassFromString(@"__NSCFBoolean")]){
//            code = [NSString stringWithFormat:@"@property (nonatomic, assign) BOOL %@;",propertyName]
//            ;
//        }
        [strM appendFormat:@"\n%@\n",code];
        
       
        
    }];
    
     NSLog(@"%@",strM);
   
   
    
}

@end
