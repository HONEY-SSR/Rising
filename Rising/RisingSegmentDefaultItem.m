//
//  RisingSegmentDefaultItem.m
//  Rising
//
//  Created by SSR on 2022/7/12.
//

#import "RisingSegmentDefaultItem.h"

#import "UIView+Frame.h"

NSString *RisingSegmentDefaultItemReuseIdentifier = @"RisingSegmentDefaultItem";

#pragma mark - RisingSegmentDefaultItem ()

@interface RisingSegmentDefaultItem ()

@property (nonatomic, strong) UILabel *titleLab;

@end

#pragma mark - RisingSegmentDefaultItem

@implementation RisingSegmentDefaultItem

#pragma mark - Life cycle

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self.contentView addSubview:self.titleLab];
    }
    return self;
}

#pragma mark - Method

- (void)applyLayoutAttributes:(UICollectionViewLayoutAttributes *)layoutAttributes {
    self.titleLab.size = self.contentView.size;
}

- (void)withTitle:(NSString *)title {
    self.titleLab.text = title;
}

// MARK: SEL

#pragma mark - Getter

- (UILabel *)titleLab {
    if (_titleLab == nil) {
        _titleLab = [[UILabel alloc] initWithFrame:CGRectZero];
    }
    return _titleLab;
}

#pragma mark - Setter



@end
