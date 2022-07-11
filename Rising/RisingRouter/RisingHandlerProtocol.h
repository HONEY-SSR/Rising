//
//  RisingHandlerProtocol.h
//  Rising
//
//  Created by SSR on 2022/7/11.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef id RisingParameters;

typedef void(^RisingRouterCompletionHandler)(id _Nullable result, NSError * _Nullable error);

@protocol RisingHandlerProtocol <NSObject>

@property (nonatomic, readonly)NSString *routerPath;

+ (void)handleRequestWithParameters:(nullable RisingParameters)parameters viewController:(UIViewController *)vc completionHandler:(nullable RisingRouterCompletionHandler)handler;

@end

NS_ASSUME_NONNULL_END
