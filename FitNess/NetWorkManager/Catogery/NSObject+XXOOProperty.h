//
//  NSObject+XXOOProperty.h
//  YFSoccerC
//
//  Created by Jiang on 16/11/5.
//  Copyright © 2016年 zhyu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>

@interface NSObject (XXOOProperty)
- (NSMutableDictionary *)request;
- (void)setAllPropertiesIsNotNull;
@end
