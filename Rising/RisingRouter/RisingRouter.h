//
//  RisingRouter.h
//  Rising
//
//  Created by SSR on 2022/7/11.
//

/// 这个类就是Router类，直接使用RisingRouter.router
/// 只有遵循了RisingHandlerProtocol的类才会被路由

#import <Foundation/Foundation.h>

#import "RisingUIKitExtention.h"

#import "RisingHandlerProtocol.h"

#import "RisingRouterRequest.h"

#import "RisingRouterError.h"

NS_ASSUME_NONNULL_BEGIN

typedef void(^RisingRouterHandler)(RisingRouterError *error, BOOL pushed);

@interface RisingRouter : NSObject

/// 单例Router
@property(nonatomic, readonly, class) RisingRouter *router;

- (instancetype)init NS_UNAVAILABLE;

+ (instancetype)new NS_UNAVAILABLE;

/// 通过当前顶VC跳转
/// @param request 请求
/// @param completion 请求完成后掉用
- (void)handleRequest:(RisingRouterRequest *)request completion:(RisingRouterHandler)completion;

/// 通过vc跳转
/// @param request 请求
/// @param vc 从哪个vc跳转
/// @param completion 请求完成掉用
- (void)handleRequest:(RisingRouterRequest *)request fromViewController:(UIViewController *)vc completion:(RisingRouterHandler)completion;

@end

NS_ASSUME_NONNULL_END
