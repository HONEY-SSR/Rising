//
//  RisingRouterRequest.m
//  Rising
//
//  Created by SSR on 2022/7/12.
//

#import "RisingRouterRequest.h"

#pragma mark - RisingRouterRequest

@implementation RisingRouterRequest

+ (instancetype)requestWithURL:(NSURL *)url {
    if (!url) {
        NSAssert(url, @"url is nil, have a check");
        return nil;
    }
    
    NSMutableDictionary *paramaters = [[NSMutableDictionary alloc] init];
    NSURLComponents *urlComponents = [[NSURLComponents alloc] initWithString:url.absoluteString];
    [urlComponents.queryItems enumerateObjectsUsingBlock:^(NSURLQueryItem * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if (obj.value && obj.name) {
            [paramaters setObject:obj.value forKey:obj.name];
        }
    }];
    
    // !!!: requestPath根据需求自定义，最终肯定是一个代理里面的东西
    NSString *requestPath = [url.path stringByReplacingOccurrencesOfString:@"/" withString:@""];
    
    RisingRouterRequest *request = [[RisingRouterRequest alloc] init];
    request->_routerPath = requestPath;
    request->_paramaters = paramaters;
    
    return request;
}

+ (instancetype)requestWithRouterPath:(NSString *)routerPath parameters:(NSDictionary *)paramaters {
    if (!routerPath) {
        NSAssert(routerPath, @"routerPath is nil, have a check");
        return nil;
    }
    
    RisingRouterRequest *request = [[RisingRouterRequest alloc] init];
    request->_routerPath = routerPath;
    request->_paramaters = paramaters;
    
    return request;
}

@end
