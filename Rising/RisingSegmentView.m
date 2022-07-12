//
//  RisingSegmentView.m
//  Rising
//
//  Created by SSR on 2022/7/9.
//

#import "RisingSegmentView.h"

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

// !!!: 未完成

- (void)autoLeftWithAnimated:(BOOL)animated {
    
}

- (void)scrollToIndex:(NSInteger)index animated:(BOOL)animate {
    
}

// MARK: SEL

- (void)longPress:(UILongPressGestureRecognizer *)longPress {
    switch (longPress.state) {
        case UIGestureRecognizerStateBegan: {
            NSIndexPath *selectIndexPath = [self.cview indexPathForItemAtPoint:[longPress locationInView:self.cview]];
            
            // ???: 是否需要再回掉确定正在搞事情的cell
//            UICollectionViewCell *cell = [self.cview cellForItemAtIndexPath:selectIndexPath];
            
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
        _cview.delegate = self;
    }
    return _cview;
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
    _delegate = delegate;
    
    _delegateFlags.risingSegmentView_didSelectedAtIndex =
    [delegate performSelector:@selector(risingSegmentView:didSelectedAtIndex:)];
}

- (void)setDataSourse:(id<RisingSegmentViewDataSourse>)dataSourse {
    _dataSourse = dataSourse;
    _cview.dataSource = self;
    
    _dataSourseFlags.risingSegmentView_segmentViewAtIndex =
    [dataSourse performSelector:@selector(risingSegmentView:segmentViewAtIndex:)];
    
    _dataSourseFlags.risingSegmentView_canMoveSegmentAtIndex =
    [dataSourse performSelector:@selector(risingSegmentView:canMoveSegmentAtIndex:)];
    
    _dataSourseFlags.risingSegmentView_moveSegmentAtIndex_toIndex =
    [dataSourse performSelector:@selector(risingSegmentView:moveSegmentAtIndex:toIndex:)];
}

#pragma mark - <UICollectionViewDelegate>

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    if (self.delegateFlags.risingSegmentView_didSelectedAtIndex) {
        [self.delegate risingSegmentView:self didSelectedAtIndex:indexPath.row];
    }
}

- (NSIndexPath *)collectionView:(UICollectionView *)collectionView targetIndexPathForMoveFromItemAtIndexPath:(NSIndexPath *)currentIndexPath toProposedIndexPath:(NSIndexPath *)proposedIndexPath {
    return [NSIndexPath indexPathWithIndex:3];
}

#pragma mark - <UICollectionViewDataSource>

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 1;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"" forIndexPath:indexPath];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView moveItemAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath {
    
}

#pragma mark - <UICollectionViewDelegateFlowLayout>

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return self.size;
}

#pragma mark - <UIScrollViewDelegate>

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if () {
        <#statements#>
    }
}

@end
