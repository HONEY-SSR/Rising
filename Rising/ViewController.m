//
//  ViewController.m
//  Rising
//
//  Created by SSR on 2022/6/5.
//

#import "ViewController.h"
#import "RisingHeader.h"

@interface ViewController ()

@end

#pragma mark - ViewController

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSString *a = @"Aaaa";
    RisingLog(R_defualt, __func__, @"%@ - %@", self, a);
}

@end
