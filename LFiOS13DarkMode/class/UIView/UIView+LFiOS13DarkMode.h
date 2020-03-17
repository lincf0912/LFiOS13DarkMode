//
//  UIView+LFiOS13DarkMode.h
//  LFiOS13DarkMode
//
//  Created by TsanFeng Lam on 2020/3/16.
//  Copyright © 2020 lfsampleprojects. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (LFiOS13DarkMode)

- (void(^)(UIColor *color))lf_iOS13BorderColor;

- (void(^)(UIColor *color))lf_iOS13ShadowColor;

- (void(^)(UIColor *color))lf_iOS13BackgroundColor;

@end

NS_ASSUME_NONNULL_END
