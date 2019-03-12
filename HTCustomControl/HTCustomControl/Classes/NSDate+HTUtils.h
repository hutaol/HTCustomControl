//
//  NSDate+HTUtils.h
//  HTCustomControl
//
//  Created by Henry on 2019/3/8.
//  Copyright © 2019 Henry. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSDate (HTUtils)

- (NSInteger)year;

- (NSInteger)month;

- (NSInteger)day;

/**
 获取全年所有周的周一和周日

 @param year 0=今年
 @return [周一, 周日]
 */
+ (NSArray *)getAllWeekDate:(NSInteger)year;

/**
 当前当前日期是今年的第几周

 @param currentDate Date
 @return 第几周
 */
+ (NSInteger)getWeakNumForDate:(NSDate *)currentDate;


/**
 获取周一至周日对应日期

 @param nowDate Date
 @param formattor 格式：yyyy-MM-dd
 @return [周一,,,,,,,] <Date>
 */
+ (NSArray *)getWeekTime:(NSDate *)nowDate formatter:(nullable NSString *)formattor;
+ (NSArray *)getWeekTime:(NSDate *)nowDate;


@end

NS_ASSUME_NONNULL_END
