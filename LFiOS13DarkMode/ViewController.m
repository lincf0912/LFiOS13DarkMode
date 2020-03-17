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

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    CALayer *layer = [CALayer layer];
    layer.frame = self.view.bounds;
    layer.lf_iOS13BackgroundColor(UIColor.lf_iOS13LightColor(UIColor.redColor).lf_iOS13DarkColor(UIColor.blueColor));
    [self.view.layer addSublayer:layer];
    
    NSLog(@"ok");
}


@end
