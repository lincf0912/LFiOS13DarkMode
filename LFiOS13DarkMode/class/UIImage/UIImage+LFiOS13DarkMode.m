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
+ (UIImage *(^)(NSString *imageName))lf_iOS13UnspecifiedImageName
{
    return ^UIImage *(NSString *imageName){
        return self.lf_iOS13UnspecifiedImage([UIImage imageNamed:imageName]);
    };
}
+ (UIImage *(^)(NSString *imageName))lf_iOS13LightImageName
{
    return ^UIImage *(NSString *imageName){
        return self.lf_iOS13LightImage([UIImage imageNamed:imageName]);
    };
}
+ (UIImage *(^)(NSString *imageName))lf_iOS13DarkImageName
{
    return ^UIImage *(NSString *imageName){
        return self.lf_iOS13DarkImage([UIImage imageNamed:imageName]);
    };
}

- (UIImage *(^)(NSString *imageName))lf_iOS13UnspecifiedImageName
{
    return ^UIImage *(NSString *imageName){
        return self.lf_iOS13UnspecifiedImage([UIImage imageNamed:imageName]);
    };
}
- (UIImage *(^)(NSString *imageName))lf_iOS13LightImageName
{
    return ^UIImage *(NSString *imageName){
        return self.lf_iOS13LightImage([UIImage imageNamed:imageName]);
    };
}
- (UIImage *(^)(NSString *imageName))lf_iOS13DarkImageName
{
    return ^UIImage *(NSString *imageName){
        return self.lf_iOS13DarkImage([UIImage imageNamed:imageName]);
    };
}

+ (UIImage *(^)(UIImage *image))lf_iOS13UnspecifiedImage
{
    return ^UIImage *(UIImage *image){
        if (@available(iOS 12.0, *)) {
            return [self lf_imageWithiOS13DarkModeImage:image traitCollectionWithUserInterfaceStyle:UIUserInterfaceStyleUnspecified];
        } else {
            return image;
        }
    };
}

+ (UIImage *(^)(UIImage *image))lf_iOS13LightImage
{
    return ^UIImage *(UIImage *image){
        if (@available(iOS 12.0, *)) {
            return [self lf_imageWithiOS13DarkModeImage:image traitCollectionWithUserInterfaceStyle:UIUserInterfaceStyleLight];
        } else {
            return image;
        }
    };
}

+ (UIImage *(^)(UIImage *image))lf_iOS13DarkImage
{
    return ^UIImage *(UIImage *image){
        if (@available(iOS 12.0, *)) {
            return [self lf_imageWithiOS13DarkModeImage:image traitCollectionWithUserInterfaceStyle:UIUserInterfaceStyleDark];
        } else {
            return image;
        }
    };
}

- (UIImage *(^)(UIImage *image))lf_iOS13UnspecifiedImage
{
    return ^UIImage *(UIImage *image){
        if (@available(iOS 12.0, *)) {
            return [self lf_setiOS13DarkModeImage:image traitCollectionWithUserInterfaceStyle:UIUserInterfaceStyleUnspecified];
        } else {
            return image;
        }
    };
}

- (UIImage *(^)(UIImage *image))lf_iOS13LightImage
{
    return ^UIImage *(UIImage *image){
        if (@available(iOS 12.0, *)) {
            return [self lf_setiOS13DarkModeImage:image traitCollectionWithUserInterfaceStyle:UIUserInterfaceStyleLight];
        } else {
            return image;
        }
    };
}

- (UIImage *(^)(UIImage *image))lf_iOS13DarkImage
{
    return ^UIImage *(UIImage *image){
        if (@available(iOS 12.0, *)) {
            return [self lf_setiOS13DarkModeImage:image traitCollectionWithUserInterfaceStyle:UIUserInterfaceStyleDark];
        } else {
            return image;
        }
    };
}


#pragma mark - private
+ (UIImage *)lf_imageWithiOS13DarkModeImage:(UIImage *)image traitCollectionWithUserInterfaceStyle:(UIUserInterfaceStyle)userInterfaceStyle API_AVAILABLE(ios(12.0))
{
    if (!image) {
        return nil;
    }
#if __IPHONE_13_0
    if (@available(iOS 13.0, *)) {
        UITraitCollection *traitCollection = [UITraitCollection traitCollectionWithUserInterfaceStyle:userInterfaceStyle];
        UIImage *newImage = UIImage.new;
        UIImage *pure = [image.imageAsset imageWithTraitCollection:traitCollection];
        [newImage.imageAsset registerImage:pure withTraitCollection:traitCollection];
        return newImage;
    } else {
#endif
        return image;
#if __IPHONE_13_0
    }
#endif
}

- (UIImage *)lf_setiOS13DarkModeImage:(UIImage *)image traitCollectionWithUserInterfaceStyle:(UIUserInterfaceStyle)userInterfaceStyle API_AVAILABLE(ios(12.0))
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
