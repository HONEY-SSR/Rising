//
//  RisingSegmentView.m
//  Rising
//
//  Created by SSR on 2022/7/9.
//

#import "RisingSegmentView.h"

#pragma mark - RisingSegmentView ()

@interface RisingSegmentView () <
    UICollectionViewDelegate,
    UICollectionViewDataSource
>

/// 主要的CollectionView
@property (nonatomic, strong) UICollectionView *cview;

/// 外界传进来的FlowLayout
@property (nonatomic, strong) UICollectionViewLayout *layout;

@end

#pragma mark - RisingSegmentView

@implementation RisingSegmentView

#pragma mark - Life cycle

- (instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout {
    
    if (!layout) {
        NSAssert(layout, @"layout为nil, 请检查layout！");
        layout = UICollectionViewFlowLayout.defaultRisingSegmentViewFlowLayout;
    }
    
    self = [super initWithFrame:frame];
    if (self) {
        self.layout = layout;
        [self addSubview:self.cview];
    }
    return self;
}

#pragma mark - Method

// MARK: SEL

#pragma mark - Getter

- (UICollectionView *)cview {
    if (_cview == nil) {
       _cview = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:self.layout];
        UISegmentedControl *contro;
        UITableViewCell *a;
    }
    return _cview;
}

#pragma mark - Setter




@end
