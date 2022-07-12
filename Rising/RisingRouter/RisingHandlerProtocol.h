//
//  RisingHandlerProtocol.h
//  Rising
//
//  Created by SSR on 2022/7/11.
//

/// 被路由的模块需要遵守这个Protocol

#import <UIKit/UIKit.h>

#import "RisingRouterRequest.h"

#import "RisingRouterError.h"

/// 传递error，和是否被pushed
typedef void(^RisingRouterErrorBlock)(RisingRouterError * _Nullable error, BOOL pushed);

NS_ASSUME_NONNULL_BEGIN

@protocol RisingHandlerProtocol <NSObject>

@required

/// 作为被路由的名称，做到不重复，且在文档集中必须提及出来
@property (nonatomic, readonly, class) NSString *routerPath;

/// 被路由后执行的方法，可在内部实现跳转到自己VC
/// @param parameters 参数
/// @param vc 从哪个vc来的
/// @param handler 是否传回告知相关信息
+ (void)handleRequestWithParameters:(nullable NSDictionary *)parameters viewController:(UIViewController *)vc completion:(_Nullable RisingRouterErrorBlock)handler;

@end

NS_ASSUME_NONNULL_END
