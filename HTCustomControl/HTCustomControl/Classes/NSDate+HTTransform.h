//
//  NSDate+HTTransform.h
//  HTCustomControl
//
//  Created by Henry on 2019/3/8.
//  Copyright © 2019 Henry. All rights reserved.
//

#import <Foundation/Foundation.h>

#define MM                  @"MM"
#define MMM                 @"MMM" // 如果是中文环境: '4月', 英文: 'APR'
#define YYYY                @"yyyy"
#define YYYY_MM             @"yyyy-MM"
#define HH_MM               @"HH:mm"
#define MM_DD               @"MM/dd"
#define YY_MM               @"yy-MM"
#define YY_MM_DD            @"yy-MM-dd"
#define YYYY_MM_DD          @"yyyy-MM-dd"
#define YY_MM_DD_HH_MM      @"yy-MM-dd HH:mm"
#define YYYY_MM_DD_HH_MM    @"yyyy-MM-dd HH:mm"
#define YYYY_MM_DD_HH_MM_SS @"yyyy-MM-dd HH:mm:ss"

NS_ASSUME_NONNULL_BEGIN

@interface NSDate (HTTransform)

/// 时间 Date
/**
 Date -> 时间戳字符串
 
 @return 时间戳字符串 毫秒 13位
 */
- (NSString *)timestamp;


/**
 Date -> 日期字符串
 
 @return yy-MM-dd
 */
- (NSString *)dateString;

/**
 Date -> 时间字符串 到分钟
 
 @return yyyy-MM-dd HH:mm
 */
- (NSString *)timeString;

/**
 Date -> 时间字符串
 
 @param formatter 时间格式 默认：yyyy-MM-dd HH:mm
 @return yyyy-MM-dd HH:mm
 */
- (NSString *)timeStringWithFormatter:(nullable NSString *)formatter;


/// 时间戳

/**
 时间戳 -> Date
 
 @param timestamp 时间戳
 @return Date
 */
+ (NSDate *)dateWithTimestamp:(NSString *)timestamp;


/**
 时间戳 -> 日期字符串
 
 @param timestamp 时间戳
 @return yyyy-MM-dd
 */
+ (nullable NSString *)dateStringWithTimestamp:(NSString *)timestamp;

/**
 时间戳 -> 时间字符串 分钟
 
 @param timestamp 时间戳
 @return yyyy-MM-dd HH:mm
 */
+ (nullable NSString *)timeStringWithTimestamp:(NSString *)timestamp;

/**
 时间戳 -> Date -> 时间字符串
 
 @param timestamp 时间戳 秒(10位) 毫秒(13位)
 @param formatter 时间格式 默认：yyyy-MM-dd HH:mm
 @return yyyy-MM-dd HH:mm
 */
+ (nullable NSString *)timeStringWithTimestamp:(NSString *)timestamp formatter:(nullable NSString *)formatter;


/// 字符串

/**
 时间字符串 -> 时间Date 根据字符串长度判断时间格式
 
 @param timeString 时间字符串
 @return Date
 */
+ (NSDate *)dateWithTimeString:(NSString *)timeString;

/**
 时间字符串 -> 时间Date
 
 @param timeString 时间字符串 格式与formatter对应
 @param formatter 时间格式 默认：yyyy-MM-dd HH:mm
 @return Date
 */
+ (NSDate *)dateWithTimeString:(NSString *)timeString formatter:(nullable NSString *)formatter;


/**
 时间字符串 -> Date -> 时间戳（毫秒） 根据字符串长度判断时间格式
 
 @param timeString 时间字符串
 @return 时间戳
 */
+ (NSString *)timestampWithTimeString:(NSString *)timeString;

/**
 时间字符串 -> 时间戳（毫秒）
 
 @param timeString 时间字符串
 @param formatter 格式
 @return 时间戳（毫秒）13位
 */
+ (NSString *)timestampWithTimeString:(NSString *)timeString formatter:(nullable NSString *)formatter;

@end

NS_ASSUME_NONNULL_END
