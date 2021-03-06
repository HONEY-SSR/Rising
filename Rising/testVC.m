//
//  testVC.m
//  Rising
//
//  Created by SSR on 2022/7/11.
//

#import "testVC.h"

#import "RisingFoundationExtension.h"

#import "RisingSegmentView.h"
#import "RisingSegmentDefaultItem.h"

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
    
    [self.view addSubview:self.segmentView];
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
        @"<#routerPath#>"
    ];
}

+ (void)responseRequest:(RisingRouterRequest *)request completion:(RisingRouterResponseBlock)completion {
//    // check parameters
//    NSDictionary *paraDic = request.parameters;
//    NSString *a = [paraDic[@"aaa"] stringValue];
//    if (a && completion) {
//        completion(
//            [RisingRouterResponse
//             responseErrorPushed:NO
//             errorCode:RouterParameterClassError
//             errorDescription:[NSString stringWithFormat:@"%@???%@??????", @"aaa", NSString.class]]);
//    }
    
    if (request.requestController) {
        
        // compare parameters
        
        [request.requestController.navigationController pushViewController:[self.alloc init] animated:YES];
        
        if (completion) {
            RisingRouterResponse *response = [[RisingRouterResponse alloc] init];
            response.responseController = [self.alloc init];
            completion(response);
        }
    } else {
        
        // [RisingRouterRequest.useTopController.navigationController pushViewController:[self.alloc init] animated:YES];
        
//        if (completion) {
//            completion(
//                [RisingRouterResponse
//                 responseErrorPushed:NO
//                 errorCode:RouterWithoutNavagation
//                 errorDescription:nil]);
//        }
    }
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
