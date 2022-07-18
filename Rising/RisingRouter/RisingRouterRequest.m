//
//  RisingRouterRequest.m
//  Rising
//
//  Created by SSR on 2022/7/12.
//

#import "RisingRouterRequest.h"

#import "RisingUIKitExtention.h"

#pragma mark - RisingRouterRequest ()

@interface RisingRouterRequest ()

@property (nonatomic, strong) NSMutableDictionary *paraMtDic;

@end

#pragma mark - RisingRouterRequest

@implementation RisingRouterRequest

#pragma mark - Life cycle

- (instancetype)init {
    self = [super init];
    if (self) {
        self.paraMtDic = NSMutableDictionary.dictionary;
    }
    return self;
}

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
    request.paraMtDic = para;
    
    return request;
}

+ (instancetype)requestWithRouterPath:(NSString *)routerPath parameters:(NSDictionary *)paramaters {
    if (!routerPath) {
        NSAssert(routerPath, @"routerPath is nil, have a check");
        return nil;
    }
    
    RisingRouterRequest *request = [[RisingRouterRequest alloc] init];
    request->_responsePath = routerPath;
    request.paraMtDic = paramaters.mutableCopy;
    
    return request;
}

#pragma mark - Method

- (void)appendParameters:(NSDictionary *)parameters {
    [self.paraMtDic addEntriesFromDictionary:parameters];
}

#pragma mark - Getter

- (NSDictionary *)parameters {
    return self.paraMtDic;
}

+ (UIViewController *)useTopController {
    return UIApplication.topViewController;
}

@end
