//
//  NSDate+HTTransform.m
//  HTCustomControl
//
//  Created by Henry on 2019/3/8.
//  Copyright © 2019 Henry. All rights reserved.
//

#import "NSDate+HTTransform.h"

@implementation NSDate (HTTransform)

- (NSString *)timestamp {
    if (!self) return @"";
    NSTimeInterval time = [self timeIntervalSince1970] * 1000;// *1000 是精确到毫秒，不乘就是精确到秒
    NSString *timeString = [NSString stringWithFormat:@"%.0f", time];
    return timeString;
}

- (NSString *)dateString {
    return [self timeStringWithFormatter:YYYY_MM_DD];
}

- (NSString *)timeString {
    return [self timeStringWithFormatter:nil];
}

- (NSString *)timeStringWithFormatter:(NSString *)formatter {
    if (!self) return nil;
    
    if (!formatter || formatter.length == 0) {
        formatter = YYYY_MM_DD_HH_MM;
    }
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:formatter];
    return [dateFormatter stringFromDate:self];
}


+ (NSDate *)dateWithTimestamp:(NSString *)timestamp {
    NSInteger tt = [timestamp integerValue];
    
    // 毫秒 /1000
    if (timestamp.length == 13) {
        tt = tt / 1000;
    }
    return [NSDate dateWithTimeIntervalSince1970:tt];
}


+ (NSString *)dateStringWithTimestamp:(NSString *)timestamp {
    return [self timeStringWithTimestamp:timestamp formatter:YYYY_MM_DD];
}

+ (NSString *)timeStringWithTimestamp:(NSString *)timestamp {
    return [self timeStringWithTimestamp:timestamp formatter:YYYY_MM_DD_HH_MM];
}

+ (NSString *)timeStringWithTimestamp:(NSString *)timestamp formatter:(NSString *)formatter {
    if (timestamp || timestamp.length == 0) {
        return @"";
    }
    
    NSDate *date = [self dateWithTimestamp:timestamp];
    return [date timeStringWithFormatter:nil];
}


+ (NSDate *)dateWithTimeString:(NSString *)timeString {
    return [self dateWithTimeString:timeString formatter:nil];
}

+ (NSDate *)dateWithTimeString:(NSString *)timeString formatter:(NSString *)formatter {
    if (!formatter || formatter.length == 0) {
        // TODO 默认：根据字符串长度判断时间格式
        if (timeString.length == 4) {
            formatter = YYYY;
        } else if (timeString.length == 5) {
            formatter = YY_MM;
        } else if (timeString.length == 7) {
            formatter = YYYY_MM;
        } else if (timeString.length == 8) {
            formatter = YY_MM_DD;
        } else if (timeString.length == 10) {
            formatter = YYYY_MM_DD;
        } else if (timeString.length == 14) {
            formatter = YY_MM_DD_HH_MM;
        } else if (timeString.length == 16) {
            formatter = YYYY_MM_DD_HH_MM;
        } else if (timeString.length == 19) {
            formatter = YYYY_MM_DD_HH_MM_SS;
        } else {
            formatter = @"";
        }
    }
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:formatter];
    NSDate *date= [dateFormatter dateFromString:timeString];
    return date;
}


+ (NSString *)timestampWithTimeString:(NSString *)timeString {
    return [self timestampWithTimeString:timeString formatter:nil];
}

+ (NSString *)timestampWithTimeString:(NSString *)timeString formatter:(NSString *)formatter {
    NSDate *date = [self dateWithTimeString:timeString formatter:formatter];
    return [date timestamp];
}

@end
