//
//  NSDate+HTUtils.m
//  HTCustomControl
//
//  Created by Henry on 2019/3/8.
//  Copyright © 2019 Henry. All rights reserved.
//

#import "NSDate+HTUtils.h"
#import "NSDate+HTTransform.h"

@implementation NSDate (HTUtils)

- (NSInteger)year {
    return [[[NSCalendar currentCalendar] components:NSCalendarUnitYear fromDate:self] year];
}

- (NSInteger)month {
    return [[[NSCalendar currentCalendar] components:NSCalendarUnitMonth fromDate:self] month];
}

- (NSInteger)day {
    return [[[NSCalendar currentCalendar] components:NSCalendarUnitDay fromDate:self] day];
}


+ (NSArray *)getAllWeekDate:(NSInteger)year {
    NSDate *nowDate = [NSDate date];
    if (year != 0) {
        NSString *str = [NSString stringWithFormat:@"%ld0101", year];
        NSString *farmatter = @"yyyyMMdd";
        
        nowDate = [self dateWithTimeString:str formatter:farmatter];
    }
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    NSDateComponents *comp = [calendar components: NSCalendarUnitWeekday | NSCalendarUnitWeekOfYear fromDate:nowDate];
    
    // 获取今天是周几 (周一是2，周日是1)
    
    NSInteger weekDay = [comp weekday];
    
    // 这周是今年的第几周(注意：第一周编号为1不为0)
    
    NSInteger weekOfYear = [comp weekOfYear];
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    
    [formatter setDateFormat:@"yyyyMMdd"];
    
    NSDate *date = [formatter dateFromString:[formatter stringFromDate:nowDate]];
    
    // 这周的开始和结束时间 （注意：+1 -1 避开临界值）
    
    NSDate *startdate = [date dateByAddingTimeInterval:24*3600*(2 - weekDay)+1];
    
    NSDate *enddate = [date dateByAddingTimeInterval:24*3600*(9 - weekDay)-1];
    
    NSMutableArray *dateArray = [[[NSMutableArray alloc] init] mutableCopy];
    
    // 一年52周  获取一年的所有周一和周日的日期(注意：第一周编号为1不为0)
    
    for (int i = 1; i <= 52; i++) {
        
        NSDate *startdate1 = [startdate dateByAddingTimeInterval:24*3600*7*(i-weekOfYear)];
        
        NSDate *enddate1 = [enddate dateByAddingTimeInterval:24*3600*7*(i-weekOfYear)];
        
        [dateArray addObject:@[startdate1, enddate1]];
        
    }
    
    return dateArray;
}

+ (NSInteger)getWeakNumForDate:(NSDate *)currentDate {
    if (!currentDate) {
        currentDate = [NSDate date];
    }
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSInteger week = [calendar ordinalityOfUnit:NSCalendarUnitWeekday inUnit:NSCalendarUnitYear forDate:currentDate];
    return week;
}

+ (NSArray *)getWeekTime:(NSDate *)nowDate {
    return [self getWeekTime:nowDate formatter:@"yyyy-MM-dd"];
}

+ (NSArray *)getWeekTime:(NSDate *)nowDate formatter:(nullable NSString *)formattor {
    NSMutableArray *weekArray = [NSMutableArray arrayWithCapacity:7];
    
    if (nowDate == nil) {
        nowDate = [NSDate date];
    }
    if (formattor.length == 0) {
        formattor = @"yyyy-MM-dd";
    }
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *comp = [calendar components:NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitWeekday fromDate:nowDate];
    // 获取今天是周几
    // 1(星期天) 2(星期一) 3(星期二) 4(星期三) 5(星期四) 6(星期五) 7(星期六)
    NSInteger weekDay = [comp weekday];
    
    // 获取几天是几号
    NSInteger day = [comp day];
    
    if (weekDay == 1) {
        for (int i = 7; i >= 1; i --) {
            // 在当前日期(去掉时分秒)基础上加上差的天数
            NSDateComponents *weekComp = [calendar components:NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay  fromDate:nowDate];
            
            //由于weekDay是一周的最后一天，所以减去7得到周一
            [weekComp setDay:day + (weekDay - i)];
            NSDate *dayOfWeek = [calendar dateFromComponents:weekComp];
            
            NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
            [formatter setDateFormat:formattor];
            
            NSString *dayString = [formatter stringFromDate:dayOfWeek];
            [weekArray addObject:dayString];
        }
    } else {
        for (int i = 2; i <= 8; i ++) {
            NSDateComponents *weekComp = [calendar components:NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay  fromDate:nowDate];
            [weekComp setDay:day + (i - weekDay)];
            NSDate *dayOfWeek = [calendar dateFromComponents:weekComp];
            
            NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
            [formatter setDateFormat:formattor];
            
            NSString *dayString = [formatter stringFromDate:dayOfWeek];
            [weekArray addObject:dayString];
        }
    }
    return weekArray;
}

@end
