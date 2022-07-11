//
//  RisingRouter.h
//  Rising
//
//  Created by SSR on 2022/7/11.
//

#import <Foundation/Foundation.h>

#import "RisingRouterRequest.h"

NS_ASSUME_NONNULL_BEGIN

@interface RisingRouter : NSObject

/// 单例Router
@property(nonatomic, readonly, class) RisingRouter *router;

- (instancetype)init NS_UNAVAILABLE;

+ (instancetype)new NS_UNAVAILABLE;

- (void)handleRequest:(RisingRouterRequest *)request completionHandler:(RisingRouterCompletionHandler)handler;

@end

@interface UIApplication (RisingRouter)

@property (nonatomic, readonly, class) UIViewController *topViewController;

+ (UIViewController *)topViewControllerWithBase:(UIViewController *)VC;

@end

NS_ASSUME_NONNULL_END
