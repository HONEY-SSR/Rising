//
//  RisingFoundationExtention.h
//  Rising
//
//  Created by SSR on 2022/7/1.
//

#import <Foundation/Foundation.h>

#ifndef RisingFoundationExtention_h
#define RisingFoundationExtention_h

FOUNDATION_EXPORT void RisingSingleLog(NSString *format, ...) NS_FORMAT_FUNCTION(1,2) NS_NO_TAIL_CALL;

#pragma mark - Range

NS_INLINE BOOL RangeIsInRange(NSRange range, NSRange anotherRange) {
    return (range.location >= anotherRange.location &&
            NSMaxRange(range) <= NSMaxRange(anotherRange));
}

#endif /* RisingFoundationExtention_h */
