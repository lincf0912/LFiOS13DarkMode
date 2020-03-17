//
//  UIView+_LFiOS13DarkMode_MonitorView.m
//  LFiOS13DarkMode
//
//  Created by TsanFeng Lam on 2020/3/16.
//  Copyright © 2020 lfsampleprojects. All rights reserved.
//

#import "UIView+_LFiOS13DarkMode_MonitorView.h"
#import <objc/runtime.h>
#import "_LFiOS13DarkMode_MonitorView.h"

@implementation UIView (_LFiOS13DarkMode_MonitorView)

static const char * _LFiOS13DarkMode_MonitorView_Key = "_LFiOS13DarkMode_MonitorView_Key";

- (_LFiOS13DarkMode_MonitorView *)lf_iOS13DrakMove_MonitorView
{
    _LFiOS13DarkMode_MonitorView *monitorView = objc_getAssociatedObject(self, _LFiOS13DarkMode_MonitorView_Key);
    if (monitorView == nil) {
        monitorView = [_LFiOS13DarkMode_MonitorView new];
        monitorView.hidden = YES;
        [self insertSubview:monitorView atIndex:0];
        objc_setAssociatedObject(self, _LFiOS13DarkMode_MonitorView_Key, monitorView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return monitorView;
}

- (void)setLf_iOS13DrakMove_MonitorView:(_LFiOS13DarkMode_MonitorView *)lf_iOS13DrakMove_MonitorView
{
    _LFiOS13DarkMode_MonitorView *old_monitorView = objc_getAssociatedObject(self, _LFiOS13DarkMode_MonitorView_Key);
    if (lf_iOS13DrakMove_MonitorView != old_monitorView) {
        [old_monitorView removeFromSuperview];
        lf_iOS13DrakMove_MonitorView.hidden = YES;
        [self insertSubview:lf_iOS13DrakMove_MonitorView atIndex:0];
        objc_setAssociatedObject(self, _LFiOS13DarkMode_MonitorView_Key, lf_iOS13DrakMove_MonitorView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
}

@end
