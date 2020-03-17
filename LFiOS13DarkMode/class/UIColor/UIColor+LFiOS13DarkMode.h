//
//  UIColor+LFiOS13DarkMode.h
//  LFiOS13DarkMode
//
//  Created by TsanFeng Lam on 2020/3/16.
//  Copyright © 2020 lfsampleprojects. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIColor (LFiOS13DarkMode)

+ (UIColor *(^)(UIColor *color))lf_iOS13LightColor;

+ (UIColor *(^)(UIColor *color))lf_iOS13DarkColor;

- (UIColor *(^)(UIColor *color))lf_iOS13LightColor;

- (UIColor *(^)(UIColor *color))lf_iOS13DarkColor;

@end

NS_ASSUME_NONNULL_END
