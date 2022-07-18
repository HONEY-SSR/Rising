//
//  RisingFoundationExtention.h
//  Rising
//
//  Created by SSR on 2022/7/1.
//

#import <Foundation/Foundation.h>

#import "RisingType.h"

#ifndef RisingFoundationExtention_h
#define RisingFoundationExtention_h

FOUNDATION_EXPORT void RisingDetailLog(NSString *format, ...) NS_FORMAT_FUNCTION(1,2) NS_NO_TAIL_CALL;

FOUNDATION_EXPORT void RisingDebugLog(RisingLogType type, NSString *format, ...) NS_FORMAT_FUNCTION(2,3) NS_NO_TAIL_CALL;

#define RisingLog(R_, format, ...) RisingDebugLog(R_, @"%s %@", __func__, [NSString stringWithFormat:format, ##__VA_ARGS__]);

#pragma mark - Range

NS_INLINE BOOL RangeIsInRange(NSRange range, NSRange anotherRange) {
    return (range.location >= anotherRange.location &&
            NSMaxRange(range) <= NSMaxRange(anotherRange));
}

#endif /* RisingFoundationExtention_h */
