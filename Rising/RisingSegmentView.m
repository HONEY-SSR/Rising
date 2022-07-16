//
//  RisingSegmentView.m
//  Rising
//
//  Created by SSR on 2022/7/9.
//

#import "RisingSegmentView.h"

#import "RisingSegmentDefaultItem.h"

#import "UIView+Frame.h"

#pragma mark - RisingSegmentViewDelegateFlags

typedef struct {
    
    /// RisingSegmentView:didSelectedAtIndex:
    BOOL risingSegmentView_didSelectedAtIndex;
    
} RisingSegmentViewDelegateFlags;

#pragma mark - RisingSegmentViewDataSourseFlags

typedef struct {
    
    /// risingSegmentView:segmentViewAtIndex:
    BOOL risingSegmentView_segmentViewAtIndex;
    
    /// risingSegmentView:canMoveSegmentAtIndex:
    BOOL risingSegmentView_canMoveSegmentAtIndex;
    
    /// risingSegmentView:moveSegmentAtIndex:toIndex:
    BOOL risingSegmentView_moveSegmentAtIndex_toIndex;
    
} RisingSegmentViewDataSourseFlags;

#pragma mark - RisingSegmentView ()

@interface RisingSegmentView () <
    UICollectionViewDelegate,
    UICollectionViewDataSource
>

/// 主要的CollectionView
@property (nonatomic, strong) UICollectionView *cview;

/// 外界传进来的FlowLayout
@property (nonatomic, strong) UICollectionViewLayout *layout;

/// delegateFlags
@property (nonatomic) RisingSegmentViewDelegateFlags delegateFlags;

/// dataSourseFlags
@property (nonatomic) RisingSegmentViewDataSourseFlags dataSourseFlags;

/// 长按的手势
@property (nonatomic, strong) UILongPressGestureRecognizer *longPress;

/// 避免复杂的计算
@property (nonatomic) NSInteger currentIndex;

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

- (void)registerSegmentClass:(Class)segmentClass forSegmentWithReuseIdentifier:(NSString *)identifier {
    [self.cview registerClass:segmentClass forCellWithReuseIdentifier:identifier];
}

// !!!: 待验证

- (void)autoLeftWithAnimated:(BOOL)animated {
    UICollectionViewCell *cell = [self.cview cellForItemAtIndexPath:[NSIndexPath indexPathForItem:self.currentIndex inSection:0]];
    
    [self.cview setContentOffset:CGPointMake(- (cell.left - self.selectedAutoLeft), 0) animated:animated];
}

- (void)scrollToIndex:(NSInteger)index animated:(BOOL)animate {
    self.currentIndex = index;
    
    [self autoLeftWithAnimated:animate];
}

// MARK: SEL

- (void)longPress:(UILongPressGestureRecognizer *)longPress {
    switch (longPress.state) {
        case UIGestureRecognizerStateBegan: {
            NSIndexPath *selectIndexPath = [self.cview indexPathForItemAtPoint:[longPress locationInView:self.cview]];
            
            [self.cview beginInteractiveMovementForItemAtIndexPath:selectIndexPath];
        } break;
        case UIGestureRecognizerStateChanged: {
            [self.cview updateInteractiveMovementTargetPosition:[longPress locationInView:self.cview]];
        } break;
        case UIGestureRecognizerStateEnded: {
            [self.cview endInteractiveMovement];
        } break;
        default: {
            [self.cview cancelInteractiveMovement];
        } break;
    }
}

#pragma mark - Getter

- (UICollectionView *)cview {
    if (_cview == nil) {
        _cview = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:self.layout];
        [_cview registerClass:RisingSegmentDefaultItem.class forCellWithReuseIdentifier:RisingSegmentDefaultItemReuseIdentifier];
        _cview.delegate = self;
    }
    return _cview;
}

- (UILongPressGestureRecognizer *)longPress {
    if (_longPress == nil) {
        _longPress = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longPress:)];
    }
    return _longPress;
}

#pragma mark - Setter

- (void)setBackgroundView:(UIView *)backgroundView {
    if (_backgroundView == backgroundView || !backgroundView) {
        return;
    }
    
    [_backgroundView removeFromSuperview];
    [self sendSubviewToBack:backgroundView];
    
    _backgroundView = backgroundView;
}

- (void)setDelegate:(id<RisingSegmentViewDelegate>)delegate {
    if (_delegate == delegate) {
        return;
    }
    _delegate = delegate;

    _delegateFlags.risingSegmentView_didSelectedAtIndex =
    [delegate respondsToSelector:@selector(risingSegmentView:didSelectedAtIndex:)];
}

- (void)setDataSourse:(id<RisingSegmentViewDataSourse>)dataSourse {
    _dataSourse = dataSourse;
    
    _dataSourseFlags.risingSegmentView_segmentViewAtIndex =
    [dataSourse respondsToSelector:@selector(risingSegmentView:segmentViewAtIndex:)];
    
    _dataSourseFlags.risingSegmentView_canMoveSegmentAtIndex =
    [dataSourse respondsToSelector:@selector(risingSegmentView:canMoveSegmentAtIndex:)];
    
    _dataSourseFlags.risingSegmentView_moveSegmentAtIndex_toIndex =
    [dataSourse respondsToSelector:@selector(risingSegmentView:moveSegmentAtIndex:toIndex:)];
    
    self.cview.dataSource = self;
}

- (void)setNeedLongPressToDrag:(BOOL)needLongPressToDrag {
    if (_needLongPressToDrag == needLongPressToDrag) {
        return;
    }
    
    if (needLongPressToDrag) {
        [self.cview addGestureRecognizer:self.longPress];
    } else {
        [self.cview removeGestureRecognizer:self.longPress];
    }
}

#pragma mark - <UICollectionViewDelegate>

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    if (self.delegateFlags.risingSegmentView_didSelectedAtIndex) {
        [self.delegate risingSegmentView:self didSelectedAtIndex:indexPath.item];
    }
}

#pragma mark - <UICollectionViewDataSource>

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {

    return self.dataSourse ? [self.dataSourse numberOfSegmentIn:self] : 0;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    if (self.dataSourseFlags.risingSegmentView_segmentViewAtIndex) {
        return [self.dataSourse risingSegmentView:self segmentViewAtIndex:indexPath.item];
    }
    
    RisingSegmentDefaultItem *cell = [collectionView dequeueReusableCellWithReuseIdentifier:RisingSegmentDefaultItemReuseIdentifier forIndexPath:indexPath];
    
    if (self.dataSourse) {
        [cell withTitle:[self.dataSourse risingSegmentView:self titleForSegmentViewAtIndex:indexPath.item]];
    }
    
    return cell;
}

- (BOOL)collectionView:(UICollectionView *)collectionView canMoveItemAtIndexPath:(NSIndexPath *)indexPath {
    
    return self.dataSourseFlags.risingSegmentView_canMoveSegmentAtIndex ?
        [self.dataSourse risingSegmentView:self canMoveSegmentAtIndex:indexPath.item] :
        false;
}

- (void)collectionView:(UICollectionView *)collectionView moveItemAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath {
    if (self.dataSourseFlags.risingSegmentView_moveSegmentAtIndex_toIndex) {
        [self.dataSourse risingSegmentView:self moveSegmentAtIndex:sourceIndexPath.item toIndex:destinationIndexPath.item];
    }
}

#pragma mark - <UICollectionViewDelegateFlowLayout>

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(40, collectionView.height);
}

@end

@implementation UICollectionViewFlowLayout (RisingSegmentView)

+ (UICollectionViewFlowLayout *)defaultRisingSegmentViewFlowLayout {
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.minimumLineSpacing = 2;
    layout.minimumInteritemSpacing = 2;
    return layout;
}

@end
