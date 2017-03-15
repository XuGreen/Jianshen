//
//  HSCButton.h
//  AAAA
//
//  Created by zhangmh on 12-7-20.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//
/*
其实,
 */
#import <UIKit/UIKit.h>
#import "XYSpriteHelper.h"
#import "Constants.h"
@protocol ServiceAPIDelegate <NSObject>

- (void)RequestFaild:(NSString*)url;
- (void)RequestSuccess:(NSMutableDictionary*)ResultString;

@end

@interface ServiceAPI : UIView<XYSpriteDelegate>
{
}

-(void)SetGetRequest;
-(void)SetPostRequest:(NSMutableDictionary*)dic;
-(void)SetPutRequest:(NSMutableDictionary*)dic;

@property (nonatomic, retain) id <ServiceAPIDelegate> delegate;

@property (nonatomic, retain) NSString *url;
@property (nonatomic, retain) NSMutableDictionary *dic;

@end
