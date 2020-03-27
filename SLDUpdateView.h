//
//  SLDUpdateView.h
//  SLDToPay
//
//  Created by g on 3/26/20.
//  Copyright © 2020 ice. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
typedef void (^SLDActionSuccessBlock)(BOOL isSuccess);

@interface SLDUpdateView : UIView

/// 升级弹框
/// @param title 升级标题
/// @param des 升级内容
/// @param leftTitle 左边按钮
/// @param rightTitle 右边按钮
/// @param view 父控件
/// @param forcedUpdate 是否强制升级
/// @param clickBlock <#clickBlock description#>
+ (void)showTitle:(NSString *)title des:(NSMutableAttributedString *)des leftTitle:(NSString *)leftTitle rightTitle:(NSString *)rightTitle superView:(UIView *)view forcedUpdate:(BOOL)forcedUpdate clickBlock:(SLDActionSuccessBlock)clickBlock;

@end

NS_ASSUME_NONNULL_END
