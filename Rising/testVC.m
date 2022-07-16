//
//  testVC.m
//  Rising
//
//  Created by SSR on 2022/7/11.
//

#import "testVC.h"

#import "RisingFoundationExtention.h"

#import "RisingSegmentView.h"

#import "TestSview.h"

#import "UIView+Frame.h"

@interface testVC () <
    RisingSegmentViewDelegate,
    RisingSegmentViewDataSourse,
    UIScrollViewDelegate
>

@property (nonatomic, strong) RisingSegmentView *segmentView;

@property (nonatomic, strong) TestSview *sview;

@end

@implementation testVC

- (void)viewDidLoad {
    [super viewDidLoad];
    RisingLog(R_success, @"加载");
    // Do any additional setup after loading the view.
    self.view.backgroundColor = UIColor.grayColor;
    
//    [self.view addSubview:self.sview];
    [self.view addSubview:self.segmentView];
   
}

- (TestSview *)sview {
    if (_sview == nil) {
        _sview = [[TestSview alloc] initWithFrame:CGRectMake(20, 100, 300, 400)];
        _sview.backgroundColor = UIColor.orangeColor;
        _sview.delegate = self;
        _sview.contentSize = CGSizeMake(600, 800);
    }
    return _sview;
}







#pragma mark - RisingRouterHandler

+ (NSArray<NSString *> *)routerPath {
    return @[
        @"video"
    ];
}

+ (void)responseRequestWithParameters:(NSDictionary *)parameters fromViewController:(UIViewController *)vc completion:(RisingRouterCompletionBlock _Nullable)handler {
    NSError *error;
    
//    if (parameters[@"<#key#>"] == <#value#>) {
//        RisingLogType code = <#R_#>;
//        error = [NSError errorWithDomain:NSMachErrorDomain code:code userInfo:parameters];
//        if (handler) {
//            handler(NO, error);
//        }
//        return;
//    }

    testVC *selfVC = [[self alloc] init];
    
    
    [vc.navigationController pushViewController:selfVC animated:YES];
    
    handler(YES, error);
}






- (RisingSegmentView *)segmentView {
    if (_segmentView == nil) {
        _segmentView = [[RisingSegmentView alloc] initWithFrame:CGRectMake(20, 100, 200, 50) collectionViewLayout:UICollectionViewFlowLayout.defaultRisingSegmentViewFlowLayout];
        _segmentView.backgroundColor = UIColor.orangeColor;
        _segmentView.delegate = self;
        _segmentView.dataSourse = self;
    }
    return _segmentView;
}

#pragma mark - delegate

- (NSInteger)numberOfSegmentIn:(RisingSegmentView *)view {
    return 3;
}

- (NSString *)risingSegmentView:(RisingSegmentView *)view titleForSegmentViewAtIndex:(NSInteger)index {
    return @"atc";
}

@end
