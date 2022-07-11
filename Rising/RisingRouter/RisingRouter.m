//
//  RisingRouter.m
//  Rising
//
//  Created by SSR on 2022/7/11.
//

#import "RisingRouter.h"
#import <objc/runtime.h>

static RisingRouter *_router;

static NSMutableDictionary *_handlersM;

@implementation RisingRouter

- (instancetype)init {
    self = [super init];
    if (self) {
        _handlersM = NSMutableDictionary.dictionary;
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
                
                _handlersM[[(id<RisingHandlerProtocol>)thisCls routerPath]] = thisCls;
                break;
            }
        }
        if (classes)
            free(classes);
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

- (void)handleRequest:(RisingRouterRequest *)request completionHandler:(RisingRouterCompletionHandler)handler {
    
    if (!request) {
        NSAssert(request, @"request is nil");
        return;
    }
    
    Class <RisingHandlerProtocol> handlerObj = _handlersM[request.requestPath];
    
    if (handlerObj) {
        [handlerObj handleRequestWithParameters:request.parameters viewController:UIApplication.topViewController completionHandler:handler];
    } else {
        NSAssert(handlerObj, @"handlerObj is nil");
    }
}

@end

@implementation UIApplication (RisingRouter)

+ (UIViewController *)topViewController {
    UIViewController *rootVC = UIApplication.sharedApplication.keyWindow.rootViewController;
    return [self topViewControllerWithBase:rootVC];
}

+ (UIViewController *)topViewControllerWithBase:(UIViewController *)VC {
    if ([VC isKindOfClass:UINavigationController.class]) {
        return [self topViewControllerWithBase:((UINavigationController *)VC).visibleViewController];
    } else if ([VC isKindOfClass:UITabBarController.class]) {
        return [self topViewControllerWithBase:((UITabBarController *)VC).selectedViewController];
    }
    return VC;
}

@end
