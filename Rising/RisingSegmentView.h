//
//  RisingSegmentView.h
//  Rising
//
//  Created by SSR on 2022/7/9.
//

/**
 * 绑定TableView可实现Section级别联动（竖向）
 * 绑定CollectionView可实现Scroll级别联动（横向）
 */

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class RisingSegmentView;

#pragma mark - RisingSegmentViewDelegate

@protocol RisingSegmentViewDelegate <NSObject>

@optional

/// 选中了第几个视图（可实现滑动到此index）
/// @param view 当前view
/// @param index 第几个视图
- (void)risingSegmentView:(RisingSegmentView *)view didSelectedAtIndex:(NSInteger)index;

@end

#pragma mark - RisingSegmentViewDataSourse

@protocol RisingSegmentViewDataSourse <NSObject>

@required

/// 多少个segment
/// @param view 当前view
- (NSInteger)numberOfSegmentIn:(RisingSegmentView *)view;

/// 如果实现了segmentView，那这个就不会被调用，但作为基本实现，这个必须实现
/// @param view 当前view
/// @param index view在index的位置
- (NSString *)risingSegmentView:(RisingSegmentView *)view titleForSegmentViewAtIndex:(NSInteger)index;

@optional

/// 实现了，就不会掉用titleForSegmentViewAtIndex
/// @param view 当前view
/// @param index 所在index
- (__kindof UICollectionViewCell *)risingSegmentView:(RisingSegmentView *)view segmentViewAtIndex:(NSInteger)index;

/// 默认为NO，实现后，可实现拖拽改变segment位置
/// @param view 当前view
/// @param index 所在index
- (BOOL)risingSegmentView:(RisingSegmentView *)view canMoveSegmentAtIndex:(NSInteger)index;

/// 实现以达到sourse和view一致，或是要上传当前的一个信息
/// @param view 当前view
/// @param sourceIndex 以前的index，需要转换到新的
/// @param destinationIndex 新的index
- (void)risingSegmentView:(RisingSegmentView *)view moveSegmentAtIndex:(NSInteger)sourceIndex toIndex:(NSInteger)destinationIndex;

@end

#pragma mark - RisingSegmentView

@interface RisingSegmentView : UIView

/// delegate代理
@property (nonatomic, weak) id <RisingSegmentViewDelegate> delegate;

/// datasourse代理
@property (nonatomic, weak) id <RisingSegmentViewDataSourse> dataSourse;

/// 绑定一个ScrollView，绑定TableView会以Section为主，绑定CollectionView直接以横向为主
@property (nonatomic, weak) UIScrollView *bindScrollView;

/// 会跟随一起改变
@property (nonatomic, strong, null_resettable) UIView *backgroundView;

/// 是否跟随绑定的而行走，默认YES，会让bindScrollView同时scroll
@property (nonatomic) BOOL bindScrollAutoScroll;

/// 选中的视图最左边距离自己 本身最大距离（当然条件是可以滑动（才看得出效果））
/// 同时注意，当自己作为Scroll滑了后，再滑bindScroll会导致自己并没做出反应
/// 请在合适的地方掉用autoLeftWithAnimated:
@property (nonatomic) CGFloat selectedAutoLeft;

// MARK: Life cycle

- (instancetype)init NS_UNAVAILABLE;

- (instancetype)initWithFrame:(CGRect)frame NS_UNAVAILABLE;

+ (instancetype)new NS_UNAVAILABLE;

// MARK: Method

/// 根据frame和layout确定
/// @param frame 自己的大小，也是collectionview的大小
/// @param layout collectionview的高级布局形式
- (instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout;

/// 自动滑到seletedIndex的selectedAutoLeft位置
/// @param animated 是否需要动画
- (void)autoLeftWithAnimated:(BOOL)animated;

/// 滑动到第index个，同时会call代理，绑定会自动scroll
/// @param index 第几个
/// @param animate 是否需要动画
- (void)scrollToIndex:(NSInteger)index animated:(BOOL)animate;

@end

#pragma mark - UICollectionViewFlowLayout (RisingSegmentView)

@interface UICollectionViewFlowLayout (RisingSegmentView)

/// 正常的一个flowlayout形式
@property (nonatomic, readonly, class) UICollectionViewFlowLayout *defaultRisingSegmentViewFlowLayout;

@end

NS_ASSUME_NONNULL_END
