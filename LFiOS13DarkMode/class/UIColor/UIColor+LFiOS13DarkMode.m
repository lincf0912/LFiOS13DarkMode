//
//  UIColor+LFiOS13DarkMode.m
//  LFiOS13DarkMode
//
//  Created by TsanFeng Lam on 2020/3/16.
//  Copyright © 2020 lfsampleprojects. All rights reserved.
//

#import "UIColor+LFiOS13DarkMode.h"
#import "LFiOS13DarkModeDefine.h"
#import <objc/runtime.h>

@implementation UIColor (LFiOS13DarkMode)

+ (UIColor *(^)(UIColor *color))lf_iOS13LightColor
{
    return ^UIColor *(UIColor *color){
        if (!color) {
            return nil;
        }
        objc_setAssociatedObject(color, _LFiOS13DarkMode_LightColor_Key, color, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        return [color lf_createiOS13DarkModeColor];
    };
}

+ (UIColor *(^)(UIColor *color))lf_iOS13DarkColor {
    return ^UIColor *(UIColor *color){
        if (!color) {
            return nil;
        }
        objc_setAssociatedObject(color, _LFiOS13DarkMode_DarkColor_Key, color, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        return [color lf_createiOS13DarkModeColor];
    };
}

- (UIColor *(^)(UIColor *color))lf_iOS13LightColor {
    return ^UIColor *(UIColor *color){
        if (!color) {
            return nil;
        }
        objc_setAssociatedObject(self, _LFiOS13DarkMode_LightColor_Key, color, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        return [self lf_createiOS13DarkModeColor];
    };
}

- (UIColor *(^)(UIColor *color))lf_iOS13DarkColor {
    return ^UIColor *(UIColor *color){
        if (!color) {
            return nil;
        }
        objc_setAssociatedObject(self, _LFiOS13DarkMode_DarkColor_Key, color, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        return [self lf_createiOS13DarkModeColor];
    };
}


#pragma mark - private
- (UIColor *)lf_createiOS13DarkModeColor {
    UIColor *lightColor = objc_getAssociatedObject(self, _LFiOS13DarkMode_LightColor_Key);
    UIColor *darkColor = objc_getAssociatedObject(self, _LFiOS13DarkMode_DarkColor_Key);
    if (!lightColor) lightColor = darkColor;
    if (!darkColor) darkColor = lightColor;
#if __IPHONE_13_0
    if (@available(iOS 13.0, *)) {
        UIColor *dynamicColor = [UIColor colorWithDynamicProvider:^UIColor * _Nonnull(UITraitCollection * _Nonnull traitCollection) {
            if (traitCollection.userInterfaceStyle == UIUserInterfaceStyleDark) {
                return [darkColor resolvedColorWithTraitCollection:traitCollection];
            } else {
                return [lightColor resolvedColorWithTraitCollection:traitCollection];
            }
        }];
        objc_setAssociatedObject(self, _LFiOS13DarkMode_LightColor_Key, nil, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        objc_setAssociatedObject(self, _LFiOS13DarkMode_DarkColor_Key, nil, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        objc_setAssociatedObject(dynamicColor, _LFiOS13DarkMode_LightColor_Key, lightColor, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        objc_setAssociatedObject(dynamicColor, _LFiOS13DarkMode_DarkColor_Key, darkColor, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        return dynamicColor;
    } else {
#endif
        objc_setAssociatedObject(self, _LFiOS13DarkMode_LightColor_Key, nil, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        objc_setAssociatedObject(self, _LFiOS13DarkMode_DarkColor_Key, nil, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        return lightColor;
#if __IPHONE_13_0
    }
#endif
}



@end
