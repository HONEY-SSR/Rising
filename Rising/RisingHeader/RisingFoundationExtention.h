//
//  RisingFoundationExtention.h
//  Rising
//
//  Created by SSR on 2022/7/1.
//

#import <Foundation/Foundation.h>

#ifndef RisingFoundationExtention_h
#define RisingFoundationExtention_h

#pragma mark - RisingLog

/// RisingLogType
typedef NS_ENUM(NSUInteger, RisingLogType) {
    R_defualt = 1,//⚫️
    R_warning,//🟡
    R_error,//🔴
    R_success,//🟢 same of R_OK
    R_uncertain,//🟤
    R_debug//🟣
};

FOUNDATION_EXPORT void RisingTypeLog(RisingLogType R_) NS_NO_TAIL_CALL;

#define RisingLog(R_, format, ...) { \
    RisingTypeLog(R_); \
    NSMutableString *str = NSMutableString.string; \
    [str appendFormat:format, ##__VA_ARGS__]; \
    printf(" %s %s\n", __func__, str.UTF8String); \
}

#pragma mark - Range

NS_INLINE BOOL RangeIsInRange(NSRange range, NSRange anotherRange) {
    return (range.location >= anotherRange.location &&
            NSMaxRange(range) <= NSMaxRange(anotherRange));
}

#endif /* RisingFoundationExtention_h */
