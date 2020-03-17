//
//  _LFiOS13DarkMode_MonitorView.h
//  LFiOS13DarkMode
//
//  Created by TsanFeng Lam on 2020/3/16.
//  Copyright © 2020 lfsampleprojects. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void (^_LFiOS13DarkMode_MonitorView_TraitCollectionCallback)(UIView *view);

@interface _LFiOS13DarkMode_MonitorView : UIView

- (void)setTraitCollectionChange:(_LFiOS13DarkMode_MonitorView_TraitCollectionCallback __nullable)callback forKey:(NSString *)key forObject:(id)object;

@end

NS_ASSUME_NONNULL_END
