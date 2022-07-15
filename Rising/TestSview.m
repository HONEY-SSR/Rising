//
//  TestSview.m
//  Rising
//
//  Created by SSR on 2022/7/14.
//

#import "TestSview.h"

#import "RisingFoundationExtention.h"

#pragma mark - TestSview ()

@interface TestSview ()

@property (nonatomic) CGPoint oldPanPoint;

@property (nonatomic) BOOL isScroll;

@property (nonatomic) BOOL isHScroll;

@property (nonatomic) CGSize currentContentSize;

@property (nonatomic) CGFloat aConten;
 
@end

@implementation TestSview

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self.panGestureRecognizer addTarget:self action:@selector(pan:)];
    }
    return self;
}

- (void)setContentSize:(CGSize)contentSize {
    [super setContentSize:contentSize];
    self.currentContentSize = contentSize;
}

- (void)pan:(UIPanGestureRecognizer *)pan {
    if (pan.state == UIGestureRecognizerStateBegan) {
        self.oldPanPoint = [pan locationInView:self];
    }
    if (pan.state == UIGestureRecognizerStateChanged) {
        CGPoint newP = [pan locationInView:self];
        if (!self.isScroll) {

            CGFloat xm = fabs(newP.x - self.oldPanPoint.x);
            CGFloat ym = fabs(newP.y - self.oldPanPoint.y);
            self.isHScroll = (xm - ym) > 0;
            
            self.isScroll = YES;
            if (self.isHScroll) {
                RisingLog(R_warning, @"横");
                self.aConten = self.contentOffset.y;
                [super setContentSize:CGSizeMake(self.currentContentSize.width, 0)];
                
            } else {
                RisingLog(R_warning, @"竖");
                self.aConten = self.contentOffset.x;
                [super setContentSize:CGSizeMake(0, self.currentContentSize.height)];
            }
        }
        if (self.isHScroll) {
            [self setContentOffset:CGPointMake(self.contentOffset.x, self.aConten)];
        } else {
            [self setContentOffset:CGPointMake(self.aConten, self.contentOffset.y)];
        }
    }
    if (pan.state == UIGestureRecognizerStateEnded ||
        pan.state == UIGestureRecognizerStateCancelled) {
        self.isScroll = NO;
        [super setContentSize:self.currentContentSize];
        RisingLog(R_error, @"ended:%@", NSStringFromCGSize(self.contentSize));
    }
}



//- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//    self.oldP = [touches.anyObject locationInView:self];
//}
//
//- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//    CGPoint newP = [touches.anyObject locationInView:self];
//    if (!self.isScroll) {
//        self.HScroll = fabs(newP.x - self.oldP.x) > fabs(newP.y - self.oldP.y);
//        self.isScroll = YES;
//    }
//    if (self.HScroll) {
//        self.contentOffset = CGPointMake(self.contentOffset.x + self.oldP.x - newP.x, self.contentOffset.y);
//    } else {
//        self.contentOffset = CGPointMake(self.contentOffset.x, self.contentOffset.y + self.oldP.y - newP.y);
//    }
//}
//
//- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//    self.isScroll = NO;
//}

@end
