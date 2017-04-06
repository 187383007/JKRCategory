//
//  UIViewController+JKRStatusBarHidden.m
//  JKRSearchDemo
//
//  Created by Lucky on 2016/4/5.
//  Copyright © 2016年 Lucky. All rights reserved.
//

#import "UIViewController+JKRStatusBarHidden.h"
#import <objc/runtime.h>

@implementation UIViewController (JKRStatusBarHidden)

- (void)setJkr_lightStatusBar:(BOOL)jkr_lightStatusBar {
    objc_setAssociatedObject(self, @"JKR_STATUS_LIGHT", [NSNumber numberWithInt:jkr_lightStatusBar], OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    [self preferredStatusBarStyle];
    [self setNeedsStatusBarAppearanceUpdate];
}

- (BOOL)jkr_lightStatusBar {
    return objc_getAssociatedObject(self, @"JKR_STATUS_LIGHT") ? [objc_getAssociatedObject(self, @"JKR_STATUS_LIGHT") boolValue] : NO;
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return self.jkr_lightStatusBar ? UIStatusBarStyleLightContent : UIStatusBarStyleDefault;
}

@end
