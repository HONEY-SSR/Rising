//
//  RisingRouter.m
//  Rising
//
//  Created by SSR on 2022/7/11.
//

#import "RisingRouter.h"

#import <objc/runtime.h>

/// 单例
static RisingRouter *_router;

#pragma mark - RisingRouter ()

@interface RisingRouter ()

@property (nonatomic, strong) NSMutableDictionary <NSString *, Class> *moduleDic;

@end

#pragma mark - RisingRouter

@implementation RisingRouter

#pragma mark - Life cycle

- (instancetype)init {
    self = [super init];
    if (self) {
        self.moduleDic = NSMutableDictionary.dictionary;
        int count = objc_getClassList(NULL, 0);
        Class *classes = (Class *)malloc(sizeof(Class) * count);
        objc_getClassList(classes, count);
        Protocol *p_handler = @protocol(RisingHandlerProtocol);
        // ???: 命名存的方法是否有待加强
        for (int i = 0 ; i < count ; ++i) {
            Class cls = classes[i];
            for (Class thisCls = cls; thisCls;
                thisCls = class_getSuperclass(thisCls)) {
                
                if (!class_conformsToProtocol(thisCls, p_handler)) {
                    continue;
                }
                self.moduleDic[[(id<RisingHandlerProtocol>)thisCls routerPath]] = thisCls;
                break;
            }
        }
        if (classes) {
            free(classes);
        }
    }
    return self;
}

+ (RisingRouter *)router {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _router = [[RisingRouter alloc] init];
    });
    return _router;
}

#pragma mark - Method

- (void)handleRequest:(RisingRouterRequest *)request completion:(RisingRouterHandler)completion {
    
    [self handleRequest:request fromViewController:UIApplication.topViewController completion:completion];
}

- (void)handleRequest:(RisingRouterRequest *)request fromViewController:(UIViewController *)vc completion:(RisingRouterHandler)completion {
    
    Class <RisingHandlerProtocol> handlerObj = self.moduleDic[request.routerPath];
    
    if (handlerObj) {
        __block BOOL s_pushed = false;
        __block RisingRouterError *s_error;
        
        [handlerObj handleRequestWithParameters:request.paramaters viewController:vc completion:^(RisingRouterError * _Nullable error, BOOL pushed){
            s_error = error;
            s_pushed = pushed;
        }];
        
        if (completion) {
            completion([s_error errorAppendRequest:request], s_pushed);
        }
    } else {
        NSAssert(handlerObj, @"无Class响应");
    }
    // TODO: 通过" / "层级跳转实现
}

@end
