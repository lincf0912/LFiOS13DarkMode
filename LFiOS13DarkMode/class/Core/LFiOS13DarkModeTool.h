//
//  LFiOS13DarkModeTool.h
//  LFiOS13DarkMode
//
//  Created by TsanFeng Lam on 2020/3/17.
//  Copyright © 2020 lfsampleprojects. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LFiOS13DarkModeTool : NSObject

+ (void)lf_ExchangeClassMethodWithTargetCls:(Class)targetCls originalSelector:(SEL)originalSelector swizzledSelector:(SEL)swizzledSelector;
+ (void)lf_ExchangeMethodWithOriginalClass:(Class)originalClass swizzledClass:(Class)swizzledClass originalSelector:(SEL)originalSelector swizzledSelector:(SEL)swizzledSelector;

@end

NS_ASSUME_NONNULL_END
