//
//  testVC.m
//  Rising
//
//  Created by SSR on 2022/7/11.
//

#import "testVC.h"

@interface testVC ()

@end

@implementation testVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = UIColor.redColor;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

+ (void)handleRequestWithParameters:(nullable RisingParameters)parameters viewController:(nonnull UIViewController *)vc completionHandler:(nullable RisingRouterCompletionHandler)handler {
    NSLog(@"rising - %@", parameters);
    [vc.navigationController pushViewController:[[self alloc] init] animated:YES];
}

+ (nonnull NSString *)routerPath {
    return @"video";
}

@end
