//
//  testVC.m
//  Rising
//
//  Created by SSR on 2022/7/11.
//

#import "testVC.h"

#import "RisingFoundationExtention.h"

@interface testVC ()

@end

@implementation testVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = UIColor.grayColor;
}

+ (nonnull NSString *)routerPath {
    return @"video";
}

+ (void)responseRequestWithParameters:(NSDictionary *)parameters fromViewController:(UIViewController *)vc completion:(RisingRouterCompletionBlock _Nullable)handler {
    NSError *error;
    if (parameters[@"aaa"] == nil) {
        error = [NSError errorWithDomain:NSMachErrorDomain code:2 userInfo:parameters];
        if (handler) {
            handler(NO, error);
        }
        return;
    }
    
    [vc.navigationController pushViewController:[self.alloc init] animated:YES];
    handler(YES, error);
}

@end
