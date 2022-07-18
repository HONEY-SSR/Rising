//
//  testVC.m
//  Rising
//
//  Created by SSR on 2022/7/11.
//

#import "testVC.h"

#import "RisingFoundationExtention.h"

#import "RisingSegmentView.h"
#import "RisingSegmentDefaultItem.h"

#import "RisingType.h"

#import "UIView+Frame.h"

@interface testVC () <
    RisingSegmentViewDelegate,
    RisingSegmentViewDataSourse,
    UICollectionViewDelegate,
    UICollectionViewDataSource
>

@property (nonatomic, strong) RisingSegmentView *segmentView;

@end

@implementation testVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = UIColor.grayColor;
    
//    [self.view addSubview:self.segmentView];
    NSLog(@"a");
}

#pragma mark - <UICollectionViewDataSource>

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 50;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    RisingSegmentDefaultItem *cell = [collectionView dequeueReusableCellWithReuseIdentifier:RisingSegmentDefaultItemReuseIdentifier forIndexPath:indexPath];
    [cell withTitle:@"Rising"];
    return cell;
}

#pragma mark - <UICollectionViewDelegate>

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
}

#pragma mark - <UICollectionViewDelegateFlowLayout>

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(100, 200);
}




















#pragma mark - RisingRouterHandler

+ (NSArray<NSString *> *)routerPath {
    return @[
        @"video"
    ];
}

+ (void)responseRequestWithParameters:(NSDictionary *)parameters fromViewController:(UIViewController *)vc completion:(RisingRouterCompletionBlock _Nullable)handler {
    NSError *error;
    
    if (!parameters) {
        [NSString stringWithFormat:@"a"];
        error = [NSError errorWithDomain:NSCocoaErrorDomain code:NSFileNoSuchFileError userInfo:parameters];
        if (handler) {
            handler(NO, error);
        }
        return;
    }

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
