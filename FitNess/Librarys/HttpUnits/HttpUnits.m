//
//  NSObject+HttpUnits.m
//  Libs
//
//  Created by Yang Joe on 12/9/14.
//  Copyright (c) 2014 Yang Joe. All rights reserved.
//

#import "HttpUnits.h"
#import "tools.h"

@implementation HttpUnits

//POST REQUEST MOTHED
+(NSMutableDictionary*)PostJsonToService:(NSString*) url RequestJson:(NSMutableDictionary*)dic{
    NSString*JSONString = [dic JSONRepresentation];
    NSURL*dataURL=[NSURL URLWithString:url];
    NSData*postData = [JSONString dataUsingEncoding:NSUTF8StringEncoding allowLossyConversion:YES];
    NSString*postLength = [NSString stringWithFormat:@"%lu", (unsigned long)[postData length]];
    NSMutableURLRequest*requestPOST = [[NSMutableURLRequest alloc] init];
    [requestPOST setURL:dataURL];
    [requestPOST setHTTPMethod:@"POST"];
    [requestPOST setHTTPShouldHandleCookies:YES];
    [requestPOST setValue:postLength forHTTPHeaderField:@"Content-Length"];
    [requestPOST setValue:@"application/json"forHTTPHeaderField:@"Content-Type"];
    
    NSUserDefaults *userDefaultes = [NSUserDefaults standardUserDefaults];
    NSString *apitoken = [userDefaultes stringForKey:@"apitoken"];
    [requestPOST setValue:apitoken forHTTPHeaderField:@"Access-Token"];
    
    [requestPOST setHTTPBody:postData];
    
    NSHTTPURLResponse* urlResponse = nil;
    NSData*data=[NSURLConnection sendSynchronousRequest:requestPOST returningResponse:&urlResponse error:nil];
    long statusCode = [urlResponse statusCode];
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    if ([[urlResponse allHeaderFields] objectForKey:@"access-token"] != nil) {
        [userDefaults setObject:[[urlResponse allHeaderFields] objectForKey:@"access-token"] forKey:@"apitoken"];
    }
    
    NSString*dataContent = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
    
    if ([dataContent JSONValue]) {
        NSMutableDictionary*items = [[NSMutableDictionary alloc]init];
        [items setObject:[dataContent JSONValue] forKey:@"response"];
        NSString*code = [NSString stringWithFormat:@"%ld",statusCode];
        [items setObject:code forKey:@"stateCode"];
        return items;
    }else{
        NSMutableDictionary * mutableDictionary = [NSMutableDictionary dictionaryWithCapacity:5];
        NSString*code = [NSString stringWithFormat:@"%ld",statusCode];
        [mutableDictionary setObject:code forKey:@"stateCode"];
        [mutableDictionary setObject:dataContent forKey:@"errors"];
        return mutableDictionary;
    }
}

// GET REQUEST MOTHED
+(NSMutableDictionary*)GetRequestToService:(NSString*)url{
    if ([tools isExistenceNetwork]) {
        url = [url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        NSURL *nsurl = [NSURL URLWithString:url];
        NSURLRequest *request = [[NSURLRequest alloc]initWithURL:nsurl cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:10];
        
        NSUserDefaults *userDefaultes = [NSUserDefaults standardUserDefaults];
        NSString *apitoken = [userDefaultes stringForKey:@"apitoken"];
        NSMutableURLRequest *mutableRequest = [request mutableCopy];
        [mutableRequest addValue:apitoken forHTTPHeaderField:@"Access-Token"];
        request = [mutableRequest copy];
        
        NSHTTPURLResponse* urlResponse = nil;
        NSData *reponse = [NSURLConnection sendSynchronousRequest:request returningResponse:&urlResponse error:nil];
        long statusCode = [urlResponse statusCode];
        
        NSString *responseString = [[NSString alloc]initWithData:reponse encoding:NSUTF8StringEncoding];
        NSMutableDictionary*dic = [responseString JSONValue];// change response data to 'dictionary' format
        
        if ([responseString JSONValue]) {
            NSMutableDictionary*items = [[NSMutableDictionary alloc]init];
            [items setObject:[responseString JSONValue] forKey:@"response"];
            NSString*code = [NSString stringWithFormat:@"%ld",statusCode];
            [items setObject:code forKey:@"stateCode"];
            return items;
        }else{
            return dic;
        }
    }else{
//        UIAlertView *alter = [[UIAlertView alloc] initWithTitle:@"网络提醒" message:@"很抱歉，耽误您宝贵的时间" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil,nil];
//        [alter show];
        return nil;
    }
    
}

// GET REQUEST MOTHED
+(NSMutableDictionary*)GetRequestWithSimpleRespone:(NSString*)url{
    url = [url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSURL *nsurl = [NSURL URLWithString:url];
    NSURLRequest *request = [[NSURLRequest alloc]initWithURL:nsurl cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:10];
    
    NSUserDefaults *userDefaultes = [NSUserDefaults standardUserDefaults];
    NSString *apitoken = [userDefaultes stringForKey:@"apitoken"];
    NSMutableURLRequest *mutableRequest = [request mutableCopy];
    [mutableRequest addValue:apitoken forHTTPHeaderField:@"Access-Token"];
    request = [mutableRequest copy];
    
    NSHTTPURLResponse* urlResponse = nil;
    NSData *reponse = [NSURLConnection sendSynchronousRequest:request returningResponse:&urlResponse error:nil];
    long statusCode = [urlResponse statusCode];
    
    NSMutableDictionary*items = [[NSMutableDictionary alloc]init];
    NSString*code = [NSString stringWithFormat:@"%ld",statusCode];
    [items setObject:code forKey:@"stateCode"];
    return items;
}

// GET MOTHED WITH HEADER
+(NSMutableDictionary*)GetRequestWithHeader:(NSString*)url{
    url = [url stringByAddingPercentEscapesUsingEncoding: NSUTF8StringEncoding];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setURL:[NSURL URLWithString: url]];
    [request setCachePolicy:NSURLRequestReloadIgnoringCacheData];
    [request setTimeoutInterval: 60];
    [request setHTTPShouldHandleCookies:FALSE];
    [request setHTTPMethod:@"GET"];
    // ADD API TOKEN IF THERE HAVE ONE
    NSUserDefaults *userDefaultes = [NSUserDefaults standardUserDefaults];
    NSString *apitoken = [userDefaultes stringForKey:@"apitoken"];
    [request setValue:apitoken forHTTPHeaderField:@"Access-Token"];
    NSHTTPURLResponse *response;
    NSData *returnData = [NSURLConnection sendSynchronousRequest:request
                                               returningResponse:&response error:nil];
    NSString *strReturn = [[NSString alloc] initWithData:returnData encoding:NSUTF8StringEncoding];
    NSMutableDictionary*dic = [strReturn JSONValue];// change response data to 'dictionary'
    return dic;
}

// PUT REQUEST METHOD
+(NSMutableDictionary*)PutRequestToService:(NSString*)url RequestJson:(NSMutableDictionary*)dic
{
    NSURL *nsurl = [NSURL URLWithString:url];
    NSString*JSONString = [dic JSONRepresentation];
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:nsurl];
    // set rerquest method
    [request setHTTPMethod:@"PUT"];
    // NOTICE: must add this to send params for PUT request
    [request addValue:@"application/json" forHTTPHeaderField:@"Content-type"];
    
    NSUserDefaults *userDefaultes = [NSUserDefaults standardUserDefaults];
    NSString *apitoken = [userDefaultes stringForKey:@"apitoken"];
    NSLog(@"%@",apitoken);
    [request setValue:apitoken forHTTPHeaderField:@"Access-Token"];
    
    [request setHTTPBody:[JSONString dataUsingEncoding:NSUTF8StringEncoding]];
    
    NSHTTPURLResponse *response;
    NSError *err;
    NSData *responseData = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&err];
    NSString *responseString = [[NSString alloc] initWithData:responseData encoding:NSUTF8StringEncoding];
    NSMutableDictionary *data = [responseString JSONValue]; //parsed by SBJson
    
    long statusCode = [response statusCode];
//    NSString*code = [NSString stringWithFormat:@"%ld",statusCode];
//    [data setObject:code forKey:@"stateCode"];
//    if (data) {
//        return data;
//    }else{
//        NSMutableDictionary * mutableDictionary = [NSMutableDictionary dictionaryWithCapacity:5];
//        NSString*code = [NSString stringWithFormat:@"%ld",statusCode];
//        [mutableDictionary setObject:code forKey:@"stateCode"];
//        [mutableDictionary setObject:responseString forKey:@"errors"];
//        return mutableDictionary;
//    }
    
    
    if ([responseString JSONValue]) {
        NSMutableDictionary*items = [[NSMutableDictionary alloc]init];
        [items setObject:[responseString JSONValue] forKey:@"response"];
        NSString*code = [NSString stringWithFormat:@"%ld",statusCode];
        [items setObject:code forKey:@"stateCode"];
        return items;
    }else{
        return dic;
    }
    
    return data;
}

// DELETE MOTHED
+(NSMutableDictionary*)DeleteRequestWithHeader:(NSString*)url{
    url = [url stringByAddingPercentEscapesUsingEncoding: NSUTF8StringEncoding];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setURL:[NSURL URLWithString: url]];
    [request setCachePolicy:NSURLRequestReloadIgnoringCacheData];
    [request setTimeoutInterval: 60];
    [request setHTTPShouldHandleCookies:FALSE];
    [request setHTTPMethod:@"DELETE"];
    // ADD API TOKEN IF THERE HAVE ONE
    NSUserDefaults *userDefaultes = [NSUserDefaults standardUserDefaults];
    NSString *apitoken = [userDefaultes stringForKey:@"apitoken"];
    [request setValue:apitoken forHTTPHeaderField:@"Access-Token"];
    NSHTTPURLResponse *response;
    NSData *returnData = [NSURLConnection sendSynchronousRequest:request
                                               returningResponse:&response error:nil];
    long statusCode = [response statusCode];
    NSString *strReturn = [[NSString alloc] initWithData:returnData encoding:NSUTF8StringEncoding];

    
    if ([strReturn JSONValue]) {
        NSMutableDictionary*items = [[NSMutableDictionary alloc]init];
        [items setObject:[strReturn JSONValue] forKey:@"response"];
        NSString*code = [NSString stringWithFormat:@"%ld",statusCode];
        [items setObject:code forKey:@"stateCode"];
        return items;
    }else{
        return nil;
    }
}

//POST REQUEST MOTHED
+(NSMutableDictionary*)DELETEJsonToService:(NSString*) url RequestJson:(NSMutableDictionary*)dic{
    NSString*JSONString = [dic JSONRepresentation];
    NSURL*dataURL=[NSURL URLWithString:url];
    NSData*postData = [JSONString dataUsingEncoding:NSUTF8StringEncoding allowLossyConversion:YES];
    NSString*postLength = [NSString stringWithFormat:@"%lu", (unsigned long)[postData length]];
    NSMutableURLRequest*requestPOST = [[NSMutableURLRequest alloc] init];
    [requestPOST setURL:dataURL];
    [requestPOST setHTTPMethod:@"DELETE"];
    [requestPOST setHTTPShouldHandleCookies:YES];
    [requestPOST setValue:postLength forHTTPHeaderField:@"Content-Length"];
    [requestPOST setValue:@"application/json"forHTTPHeaderField:@"Content-Type"];
    
    NSUserDefaults *userDefaultes = [NSUserDefaults standardUserDefaults];
    NSString *apitoken = [userDefaultes stringForKey:@"apitoken"];
    [requestPOST setValue:apitoken forHTTPHeaderField:@"Access-Token"];
    
    [requestPOST setHTTPBody:postData];
    
    NSHTTPURLResponse* urlResponse = nil;
    NSData*data=[NSURLConnection sendSynchronousRequest:requestPOST returningResponse:&urlResponse error:nil];
    long statusCode = [urlResponse statusCode];
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    if ([[urlResponse allHeaderFields] objectForKey:@"Access-Token"] != nil) {
        [userDefaults setObject:[[urlResponse allHeaderFields] objectForKey:@"Access-Token"] forKey:@"apitoken"];
    }
    
    NSString*dataContent = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
    
    if ([dataContent JSONValue]) {
        NSMutableDictionary*items = [[NSMutableDictionary alloc]init];
        [items setObject:[dataContent JSONValue] forKey:@"response"];
        NSString*code = [NSString stringWithFormat:@"%ld",statusCode];
        [items setObject:code forKey:@"stateCode"];
        return items;
    }else{
        NSMutableDictionary * mutableDictionary = [NSMutableDictionary dictionaryWithCapacity:5];
        NSString*code = [NSString stringWithFormat:@"%ld",statusCode];
        [mutableDictionary setObject:code forKey:@"stateCode"];
        [mutableDictionary setObject:dataContent forKey:@"errors"];
        return mutableDictionary;
    }
}


@end
