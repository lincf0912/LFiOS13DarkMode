//
//  CALayer+LFiOS13DarkMode.m
//  LFiOS13DarkMode
//
//  Created by TsanFeng Lam on 2020/3/16.
//  Copyright © 2020 lfsampleprojects. All rights reserved.
//

#import "CALayer+LFiOS13DarkMode.h"
#import "UIView+_LFiOS13DarkMode_MonitorView.h"
#import "_LFiOS13DarkMode_MonitorView.h"
#import "LFiOS13DarkModeDefine.h"
#import "LFiOS13DarkModeTool.h"
#import <UIKit/UIKit.h>
#import <objc/runtime.h>

@interface CALayer (LFiOS13DarkModePrivate)

- (id)lf_iOS13KVOSupperLayer;

- (void)lf_setiOS13KVOSupperLayer:(id __nullable)object;

@end

typedef void(^lf_iOS13DarkModeLayerKVOCallback)(CALayer *layer);

@interface LFiOS13DarkModeLayerKVO : NSObject

@property (nonatomic, copy) lf_iOS13DarkModeLayerKVOCallback callback;
@property (nonatomic, weak) CALayer *layer;

@end

@implementation LFiOS13DarkModeLayerKVO

- (void)dealloc
{
    
}

- (void)removeKVOSupperLayer:(CALayer *)layer
{
    self.callback = nil;
    if (self.layer && self.layer == layer) {
        [LFiOS13DarkModeTool lf_ExchangeMethodWithOriginalClass:self.class swizzledClass:CALayer.class originalSelector:@selector(lf_iOS13DarkMode_addSublayer:) swizzledSelector:@selector(addSublayer:)];
        self.layer = nil;
    }
}

- (void)addKVOSupperLayer:(CALayer *)layer complete:(lf_iOS13DarkModeLayerKVOCallback)complete
{
    if (self.layer != layer) {
        [self removeKVOSupperLayer:self.layer];
        self.layer = layer;
        [LFiOS13DarkModeTool lf_ExchangeMethodWithOriginalClass:layer.class swizzledClass:self.class originalSelector:@selector(addSublayer:) swizzledSelector:@selector(lf_iOS13DarkMode_addSublayer:)];
    }
    self.callback = complete;
}

- (void)lf_iOS13DarkMode_addSublayer:(CALayer *)layer
{
    [self lf_iOS13DarkMode_addSublayer:layer];
    LFiOS13DarkModeLayerKVO *object = [layer lf_iOS13KVOSupperLayer];
    if (object && object.layer == layer) {
        if (object.callback) {
            object.callback(layer);
        }
    }
}

@end

@implementation CALayer (LFiOS13DarkMode)

static const char * _LFiOS13DarkMode_LayerView_Key = "_LFiOS13DarkMode_LayerView_Key";
static const char * _LFiOS13DarkMode_LayerKVO_Key = "_LFiOS13DarkMode_LayerKVO_Key";

- (id)lf_iOS13KVOSupperLayer
{
    return objc_getAssociatedObject(self, _LFiOS13DarkMode_LayerKVO_Key);
}

- (void)lf_setiOS13KVOSupperLayer:(id __nullable)object
{
    objc_setAssociatedObject(self, _LFiOS13DarkMode_LayerKVO_Key, object, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

#pragma mark - public
- (void(^)(UIColor *color))lf_iOS13BorderColor {
    return ^(UIColor *color){
        UIView *view = [self lf_iOS13DarkMode_TopLayerView];
        objc_setAssociatedObject(self, _LFiOS13DarkMode_LayerBorderColor_Key, color, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        if (view) {
            [self lf_executeiOS13DarkModeLayerColor];
        } else {
            self.borderColor = color.CGColor;
        }
    };
}

- (void(^)(UIColor *color))lf_iOS13ShadowColor {
    return ^(UIColor *color){
        UIView *view = [self lf_iOS13DarkMode_TopLayerView];
        objc_setAssociatedObject(self, _LFiOS13DarkMode_LayerShadowColor_Key, color, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        if (view) {
            [self lf_executeiOS13DarkModeLayerColor];
        } else {
            self.shadowColor = color.CGColor;
        }
    };
}

- (void(^)(UIColor *color))lf_iOS13BackgroundColor {
    return ^(UIColor *color){
        UIView *view = [self lf_iOS13DarkMode_TopLayerView];
        objc_setAssociatedObject(self, _LFiOS13DarkMode_LayerBackgroundColor_Key, color, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        if (view) {
            [self lf_executeiOS13DarkModeLayerColor];
        } else {
            self.backgroundColor = color.CGColor;
        }
    };
}

#pragma mark - private
- (void)lf_executeiOS13DarkModeLayerColor {
    
    UIView *view = [self lf_iOS13DarkMode_TopLayerView];
    
    if (!view) {
        return;
    }
    
    UIColor *borderColor = objc_getAssociatedObject(self, _LFiOS13DarkMode_LayerBorderColor_Key);
    [self lf_setiOS13DarkModeColor:borderColor forProperty:@"borderColor" withView:view];
    objc_setAssociatedObject(self, _LFiOS13DarkMode_LayerBorderColor_Key, nil, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
    UIColor *shadowColor = objc_getAssociatedObject(self, _LFiOS13DarkMode_LayerShadowColor_Key);
    [self lf_setiOS13DarkModeColor:shadowColor forProperty:@"shadowColor" withView:view];
    objc_setAssociatedObject(self, _LFiOS13DarkMode_LayerShadowColor_Key, nil, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
    UIColor *backgroundColor = objc_getAssociatedObject(self, _LFiOS13DarkMode_LayerBackgroundColor_Key);
    [self lf_setiOS13DarkModeColor:backgroundColor forProperty:@"backgroundColor" withView:view];
    objc_setAssociatedObject(self, _LFiOS13DarkMode_LayerBackgroundColor_Key, nil, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIView *)lf_iOS13DarkMode_TopLayerView
{
    UIView *view = objc_getAssociatedObject(self, _LFiOS13DarkMode_LayerView_Key);
    if (!view) {
        view = [self lf_iOS13DarkMode_FindLayerView];
    }
    
    if (!view && ![self lf_iOS13KVOSupperLayer]) {
        LFiOS13DarkModeLayerKVO *object = [LFiOS13DarkModeLayerKVO new];
        __weak typeof(self) weakSelf = self;
        __weak typeof(object) weakObject = object;
        [object addKVOSupperLayer:self complete:^(CALayer *layer) {
            if ([layer lf_iOS13DarkMode_FindLayerView]) {
                [weakSelf lf_executeiOS13DarkModeLayerColor];
                [weakObject removeKVOSupperLayer:weakSelf];
                [weakSelf lf_setiOS13KVOSupperLayer:nil];
            }
        }];
        [self lf_setiOS13KVOSupperLayer:object];
    }
    
    objc_setAssociatedObject(self, _LFiOS13DarkMode_LayerView_Key, view, OBJC_ASSOCIATION_ASSIGN);
    return view;
}

- (UIView *)lf_iOS13DarkMode_FindLayerView
{
    CALayer *layer = self;
    while (![layer.delegate isKindOfClass:[UIView class]]) {
        layer = layer.superlayer;
        if (!layer) {
            break;
        }
    }
    if ([layer.delegate isKindOfClass:[UIView class]]) {
        return (UIView *)layer.delegate;
    }
    return nil;
}

- (void)lf_setiOS13DarkModeColor:(UIColor *)color forProperty:(NSString *)property withView:(UIView *)contentView {
    
    if (property.length == 0) {
        return;
    }
    
    NSString *proSetStr = [NSString stringWithFormat:@"set%@:",[property stringByReplacingCharactersInRange:NSMakeRange(0,1) withString:[[property substringToIndex:1] capitalizedString]]];
    SEL proSetSel = NSSelectorFromString(proSetStr);
    
    __weak typeof(self) weakSelf = self;
    __weak typeof(contentView) weakContentView = contentView;
    if ([self respondsToSelector:proSetSel]) {
#if __IPHONE_13_0
        if (@available(iOS 13.0, *)) {
            
            if (color) {
                [contentView.lf_iOS13DrakMove_MonitorView setTraitCollectionChange:^(UIView * _Nonnull view) {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
                    [weakSelf performSelector:proSetSel withObject:(id)[color resolvedColorWithTraitCollection:weakContentView.traitCollection].CGColor];
#pragma clang diagnostic pop
                } forKey:property forObject:self];
            } else {
                [contentView.lf_iOS13DrakMove_MonitorView setTraitCollectionChange:nil forKey:property forObject:self];
            }
            
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
            [self performSelector:proSetSel withObject:(id)[color resolvedColorWithTraitCollection:contentView.traitCollection].CGColor];
#pragma clang diagnostic pop
        } else {
#endif
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
            [self performSelector:proSetSel withObject:(id)color.CGColor];
#pragma clang diagnostic pop
#if __IPHONE_13_0
        }
#endif
    }
}

#pragma mark - supper view


@end
