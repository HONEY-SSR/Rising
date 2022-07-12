//
//  RisingRouterRequest.h
//  Rising
//
//  Created by SSR on 2022/7/12.
//

/// 这个RouterRequest用来解决Request的问题
/// 包括外链到内部的分配算法都在这里解决
/// TODO: 可以根据路径" / "一个一个push

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface RisingRouterRequest : NSObject

/// 路由抵达路径
@property (nonatomic, readonly) NSString *routerPath;

/// 参数
@property (nonatomic, readonly, nullable) NSDictionary *paramaters;

- (instancetype)init NS_UNAVAILABLE;

+ (instancetype)new NS_UNAVAILABLE;

/// 外链转Request
/// @param url 只要一个URL就够了
+ (instancetype)requestWithURL:(NSURL *)url;

/// 正常的一种Request
/// @param routerPath 路由路径
/// @param paramaters 路由参数
+ (instancetype)requestWithRouterPath:(NSString *)routerPath paramaters:(NSDictionary * _Nullable)paramaters;

@end

NS_ASSUME_NONNULL_END
