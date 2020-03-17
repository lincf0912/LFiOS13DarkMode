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

+ (UIImage *(^)(UIImage *image))lf_iOS13UnspecifiedImage;
+ (UIImage *(^)(UIImage *image))lf_iOS13LightImage;
+ (UIImage *(^)(UIImage *image))lf_iOS13DarkImage;

- (UIImage *(^)(UIImage *image))lf_iOS13UnspecifiedImage;
- (UIImage *(^)(UIImage *image))lf_iOS13LightImage;
- (UIImage *(^)(UIImage *image))lf_iOS13DarkImage;

@end

NS_ASSUME_NONNULL_END
