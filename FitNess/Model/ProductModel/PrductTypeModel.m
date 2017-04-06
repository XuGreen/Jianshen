//
//  PrductTypeModel.m
//  FitNess
//
//  Created by xuqq on 2017/4/6.
//  Copyright © 2017年 xuqq. All rights reserved.
//

#import "PrductTypeModel.h"

@implementation PrductTypeModel
@synthesize typeId,name;
- (id) initWithCoder: (NSCoder *)coder {
    if (self=[super init]) {
        self.typeId=[coder decodeObjectForKey:@"id"];
        self.name=[coder decodeObjectForKey:@"name"];
    }
    return self;
}
- (void) encodeWithCoder: (NSCoder *)coder  {
    [coder encodeObject:self.typeId forKey:@"id"];
    [coder encodeObject:self.name forKey:@"name"];
}
@end
