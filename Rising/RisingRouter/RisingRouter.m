//
//  RisingRouter.m
//  Rising
//
//  Created by SSR on 2022/7/11.
//

#import "RisingRouter.h"
#import <objc/runtime.h>

static RisingRouter *_router;

@interface RisingRouter ()

@property (nonatomic, strong) NSMutableDictionary *moduleDic;

@end

@implementation RisingRouter

- (instancetype)init {
    self = [super init];
    if (self) {
        self.moduleDic = NSMutableDictionary.dictionary;
        int count = objc_getClassList(NULL, 0);
        Class *classes = (Class *)malloc(sizeof(Class) * count);
        objc_getClassList(classes, count);
        Protocol *p_handler = @protocol(RisingHandlerProtocol);
        for (int i = 0 ; i < count ; ++i) {
            Class cls = classes[i];
            for (Class thisCls = cls; nil != thisCls;
                thisCls = class_getSuperclass(thisCls)) {
                
                if (!class_conformsToProtocol(thisCls, p_handler))
                    continue;
                
                self.moduleDic[[(id<RisingHandlerProtocol>)thisCls routerPath]] = thisCls;
                break;
            }
        }
        if (classes)
            free(classes);
    }
    return self;
}

- (void)handleURL:(NSURL *)url completion:(void (^)(NSDictionary * _Nonnull))completion {
    if (!url) {
        NSAssert(url, @"url is nil, have a check");
        return;
    }
    
    NSMutableDictionary *params = [[NSMutableDictionary alloc] init];
    NSURLComponents *urlComponents = [[NSURLComponents alloc] initWithString:url.absoluteString];
    [urlComponents.queryItems enumerateObjectsUsingBlock:^(NSURLQueryItem * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if (obj.value&&obj.name) {
            [params setObject:obj.value forKey:obj.name];
        }
    }];
    
    // !!!: requestPath根据需求自定义，最终肯定是一个代理里面的东西
    NSString *requestPath = [url.path stringByReplacingOccurrencesOfString:@"/" withString:@""];
    
    [self handleRequest:requestPath paramater:params completion:completion];
}

- (void)handleRequest:(NSString *)requestPath paramater:(NSDictionary *)paramater completion:(void (^)(NSDictionary * _Nonnull))completion {
    Class <RisingHandlerProtocol> handlerObj = self.moduleDic[requestPath];
    
    if (handlerObj) {
        [handlerObj handleRequestWithParameters:paramater viewController:UIApplication.topViewController completionHandler:completion];
    } else {
        NSAssert(handlerObj, @"handlerObj is nil");
    }
}

+ (RisingRouter *)router {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _router = [[RisingRouter alloc] init];
    });
    return _router;
}


@end
