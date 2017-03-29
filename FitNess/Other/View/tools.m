//
//  tools.m
//  MemoryBox
//
//  Created by YangJoe on 10/28/13.
//
//

#import "tools.h"

@implementation tools

// 使用 NSUserDefaults 保存数组
+(void)saveArray:(NSMutableArray*)array saveKey:(NSString*)key{
    NSUserDefaults *userDefaultes = [NSUserDefaults standardUserDefaults]; // 初始化 NSUserDefaults
    NSArray * myarray = [[NSArray alloc] initWithArray:array];
    NSData *udObject = [NSKeyedArchiver archivedDataWithRootObject:myarray];
    [userDefaultes setObject:udObject forKey:key];
}

// 使用 NSUserDefaults 读取数组
+(NSMutableArray*)readArray:(NSString*)key{
    NSData *udObject = [[NSUserDefaults standardUserDefaults] objectForKey:key];
    NSArray *myArray = [NSKeyedUnarchiver unarchiveObjectWithData:udObject];
    NSMutableArray *myArray2 =  [NSMutableArray arrayWithArray:myArray];
    return myArray2;
}

// 使用 NSUserDefaults 保存对象
+(void)saveObject:(NSObject*)object saveKey:(NSString*)key{
    NSUserDefaults *userDefaulte = [NSUserDefaults standardUserDefaults]; // 初始化 NSUserDefaults
    [userDefaulte setObject:object forKey:key];
    [userDefaulte synchronize];
}

// 使用 NSUserDefaults 读取对象
+(NSObject*)readObkect:(NSString*)key{
    NSUserDefaults *userDefaulte = [NSUserDefaults standardUserDefaults]; // 初始化 NSUserDefaults
    NSObject *object = [userDefaulte stringForKey:key];
    return object;
}

// 判断网络是否存在
+(BOOL)isExistenceNetwork {
    BOOL isExistenceNetwork = YES;
    Reachability *reach = [Reachability reachabilityWithHostName:@"www.apple.com"];
    switch ([reach currentReachabilityStatus]) {
        case NotReachable:
            isExistenceNetwork = NO;
            //NSLog(@"notReachable");
            break;
        case ReachableViaWiFi:
            isExistenceNetwork = YES;
            //NSLog(@"WIFI");
            break;
        case ReachableViaWWAN:
            isExistenceNetwork = YES;
            //NSLog(@"3G");
            break;
    }
    return isExistenceNetwork;
}

-(NSString*)CountDays{
    //获得系统当前时间
    NSDate *  senddate=[NSDate date];
    NSCalendar  * cal=[NSCalendar  currentCalendar];
    NSUInteger  unitFlags=NSDayCalendarUnit|NSMonthCalendarUnit|NSYearCalendarUnit;
    NSDateComponents * conponent= [cal components:unitFlags fromDate:senddate];
    NSInteger nowMonth=[conponent month];
    NSInteger nowDay=[conponent day];
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    
    //获得上次登录时间
    NSString *lastmoth = [userDefaults stringForKey:@"countmonth"];
    NSString *lastday = [userDefaults stringForKey:@"countdays"];
    
    int oldmonth = [lastmoth intValue];
    int oldday = [lastday intValue];
    
    //计算两次的时间差
    int time = 30*(nowMonth - oldmonth) + (nowDay - oldday);
    NSString *countdays = [[NSString alloc]initWithFormat:@"%d",time];
    
    NSString *savelastday = [[NSString alloc]initWithFormat:@"%ld",(long)nowDay];
    NSString *savelastmonth = [[NSString alloc]initWithFormat:@"%ld",(long)nowMonth];
    
    if (time >= 3) {
        // 保存本次刷新的时间
        [userDefaults setObject:savelastmonth forKey:@"countmonth"];
        [userDefaults setObject:savelastday forKey:@"countdays"];
    }
    
    return countdays;
}

// DATEFORMAT TO DATE
+(NSString*)toDate:(NSString*)Chuo{
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:[Chuo longLongValue]];
    NSDateFormatter *dateFormatter1 = [[NSDateFormatter alloc] init];
    [dateFormatter1 setDateFormat:@"yyyy-MM-dd"];
    NSString *currentDateStr1 = [dateFormatter1 stringFromDate:date];
    return currentDateStr1;
}
// DATEFORMAT TO DATE HOUR AND MINUTES
+(NSString*)toDateHour:(NSString*)Chuo{

    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:@"MM-dd HH:mm:ss"];
    NSTimeZone* timeZone = [NSTimeZone timeZoneWithName:@"Asia/Shanghai"];
    [formatter setTimeZone:timeZone];
    NSDate *confromTimesp = [NSDate dateWithTimeIntervalSince1970:[Chuo longLongValue]];
    NSString *confromTimespStr = [formatter stringFromDate:confromTimesp];
    return confromTimespStr;
}

+(NSString*)toDateMinute:(NSString*)Chuo{
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:@"YYYY-MM-dd HH:mm"];
    NSTimeZone* timeZone = [NSTimeZone timeZoneWithName:@"Asia/Shanghai"];
    [formatter setTimeZone:timeZone];
    NSDate *confromTimesp = [NSDate dateWithTimeIntervalSince1970:[Chuo longLongValue]];
    NSString *confromTimespStr = [formatter stringFromDate:confromTimesp];
    return confromTimespStr;
}

+(NSString*)toDateFormat:(NSString*)dateString{

    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:@"YYYY-MM-dd HH:MM"];
    NSTimeZone* timeZone = [NSTimeZone timeZoneWithName:@"Asia/Shanghai"];
    [formatter setTimeZone:timeZone];
    
    NSDate* date = [formatter dateFromString:dateString];

    NSString *timeSp = [NSString stringWithFormat:@"%ld", (long)[date timeIntervalSince1970]];
    return timeSp;
}

+(NSString*)nowDate{
    NSDate *today = [NSDate date];
    NSDateFormatter *formatter = [[NSDateFormatter  alloc ]  init ];
    [formatter setDateFormat:@"YYYY-MM-dd HH:MM"];
    NSString *todayTime = [formatter stringFromDate:today];
    return todayTime;
}

+(NSString*)nowDateInDay{
    NSDate *today = [NSDate date];
    NSDateFormatter *formatter = [[NSDateFormatter  alloc ]  init ];
    [formatter setDateFormat:@"YYYY-MM-dd"];
    NSString *todayTime = [formatter stringFromDate:today];
    return todayTime;
}

+ (NSString*)weekdayStringFromDate:(NSDate*)inputDate {
    
    NSArray *weekdays = [NSArray arrayWithObjects: [NSNull null], @"周日", @"周一", @"周二", @"周三", @"周四", @"周五", @"周六", nil];
    
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    
    NSTimeZone *timeZone = [[NSTimeZone alloc] initWithName:@"Asia/Shanghai"];
    
    [calendar setTimeZone: timeZone];
    
    NSCalendarUnit calendarUnit = NSWeekdayCalendarUnit;
    
    NSDateComponents *theComponents = [calendar components:calendarUnit fromDate:inputDate];
    
    return [weekdays objectAtIndex:theComponents.weekday];
    
}

// 判断是不是正确的手机号码
+(BOOL) isValidateMobile:(NSString *)mobile{
    //手机号以13， 15，18开头，八个 \d 数字字符
    NSString *phoneRegex = @"^((13[0-9])|(15[^4,\\D])|(18[0,0-9]))\\d{8}$";
    NSPredicate *phoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",phoneRegex];
    //    NSLog(@"phoneTest is %@",phoneTest);
    return [phoneTest evaluateWithObject:mobile];
}

// 黑色的消息提醒框
+(void)showMessage:(NSString *)messageString:(CGRect)frame{
    UIWindow * window = [UIApplication sharedApplication].keyWindow;
    UIView *showview =  [[UIView alloc]init];
    showview.backgroundColor = [UIColor blackColor];
    showview.frame = CGRectMake(1, 1, 1, 1);
    showview.alpha = 0.6f;
    showview.layer.cornerRadius = 3.0f;
    showview.layer.masksToBounds = YES;
    [window addSubview:showview];
    
    UILabel *label = [[UILabel alloc]init];
    CGSize LabelSize = [messageString sizeWithFont:[UIFont systemFontOfSize:17] constrainedToSize:CGSizeMake(290, 9000)];
    label.frame = CGRectMake(10, 5, LabelSize.width, LabelSize.height);
    label.text = messageString;
    label.textColor = [UIColor whiteColor];
    label.textAlignment = 1;
    label.backgroundColor = [UIColor clearColor];
    label.font = [UIFont fontWithName:@"Avenir-Book" size:14];
    [showview addSubview:label];
    showview.frame = CGRectMake((frame.size.width - LabelSize.width - 20)/2, frame.size.height - 100, LabelSize.width+20, LabelSize.height+10);
    [UIView animateWithDuration:2.5 animations:^{
        showview.alpha = 0;
    } completion:^(BOOL finished) {
        [showview removeFromSuperview];
    }];
}

// 去掉 float后面多余的0
+(NSString *)changeFloat:(NSString *)stringFloat{
    NSUInteger length = [stringFloat length];
    for(int i = 1; i<=6; i++){
        NSString *subString = [stringFloat substringFromIndex:length - i];
        if(![subString isEqualToString:@"0"]){
            NSString *subString = [stringFloat substringFromIndex:stringFloat.length - 1];
            if ([subString isEqualToString:@"."]) {
                stringFloat = [stringFloat substringToIndex:stringFloat.length - 1];
            }
            return stringFloat;
        }else{
            stringFloat = [stringFloat substringToIndex:length - i];
        }
    }
    return [stringFloat substringToIndex:length - 7];
}

// 对图片进行缩放
+(UIImage *)scaleImage:(UIImage *)image toScale:(float)scaleSize{
    UIGraphicsBeginImageContext(CGSizeMake(image.size.width * scaleSize, image.size.height * scaleSize));
    [image drawInRect:CGRectMake(0, 0, image.size.width * scaleSize, image.size.height * scaleSize)];
    UIImage *scaledImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return scaledImage;
}

+(UIColor*) colorWithHex:(NSInteger)hexValue{
    return [UIColor colorWithRed:((float)((hexValue & 0xFF0000) >> 16))/255.0
                           green:((float)((hexValue & 0xFF00) >> 8))/255.0
                            blue:((float)(hexValue & 0xFF))/255.0 alpha:1.0];
}

// 获取保持的数组对象
+(NSObject*)loadCustomObjectWithKey:(NSString *)key{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSData *myEncodedObject = [defaults objectForKey:key];
    NSObject *obj = (NSObject *)[NSKeyedUnarchiver unarchiveObjectWithData: myEncodedObject];
    return obj;
}

// 清除富文本的网页标签
+(NSString *)flattenHTML:(NSString *)html{
    NSScanner *theScanner;
    NSString *text = nil;
    theScanner = [NSScanner scannerWithString:html];
    while ([theScanner isAtEnd] == NO) {
        // find start of tag
        [theScanner scanUpToString:@"<" intoString:NULL] ;
        // find end of tag
        [theScanner scanUpToString:@">" intoString:&text] ;
        // replace the found tag with a space
        //(you can filter multi-spaces out later if you wish)
        html = [html stringByReplacingOccurrencesOfString:
                [NSString stringWithFormat:@"%@>", text]
                                               withString:@""];
    } // while //
    return html;
}
+(BOOL)isLogin{
    NSUserDefaults *userDefaultes = [NSUserDefaults standardUserDefaults];
    NSString *apitoken = [userDefaultes stringForKey:@"apitoken"];
    if (apitoken) {
        return YES;
    }else
        return NO;
}
@end
