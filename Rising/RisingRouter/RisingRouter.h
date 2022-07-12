//
//  RisingRouter.h
//  Rising
//
//  Created by SSR on 2022/7/11.
//

#import <Foundation/Foundation.h>

#import "RisingUIKitExtention.h"

#import "RisingHandlerProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@interface RisingRouter : NSObject

/// 单例Router
@property(nonatomic, readonly, class) RisingRouter *router;

- (instancetype)init NS_UNAVAILABLE;

+ (instancetype)new NS_UNAVAILABLE;

//- (void)handleRequest:(RisingRouterRequest *)request completionHandler:(RisingRouterCompletionHandler)handler;

- (void)handleURL:(NSURL *)url completion:(void (^ _Nullable) (NSDictionary *dic))completion;

- (void)handleRequest:(NSString *)requestPath paramater:(NSDictionary *)paramater completion:(void (^ _Nullable) (NSDictionary *dic))completion;

@end

NS_ASSUME_NONNULL_END
