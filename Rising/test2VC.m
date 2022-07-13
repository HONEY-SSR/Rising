//
//  test2VC.m
//  Rising
//
//  Created by SSR on 2022/7/13.
//

#import "test2VC.h"

@implementation test2VC

#pragma mark - Life cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColor.redColor;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
}

#pragma mark - Method

// MARK: SEL

#pragma mark - Getter


+ (NSString *)routerPath {
    return @"vedio/test";
}

+ (void)responseRequestWithParameters:(NSDictionary *)parameters fromViewController:(UIViewController *)vc completion:(RisingRouterCompletionBlock)handler {
    [RisingRouter.router
     handleRequest:
         [RisingRouterRequest
          requestWithRouterPath:@"video"
          paramaters:@{@"aaa":@"rising"}]
     fromViewController:vc
     completion:^(RisingRouterRequest * _Nonnull request, BOOL pushed, NSError * _Nullable error) {
        [vc.navigationController pushViewController:[self.alloc init] animated:YES];
    }];
    
}

@end
