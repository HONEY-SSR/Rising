//
//  RisingItem.m
//  Rising
//
//  Created by SSR on 2022/7/9.
//

#import "RisingItem.h"
#import "UIView+Frame.h"
#import "RisingFoundationExtension.h"
#import "BanchItem.h"

NSString *RisingItemReuseIdentifier = @"RisingItem";

#pragma mark - RisingItem ()

@interface RisingItem () <
    UICollectionViewDataSource,
    UICollectionViewDelegate
>

@property (nonatomic, strong) UICollectionView *cview;

@end

@implementation RisingItem

#pragma mark - Life cycle

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self.contentView addSubview:self.cview];
    }
    return self;
}

#pragma mark - Method

// MARK: SEL

#pragma mark - <UICollectionViewDataSource>

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 40;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    BanchItem *cell = [collectionView dequeueReusableCellWithReuseIdentifier:BanchItemReuseIdentifier forIndexPath:indexPath];
    cell.backgroundColor = (indexPath.row % 2 ? UIColor.redColor : UIColor.grayColor);
//    RisingLog(R_OK, @"%@", cell);
    return cell;
}

#pragma mark - <UICollectionViewDelegate>

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
}

#pragma mark - <UICollectionViewDelegateFlowLayout>

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(80, 100);
}

#pragma mark - <UIScrollViewDelegate>

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
}



#pragma mark - Getter

- (UICollectionView *)cview {
    if (_cview == nil) {
        UICollectionViewFlowLayout *fl = [[UICollectionViewFlowLayout alloc] init];
        fl.minimumLineSpacing = 3;
        fl.minimumInteritemSpacing = 3;
        _cview = [[UICollectionView alloc] initWithFrame:self.SuperFrame collectionViewLayout:fl];
        [_cview registerClass:BanchItem.class forCellWithReuseIdentifier:BanchItemReuseIdentifier];
        _cview.delegate = self;
        _cview.dataSource = self;
        _cview.backgroundColor = UIColor.brownColor;
        _cview.contentSize = CGSizeMake(self.contentView.width, 800);
    }
    return _cview;
}

#pragma mark - Setter



@end
