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
    self.view.backgroundColor = UIColor.redColor;
}

+ (nonnull NSString *)routerPath {
    return @"video";
}

+ (void)handleRequestWithParameters:(NSDictionary *)parameters viewController:(UIViewController *)vc completion:(void (^ _Nullable)(RisingRouterError *error, BOOL pushed))handler {
    handler([RisingRouterError errorWithCode:RisingRouterErrorParameterLoss],YES);
}

@end
