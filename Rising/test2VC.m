//
//  test2VC.m
//  Rising
//
//  Created by SSR on 2022/7/13.
//

#import "test2VC.h"

#import "RisingSegmentView.h"

#import "RisingSegmentDefaultItem.h"

#import "UIView+Frame.h"

#pragma mark - test2VC ()

@interface test2VC () <
UICollectionViewDelegate,
UICollectionViewDataSource
>

@property (nonatomic, strong) UICollectionView *cview;

@end

@implementation test2VC

#pragma mark - Life cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColor.redColor;
    
    [self.view addSubview:self.cview];
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

- (UICollectionView *)cview {
    if (_cview == nil) {
        _cview = [[UICollectionView alloc] initWithFrame:CGRectMake(20, 100, 300, 50) collectionViewLayout:UICollectionViewFlowLayout.defaultRisingSegmentViewFlowLayout];
        _cview.backgroundColor = UIColor.orangeColor;
        [_cview registerClass:RisingSegmentDefaultItem.class forCellWithReuseIdentifier:RisingSegmentDefaultItemReuseIdentifier];
        _cview.delegate = self;
        _cview.dataSource = self;
    }
    return _cview;
}

#pragma mark - <UICollectionViewDataSource>

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 3;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    RisingSegmentDefaultItem *cell = [collectionView dequeueReusableCellWithReuseIdentifier:RisingSegmentDefaultItemReuseIdentifier forIndexPath:indexPath];
    [cell withTitle:@"aaaaa"];
    
    return cell;
}

#pragma mark - <UICollectionViewDelegate>

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
}

#pragma mark - <UICollectionViewDelegateFlowLayout>

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(60, collectionView.height);
}







+ (NSArray<NSString *> *)routerPath {
    return @[
        @"video/test"
    ];
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
