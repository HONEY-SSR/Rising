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
        _cview = [[UICollectionView alloc] initWithFrame:CGRectMake(20, 100, 300, 400) collectionViewLayout:UICollectionViewFlowLayout.defaultRisingSegmentViewFlowLayout];
        _cview.backgroundColor = UIColor.orangeColor;
        [_cview registerClass:RisingSegmentDefaultItem.class forCellWithReuseIdentifier:RisingSegmentDefaultItemReuseIdentifier];
        _cview.delegate = self;
        _cview.dataSource = self;
        
        UILongPressGestureRecognizer *longP = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longP:)];
        [_cview addGestureRecognizer:longP];
    }
    return _cview;
}

- (void)longP:(UILongPressGestureRecognizer *)longGesture {
    //判断手势状态
        switch (longGesture.state) {
            case UIGestureRecognizerStateBegan: {
                //判断手势落点位置是否在路径上
                NSIndexPath *indexPath = [self.cview indexPathForItemAtPoint:[longGesture locationInView:self.cview]];
                if (indexPath == nil) {
                    break;
                }
                //在路径上则开始移动该路径上的cell
                [self.cview beginInteractiveMovementForItemAtIndexPath:indexPath];
            }
                break;
            case UIGestureRecognizerStateChanged:
                //移动过程当中随时更新cell位置
                [self.cview updateInteractiveMovementTargetPosition:[longGesture locationInView:self.cview]];
                break;
            case UIGestureRecognizerStateEnded:
                //移动结束后关闭cell移动
                [self.cview endInteractiveMovement];
                break;
            default:
                [self.cview cancelInteractiveMovement];
                break;
        }
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

- (BOOL)collectionView:(UICollectionView *)collectionView canMoveItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}



- (void)collectionView:(UICollectionView *)collectionView moveItemAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath {
    
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

+ (void)responseRequest:(RisingRouterRequest *)request completion:(RisingRouterResponseBlock)completion {
    
}

@end
