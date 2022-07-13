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

NS_ASSUME_NONNULL_BEGIN

/// 路由的类路由后可选择接受回掉，
typedef void(^RisingRouterHandleBlock)(RisingRouterRequest *request, BOOL pushed, NSError* _Nullable error);

@interface RisingRouter : NSObject

/// 单例Router
@property(nonatomic, readonly, class) RisingRouter *router;

- (instancetype)init NS_UNAVAILABLE;

+ (instancetype)new NS_UNAVAILABLE;

/// 通过当前顶VC跳转
/// @param request 请求
/// @param completion 请求完成后掉用
- (void)handleRequest:(RisingRouterRequest *)request complition:(_Nullable RisingRouterHandleBlock)completion;

/// 通过vc跳转
/// @param request 请求
/// @param vc 从哪个vc跳转
/// @param completion 请求完成掉用
- (void)handleRequest:(RisingRouterRequest *)request fromViewController:(UIViewController *)vc completion:(_Nullable RisingRouterHandleBlock)completion;

@end

NS_ASSUME_NONNULL_END
