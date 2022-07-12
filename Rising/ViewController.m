//
//  ViewController.m
//  Rising
//
//  Created by SSR on 2022/6/5.
//

#import "ViewController.h"
#import "RisingFoundationExtention.h"
#import "UIView+Frame.h"
#import "RisingItem.h"

#import "RisingRouter.h"

@interface ViewController () <
    UICollectionViewDelegate,
    UICollectionViewDataSource
>

@property (nonatomic, strong) UICollectionView *cview;

@property (nonatomic, strong) UIScrollView *sview;

@end

#pragma mark - ViewController

@implementation ViewController

- (void)push:(UIButton *)sender {
    RisingLog(R_defualt, @"er");
    [RisingRouter.router handleRequest:@"video" paramater:@{@"aaa": @"rising and ssr"} completion:^(NSDictionary * _Nonnull dic) {
            
    }];
}

#pragma mark - Life cycle

- (void)viewDidLoad {
    [super viewDidLoad];
//    [self.view addSubview:self.cview];
    self.view.backgroundColor = UIColor.orangeColor;
    UIButton *a = [[UIButton alloc] initWithFrame:CGRectMake(50, 100, 100, 50)];
    a.backgroundColor = UIColor.greenColor;
    [a setTitle:@"aaa" forState:UIControlStateNormal];
    [a addTarget:self action:@selector(push:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:a];
    RisingLog(R_success, @"我爱%@", @"Rising");
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
}

#pragma mark - <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 5;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 1;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    RisingItem *cell = [collectionView dequeueReusableCellWithReuseIdentifier:RisingItemReuseIdentifier forIndexPath:indexPath];
    
    cell.backgroundColor = (indexPath.section % 2 ? UIColor.blueColor : UIColor.redColor);
    return cell;
}

#pragma mark - <UICollectionViewDelegate>

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
}

#pragma mark - <UICollectionViewDelegateFlowLayout>

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return collectionView.size;
}

#pragma mark - Method

// MARK: SEL

#pragma mark - Getter

- (UICollectionView *)cview {
    if (_cview == nil) {
        UICollectionViewFlowLayout *fl = [[UICollectionViewFlowLayout alloc] init];
        fl.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        fl.minimumLineSpacing = 0;
        _cview = [[UICollectionView alloc] initWithFrame:CGRectMake(10, 40, 300, 500) collectionViewLayout:fl];
        [_cview registerClass:RisingItem.class forCellWithReuseIdentifier:RisingItemReuseIdentifier];
        _cview.pagingEnabled = YES;
        _cview.backgroundColor = UIColor.orangeColor;
        _cview.delegate = self;
        _cview.dataSource = self;
    }
    return _cview;
}

- (UIScrollView *)sview {
    if (_sview == nil) {
        _sview = [[UIScrollView alloc] init];
        _sview.delegate = self;
        
    }
    return _sview;
}

@end
