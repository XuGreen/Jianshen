//
//  NSObject+HttpUnits.h
//  Libs
//
//  Created by Yang Joe on 12/9/14.
//  Copyright (c) 2014 Yang Joe. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SBJson.h"

@interface HttpUnits: NSObject

+(NSMutableDictionary*)PostJsonToService:(NSString*) url RequestJson:(NSMutableDictionary*)dic;// POST REQUEST METHOD
+(NSMutableDictionary*)GetRequestToService:(NSString*)url;// GET REQUEST METHOD
+(NSMutableDictionary*)GetRequestWithHeader:(NSString*)url;//GET REQUEST WITH HEADER
+(NSMutableDictionary*)GetRequestWithSimpleRespone:(NSString*)url;//GET RESPONSE WITH SIMPLE RESPONSE
+(NSMutableDictionary*)PutRequestToService:(NSString*)url RequestJson:(NSMutableDictionary*)dic;// PUT REQUEST METHOD
+(NSMutableDictionary*)DeleteRequestWithHeader:(NSString*)url;
+(NSMutableDictionary*)DELETEJsonToService:(NSString*) url RequestJson:(NSMutableDictionary*)dic;
@end
