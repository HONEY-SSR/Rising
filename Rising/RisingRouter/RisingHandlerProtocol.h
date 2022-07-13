//
//  RisingHandlerProtocol.h
//  Rising
//
//  Created by SSR on 2022/7/11.
//

/// 被路由的模块需要遵守这个Protocol

#import <UIKit/UIKit.h>

#import "RisingFoundationExtention.h"

#import "RisingRouterRequest.h"

/// 被路由的类可以选择回掉的Block，告知路由类相关的信息
typedef void(^RisingRouterCompletionBlock)(BOOL pushed, NSError * _Nullable error);

NS_ASSUME_NONNULL_BEGIN

@protocol RisingHandlerProtocol <NSObject>

@required

/// 作为被路由的名称，做到不重复，且在文档集中必须提及出来
@property (nonatomic, readonly, class) NSString *routerPath;

/// 被路由后执行的响应方法，可在内部实现跳转到自己VC
/// @param parameters 参数
/// @param vc 从哪个vc来的
/// @param handler 是否传回告知相关信息
+ (void)responseRequestWithParameters:(nullable NSDictionary *)parameters fromViewController:(UIViewController *)vc completion:(_Nullable RisingRouterCompletionBlock)handler;

@end

NS_ASSUME_NONNULL_END
