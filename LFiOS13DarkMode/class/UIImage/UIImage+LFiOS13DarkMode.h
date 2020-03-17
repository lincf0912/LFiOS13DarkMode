//
//  UIImage+LFiOS13DarkMode.h
//  LFiOS13DarkMode
//
//  Created by TsanFeng Lam on 2020/3/16.
//  Copyright © 2020 lfsampleprojects. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (LFiOS13DarkMode)

+ (UIImage *(^)(UIImage *image))lf_imageWithUnspecifiedImage;
+ (UIImage *(^)(UIImage *image))lf_imageWithLightImage;
+ (UIImage *(^)(UIImage *image))lf_imageWithDarkImage;

- (UIImage *(^)(UIImage *image))lf_setUnspecifiedImage;
- (UIImage *(^)(UIImage *image))lf_setLightImage;
- (UIImage *(^)(UIImage *image))lf_setDarkImage;

@end

NS_ASSUME_NONNULL_END
