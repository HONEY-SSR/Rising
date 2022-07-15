//
//  RisingBookCView.m
//  Rising
//
//  Created by SSR on 2022/7/14.
//

#import "RisingBookCView.h"

@implementation RisingBookCView

#pragma mark - Life cycle

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self.panGestureRecognizer addTarget:self action:@selector(risingBookCViewPan:)];
    }
    return self;
}

#pragma mark - Method

// MARK: SEL

- (void)risingBookCViewPan:(UIPanGestureRecognizer *)pan {
    
}

#pragma mark - Getter

#pragma mark - Setter



@end
