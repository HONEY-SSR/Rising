//
//  RisingHeader.h
//  Rising
//
//  Created by SSR on 2022/7/1.
//

#import <Foundation/Foundation.h>

#ifndef RisingHeader_h
#define RisingHeader_h

#pragma mark - RisingLog

/// RisingLogType
typedef NS_ENUM(NSUInteger, RisingLogType) {
    R_defualt = 1,//⚫️
    R_success,//🟢 same of R_OK
    R_warning,//🟡
    R_error,//🔴
    R_uncertain,//🟤
    R_debug//🟣
};

/// RisingLog
#define RisingLog(R_, __func, format, ...) { \
    RisingDetailLog(R_, __func); \
    printf("%s\n", [NSString stringWithFormat:format, ##__VA_ARGS__].UTF8String); \
}

/// RisingDetailLog
FOUNDATION_EXPORT void RisingDetailLog(RisingLogType R_, const char *__func);

#pragma mark - Range

NS_INLINE BOOL RangeIsInRange(NSRange range, NSRange anotherRange) {
    return (range.location >= anotherRange.location &&
            NSMaxRange(range) <= NSMaxRange(anotherRange));
}

#endif /* RisingHeader_h */
