//
//  LFiOS13DarkModeTool.m
//  LFiOS13DarkMode
//
//  Created by TsanFeng Lam on 2020/3/17.
//  Copyright © 2020 lfsampleprojects. All rights reserved.
//

#import "LFiOS13DarkModeTool.h"
#import <objc/runtime.h>

@implementation LFiOS13DarkModeTool

+ (void)lf_ExchangeClassMethodWithTargetCls:(Class)targetCls originalSelector:(SEL)originalSelector swizzledSelector:(SEL)swizzledSelector {
    [self lf_ExchangeMethodWithOriginalClass:targetCls swizzledClass:targetCls originalSelector:originalSelector swizzledSelector:swizzledSelector];
}

+ (void)lf_ExchangeMethodWithOriginalClass:(Class)originalClass swizzledClass:(Class)swizzledClass originalSelector:(SEL)originalSelector swizzledSelector:(SEL)swizzledSelector
{
    Method originalMethod = class_getInstanceMethod(originalClass, originalSelector);
    Method swizzledMethod = class_getInstanceMethod(swizzledClass, swizzledSelector);
    
    if (!originalMethod || !swizzledMethod) {
        return;
    }
    
    IMP originalIMP = method_getImplementation(originalMethod);
    IMP swizzledIMP = method_getImplementation(swizzledMethod);
    const char *originalType = method_getTypeEncoding(originalMethod);
    const char *swizzledType = method_getTypeEncoding(swizzledMethod);
    
    class_replaceMethod(originalClass,swizzledSelector,originalIMP,originalType);
    class_replaceMethod(originalClass,originalSelector,swizzledIMP,swizzledType);
}

@end
