//
//  HSCButton.m
//  AAAA
//
//  Created by zhangmh on 12-7-20.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "ServiceAPI.h"
#import "Constants.h"
#import "HttpUnits.h"

@implementation ServiceAPI

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) 
    {
        self.backgroundColor = [UIColor clearColor];
        
        UIView *backView=[[UIView alloc] initWithFrame:CGRectMake(0,0, SCREENWIDTH,SCREENHEIGHT)];
        backView.backgroundColor = [UIColor whiteColor];
        backView.alpha = 0.7;
        [self addSubview:backView];
        
        
        UIImageView  *logoImage=[[UIImageView alloc] initWithFrame:CGRectMake((SCREENWIDTH-60)/2, (SCREENHEIGHT-60)/2, 60, 60)];
        [logoImage setImage:[UIImage imageNamed:@"load"]];
        [self addSubview:logoImage];
        
        CABasicAnimation* rotationAnimation;
        rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
        rotationAnimation.toValue = [NSNumber numberWithFloat: M_PI * 2.0 ];
        rotationAnimation.duration = 1;
        rotationAnimation.cumulative = YES;
        rotationAnimation.repeatCount = 100;
        [logoImage.layer addAnimation:rotationAnimation forKey:@"rotationAnimation"];
        
    }
    return self;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    
}

-(void)SetGetRequest{
    dispatch_group_t d_group = dispatch_group_create();
    dispatch_queue_t bg_queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    
    __block NSMutableDictionary *responseDictionary;
    dispatch_group_async(d_group, bg_queue, ^{
        responseDictionary = [HttpUnits GetRequestToService:[NSString stringWithFormat:@"%@%@%@",ApiUrl,Version,_url]];
        NSLog(@"%@",[NSString stringWithFormat:@"%@%@%@",ApiUrl,Version,_url]);
    });

    // this if you just want something to happen after those are all done:
    dispatch_group_notify(d_group, dispatch_get_main_queue(), ^{
        if (responseDictionary != nil) {
            [self.delegate RequestSuccess:responseDictionary];
        }else{
            [self.delegate RequestFaild:@""];
        }
    });
    
}

-(void)SetPostRequest:(NSMutableDictionary*)dic{
    self.dic = dic;
    
    dispatch_group_t d_group = dispatch_group_create();
    dispatch_queue_t bg_queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    
    __block NSMutableDictionary *responseDictionary;
    dispatch_group_async(d_group, bg_queue, ^{
        responseDictionary = [HttpUnits PostJsonToService:[NSString stringWithFormat:@"%@%@%@",ApiUrl,Version,_url] RequestJson:self.dic];
    });
    
    // this if you just want something to happen after those are all done:
    dispatch_group_notify(d_group, dispatch_get_main_queue(), ^{
        if (responseDictionary != nil) {
            [self.delegate RequestSuccess:responseDictionary];
        }else{
            [self.delegate RequestFaild:@""];
        }
    });
}

-(void)SetPutRequest:(NSMutableDictionary*)dic{
    self.dic = dic;
    NSThread* myThread = [[NSThread alloc] initWithTarget:self
                                                 selector:@selector(PUT)
                                                   object:nil];
    [myThread start];
}

-(void)GET{
    NSMutableDictionary *responseDictionary = [HttpUnits GetRequestToService:[NSString stringWithFormat:@"%@%@%@",ApiUrl,Version,_url]];
    NSLog(@"%@",[NSString stringWithFormat:@"%@%@",ApiUrl,_url]);
    
    if (responseDictionary != nil) {
        [self.delegate RequestSuccess:responseDictionary];
    }else{
        [self.delegate RequestFaild:@""];
    }
}

-(void)POST{
    NSMutableDictionary *responseDictionary = [HttpUnits PostJsonToService:[NSString stringWithFormat:@"%@%@%@",ApiUrl,Version,_url] RequestJson:self.dic];
    if (responseDictionary != nil) {
        [self.delegate RequestSuccess:responseDictionary];
    }else{
        [self.delegate RequestFaild:@""];
    }
}

-(void)PUT{
    NSMutableDictionary *responseDictionary = [HttpUnits PutRequestToService:[NSString stringWithFormat:@"%@%@%@",ApiUrl,Version,_url] RequestJson:_dic];
    if (responseDictionary != nil) {
        [self.delegate RequestSuccess:responseDictionary];
    }else{
        [self.delegate RequestFaild:@""];
    }
}

@end
