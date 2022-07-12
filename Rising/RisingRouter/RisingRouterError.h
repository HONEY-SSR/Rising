//
//  RisingRouterError.h
//  Rising
//
//  Created by SSR on 2022/7/12.
//

/// Error类将解决所有出错问题
/// 因为有Request才有Error，所以强持有
/// TODO: 对于错误的处理

#import <Foundation/Foundation.h>

#import "RisingRouterRequest.h"

NS_ASSUME_NONNULL_BEGIN

#pragma mark - NS_ENUM(RisingRouterErrorCode)

typedef NS_ENUM(NSUInteger, RisingRouterErrorCode) {
    RisingRouterErrorParameterLoss, // 参数缺失
    RisingRouterErrorNoParameterMatch, // 无参匹配
    RisingRouterErrorConflicted // 产生冲突
};

#pragma mark - RisingRouterError

@interface RisingRouterError : NSObject

@property (nonatomic, readonly) RisingRouterRequest *errorRequest;

@property (nonatomic) RisingRouterErrorCode errorCode;

- (instancetype)init NS_UNAVAILABLE;

+ (instancetype)new NS_UNAVAILABLE;

/// 初始化方法，因为无法确定request
/// @param code code代码
+ (instancetype)errorWithCode:(RisingRouterErrorCode)code;

/// 当路由过后，request后append
/// @param request 出错的request
- (instancetype)errorAppendRequest:(RisingRouterRequest *)request;

@end

NS_ASSUME_NONNULL_END
