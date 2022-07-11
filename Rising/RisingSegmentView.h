//
//  RisingSegmentView.h
//  Rising
//
//  Created by SSR on 2022/7/9.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class RisingSegmentView;

#pragma mark - RisingSegmentViewDelegate

@protocol RisingSegmentViewDelegate <NSObject>



@end

#pragma mark - RisingSegmentView

@interface RisingSegmentView : UIView

- (instancetype)init NS_UNAVAILABLE;

- (instancetype)initWithFrame:(CGRect)frame NS_UNAVAILABLE;

+ (instancetype)new NS_UNAVAILABLE;

/// 根据frame和layout确定
/// @param frame 自己的大小，也是collectionview的大小
/// @param layout collectionview的高级布局形式
- (instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout;

/// 会跟随一起改变
@property (nonatomic, strong, null_resettable) UIView *backgroundView;

@end

#pragma mark - UICollectionViewFlowLayout (RisingSegmentView)

@interface UICollectionViewFlowLayout (RisingSegmentView)

/// 正常的一个flowlayout形式
@property (nonatomic, readonly, class) UICollectionViewFlowLayout *defaultRisingSegmentViewFlowLayout;

@end

NS_ASSUME_NONNULL_END
