//
//  AppDelegate.m
//  Rising
//
//  Created by SSR on 2022/6/5.
//

#import "AppDelegate.h"

#import "ViewController.h"

@interface AppDelegate ()



@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:[[ViewController alloc] init]];
    self.window = [[UIWindow alloc] init];
    self.window.rootViewController = nav;
    [self.window makeKeyAndVisible];
    return YES;
}

- (BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<UIApplicationOpenURLOptionsKey,id> *)options {
    if (!url) {
        return  NO;
    }
    
    NSString *urlStr = url.absoluteString;
    NSLog(@"handleOpenURL:%@",urlStr);
    
    return YES;
}

@end
