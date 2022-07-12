//
//  RisingUIKitExtention.h
//  Rising
//
//  Created by SSR on 2022/7/11.
//

#import <UIKit/UIKit.h>

#ifndef RisingUIKitExtention_h
#define RisingUIKitExtention_h

UIKIT_STATIC_INLINE NSIndexPath *IndexPathForRange(NSRange range) {
    return [NSIndexPath indexPathForItem:range.length inSection:range.location];
}

@interface UIApplication (Rising)

@property (nonatomic, readonly, class) UIViewController *topViewController;

+ (UIViewController *)topViewControllerWithBase:(UIViewController *)VC;

@end

#endif /* RisingUIKitExtention_h */
