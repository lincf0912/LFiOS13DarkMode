//
//  UIView+LFiOS13DarkMode.m
//  LFiOS13DarkMode
//
//  Created by TsanFeng Lam on 2020/3/16.
//  Copyright © 2020 lfsampleprojects. All rights reserved.
//

#import "UIView+LFiOS13DarkMode.h"
#import "UIView+_LFiOS13DarkMode_MonitorView.h"
#import "_LFiOS13DarkMode_MonitorView.h"

@implementation UIView (LFiOS13DarkMode)

#pragma mark - public
- (void(^)(UIColor *color))lf_iOS13BorderColor {
    return ^(UIColor *color){
        [self lf_setiOS13DarkModeColor:color forProperty:@"borderColor"];
    };
}

- (void(^)(UIColor *color))lf_iOS13ShadowColor {
    return ^(UIColor *color){
        [self lf_setiOS13DarkModeColor:color forProperty:@"shadowColor"];
    };
}

- (void(^)(UIColor *color))lf_iOS13BackgroundColor {
    return ^(UIColor *color){
        [self lf_setiOS13DarkModeColor:color forProperty:@"backgroundColor"];
    };
}

#pragma mark - private
- (void)lf_setiOS13DarkModeColor:(UIColor *)color forProperty:(NSString *)property {
    
    if (property.length == 0) {
        return;
    }
    
    NSString *proSetStr = [NSString stringWithFormat:@"set%@:",[property stringByReplacingCharactersInRange:NSMakeRange(0,1) withString:[[property substringToIndex:1] capitalizedString]]];
    SEL proSetSel = NSSelectorFromString(proSetStr);
    
    __weak typeof(self) weakView = self;
    if ([self.layer respondsToSelector:proSetSel]) {
#if __IPHONE_13_0
        if (@available(iOS 13.0, *)) {
            
            if (color) {
                [self.lf_iOS13DrakMove_MonitorView setTraitCollectionChange:^(UIView * _Nonnull view) {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
                    [weakView.layer performSelector:proSetSel withObject:(id)[color resolvedColorWithTraitCollection:weakView.traitCollection].CGColor];
#pragma clang diagnostic pop
                } forKey:property forObject:self];
            } else {
                [self.lf_iOS13DrakMove_MonitorView setTraitCollectionChange:nil forKey:property forObject:self];
            }
            
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
            [self.layer performSelector:proSetSel withObject:(id)[color resolvedColorWithTraitCollection:self.traitCollection].CGColor];
#pragma clang diagnostic pop
        } else {
#endif
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
            [self.layer performSelector:proSetSel withObject:(id)color.CGColor];
#pragma clang diagnostic pop
#if __IPHONE_13_0
        }
#endif
    }
}

@end
