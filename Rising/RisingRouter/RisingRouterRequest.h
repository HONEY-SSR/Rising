//
//  RisingRouterRequest.h
//  Rising
//
//  Created by SSR on 2022/7/11.
//

#import <Foundation/Foundation.h>

#import "RisingHandlerProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@interface RisingRouterRequest : NSObject

- (instancetype)initWithURL:(NSURL *)url;

- (instancetype)initWithPath:(NSString *)requestPath parameters:(nullable RisingParameters)parameters;

/// 请求路径
@property (nonatomic, readonly) NSString *requestPath;

/// 参数
@property (nonatomic, readonly, nullable) RisingParameters parameters;

- (instancetype)init NS_UNAVAILABLE;

+ (instancetype)new NS_UNAVAILABLE;

@end

NS_ASSUME_NONNULL_END
