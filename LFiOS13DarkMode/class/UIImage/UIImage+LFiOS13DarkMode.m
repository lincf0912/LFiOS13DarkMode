//
//  UIImage+LFiOS13DarkMode.m
//  LFiOS13DarkMode
//
//  Created by TsanFeng Lam on 2020/3/16.
//  Copyright © 2020 lfsampleprojects. All rights reserved.
//

#import "UIImage+LFiOS13DarkMode.h"


@implementation UIImage (LFiOS13DarkMode)

#pragma mark - public
+ (UIImage *(^)(UIImage *image))lf_iOS13UnspecifiedImage
{
    return ^UIImage *(UIImage *image){
        return [self lf_imageWithiOS13DarkModeImage:image traitCollectionWithUserInterfaceStyle:UIUserInterfaceStyleUnspecified];
    };
}

+ (UIImage *(^)(UIImage *image))lf_iOS13LightImage
{
    return ^UIImage *(UIImage *image){
        return [self lf_imageWithiOS13DarkModeImage:image traitCollectionWithUserInterfaceStyle:UIUserInterfaceStyleLight];
    };
}

+ (UIImage *(^)(UIImage *image))lf_iOS13DarkImage
{
    return ^UIImage *(UIImage *image){
        return [self lf_imageWithiOS13DarkModeImage:image traitCollectionWithUserInterfaceStyle:UIUserInterfaceStyleDark];
    };
}

- (UIImage *(^)(UIImage *image))lf_iOS13UnspecifiedImage
{
    return ^UIImage *(UIImage *image){
        return [self lf_setiOS13DarkModeImage:image traitCollectionWithUserInterfaceStyle:UIUserInterfaceStyleUnspecified];
    };
}

- (UIImage *(^)(UIImage *image))lf_iOS13LightImage
{
    return ^UIImage *(UIImage *image){
        return [self lf_setiOS13DarkModeImage:image traitCollectionWithUserInterfaceStyle:UIUserInterfaceStyleLight];
    };
}

- (UIImage *(^)(UIImage *image))lf_iOS13DarkImage
{
    return ^UIImage *(UIImage *image){
        return [self lf_setiOS13DarkModeImage:image traitCollectionWithUserInterfaceStyle:UIUserInterfaceStyleDark];
    };
}


#pragma mark - private
+ (UIImage *)lf_imageWithiOS13DarkModeImage:(UIImage *)image traitCollectionWithUserInterfaceStyle:(UIUserInterfaceStyle)userInterfaceStyle
{
    if (!image) {
        return nil;
    }
#if __IPHONE_13_0
    if (@available(iOS 13.0, *)) {
        UITraitCollection *traitCollection = [UITraitCollection traitCollectionWithUserInterfaceStyle:userInterfaceStyle];
        UIImage *image = UIImage.new;
        UIImage *pure = [image.imageAsset imageWithTraitCollection:traitCollection];
        [image.imageAsset registerImage:pure withTraitCollection:traitCollection];
        return image;
    } else {
#endif
        return image;
#if __IPHONE_13_0
    }
#endif
}

- (UIImage *)lf_setiOS13DarkModeImage:(UIImage *)image traitCollectionWithUserInterfaceStyle:(UIUserInterfaceStyle)userInterfaceStyle
{
    if (!image) {
        return self;
    }
#if __IPHONE_13_0
    if (@available(iOS 13.0, *)) {
        UITraitCollection *traitCollection = [UITraitCollection traitCollectionWithUserInterfaceStyle:userInterfaceStyle];
        UIImage *pure = [image.imageAsset imageWithTraitCollection:traitCollection];
        [self.imageAsset registerImage:pure withTraitCollection:traitCollection];
        return self;
    } else {
#endif
        return self;
#if __IPHONE_13_0
    }
#endif
}

@end
