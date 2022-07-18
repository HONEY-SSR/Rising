//
//  RisingRouterRequest.m
//  Rising
//
//  Created by SSR on 2022/7/12.
//

#import "RisingRouterRequest.h"

#pragma mark - RisingRouterRequest

@implementation RisingRouterRequest

+ (instancetype)requestWithURL:(NSURL *)url parameters:(NSDictionary * _Nullable)parameters {
    if (!url) {
        NSAssert(url, @"url is nil, have a check");
        return nil;
    }
    
    NSMutableDictionary *para = [[NSMutableDictionary alloc] init];
    NSURLComponents *urlComponents = [[NSURLComponents alloc] initWithString:url.absoluteString];
    [urlComponents.queryItems enumerateObjectsUsingBlock:^(NSURLQueryItem * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if (obj.value && obj.name) {
            [para setObject:obj.value forKey:obj.name];
        }
    }];
    [para addEntriesFromDictionary:parameters];
    
    // !!!: requestPath根据需求自定义，最终肯定是一个代理里面的东西
    NSString *requestPath = [url.path stringByReplacingOccurrencesOfString:@"/" withString:@""];
    
    RisingRouterRequest *request = [[RisingRouterRequest alloc] init];
    request->_responsePath = requestPath;
    request->_paramaters = para;
    
    return request;
}

+ (instancetype)requestWithRouterPath:(NSString *)routerPath parameters:(NSDictionary *)paramaters {
    if (!routerPath) {
        NSAssert(routerPath, @"routerPath is nil, have a check");
        return nil;
    }
    
    RisingRouterRequest *request = [[RisingRouterRequest alloc] init];
    request->_responsePath = routerPath;
    request->_paramaters = paramaters;
    
    return request;
}

@end
