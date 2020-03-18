//
//  ViewController.m
//  LFiOS13DarkMode
//
//  Created by TsanFeng Lam on 2020/3/16.
//  Copyright © 2020 lfsampleprojects. All rights reserved.
//

#import "ViewController.h"

#import "LFiOS13DarkModeHeader.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.lf_iOS13BackgroundColor(UIColor.lf_iOS13LightColor(UIColor.redColor).lf_iOS13DarkColor(UIColor.blueColor));
//    self.view.backgroundColor = UIColor.lf_iOS13SystemBackgroundColor(UIColor.blackColor);
//    CALayer *layer = [CALayer layer];
//    layer.frame = self.view.bounds;
//    layer.lf_iOS13BackgroundColor(UIColor.lf_iOS13LightColor(UIColor.redColor).lf_iOS13DarkColor(UIColor.blueColor));
//    [self.view.layer addSublayer:layer];
    
    self.imageView.image = UIImage.lf_iOS13LightImageName(@"IMG_6758").lf_iOS13DarkImageName(@"IMG_6759");
    
    
    NSLog(@"ok");
}


@end
