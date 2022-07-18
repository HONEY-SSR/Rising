//
//  RisingType.h
//  Rising
//
//  Created by SSR on 2022/7/17.
//

#import <Foundation/Foundation.h>

#ifndef RisingType_h
#define RisingType_h

#pragma mark - RisingLogType

typedef const char * RisingLogType;

FOUNDATION_EXPORT RisingLogType R_defualt; // ⚪️
FOUNDATION_EXPORT RisingLogType R_success; // 🟢
FOUNDATION_EXPORT RisingLogType R_error;   // 🔴
FOUNDATION_EXPORT RisingLogType R_warn;    // 🟡
FOUNDATION_EXPORT RisingLogType R_debug;   // 🔵
FOUNDATION_EXPORT RisingLogType R_unclear; // 🟣

// 类型不匹配
// 参数缺失
// 参数冲突

#endif /* RisingType_h */
