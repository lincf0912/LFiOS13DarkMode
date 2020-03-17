//
//  _LFiOS13DarkMode_MonitorView.m
//  LFiOS13DarkMode
//
//  Created by TsanFeng Lam on 2020/3/16.
//  Copyright © 2020 lfsampleprojects. All rights reserved.
//

#import "_LFiOS13DarkMode_MonitorView.h"

NSString *const _LFiOS13DarkMode_MonitorView_callbackList = @"_LFiOS13DarkMode_MonitorView_callbackList";
NSString *const _LFiOS13DarkMode_MonitorView_callbackMap = @"_LFiOS13DarkMode_MonitorView_callbackMap";

@interface _LFiOS13DarkMode_MonitorView ()

@property (nonatomic, copy) NSMapTable <NSString *, id> *callObjectMap;

@end

@implementation _LFiOS13DarkMode_MonitorView

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        [self customInit];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self customInit];
    }
    return self;
}

- (void)customInit
{
    self.hidden = YES;
    _callObjectMap = [NSMapTable mapTableWithKeyOptions:NSPointerFunctionsWeakMemory valueOptions:NSPointerFunctionsStrongMemory];
}

- (void)traitCollectionDidChange:(UITraitCollection *)previousTraitCollection {
    [super traitCollectionDidChange:previousTraitCollection];
#if __IPHONE_13_0
    if (@available(iOS 13.0, *)) {
        if([self.traitCollection hasDifferentColorAppearanceComparedToTraitCollection:previousTraitCollection]) {
            
            for (id object in self.callObjectMap) {
                NSMutableDictionary *list = [self.callObjectMap objectForKey:object];
                NSMutableArray *callbackList = [list objectForKey:_LFiOS13DarkMode_MonitorView_callbackList];
                for (_LFiOS13DarkMode_MonitorView_TraitCollectionCallback callback in callbackList) {
                    callback(self);
                }
            }
        }
    }
#endif
}

#pragma mark - public
- (void)setTraitCollectionChange:(_LFiOS13DarkMode_MonitorView_TraitCollectionCallback)callback forKey:(NSString *)key forObject:(id)object
{
    NSMutableDictionary *list = [self.callObjectMap objectForKey:object];
    if (list == nil) {
        list = [NSMutableDictionary dictionary];
        [list setObject:[NSMutableDictionary dictionary] forKey:_LFiOS13DarkMode_MonitorView_callbackMap];
        [list setObject:[NSMutableArray array] forKey:_LFiOS13DarkMode_MonitorView_callbackList];
        [self.callObjectMap setObject:list forKey:object];
    }
    
    NSMutableDictionary *callbackMap = [list objectForKey:_LFiOS13DarkMode_MonitorView_callbackMap];
    NSMutableArray *callbackList = [list objectForKey:_LFiOS13DarkMode_MonitorView_callbackList];
    
    _LFiOS13DarkMode_MonitorView_TraitCollectionCallback oldCallback = [callbackMap objectForKey:key];
    if (oldCallback) {
        [callbackList removeObject:oldCallback];
        [callbackMap removeObjectForKey:key];
        oldCallback = nil;
    }
    if (callback) {
        [callbackList addObject:callback];
        [callbackMap setObject:callback forKey:key];
    }
    
    if (callbackList.count == 0) {
        [self.callObjectMap removeObjectForKey:object];
    }
}

@end
