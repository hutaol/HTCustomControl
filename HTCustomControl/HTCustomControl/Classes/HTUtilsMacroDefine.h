//
//  HTUtilsMacroDefine.h
//  HTCustomControl
//
//  Created by Henry on 2019/3/11.
//  Copyright © 2019 Henry. All rights reserved.
//

#ifndef HTUtilsMacroDefine_h
#define HTUtilsMacroDefine_h

NS_INLINE BOOL ht_isIPhoneX() {
    return (CGSizeEqualToSize([UIScreen mainScreen].bounds.size, CGSizeMake(375, 812)) ||
            CGSizeEqualToSize([UIScreen mainScreen].bounds.size, CGSizeMake(812, 375)) ||
            CGSizeEqualToSize([UIScreen mainScreen].bounds.size, CGSizeMake(414, 896)) ||
            CGSizeEqualToSize([UIScreen mainScreen].bounds.size, CGSizeMake(896, 414)));
}

// 主窗口的宽、高
#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height

// 是否是ipad
#define IS_IPAD (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)

// 判断刘海屏 iPhoneX iPhoneXr iPhoneXs iPhoneXsMax
#define IS_IPHONE_X ht_isIPhoneX()

#define kHeight_StatusBar (IS_IPHONE_X ? 44.0 : 20.0)
#define kHeight_NavBar (IS_IPHONE_X ? 88.0 : 64.0)
#define kHeight_TabBar (IS_IPHONE_X ? 83.0 : 49.0)

#define kHeight_SafeBottom (IS_IPHONE_X ? 34.0 : 0.0)

// 简单信息提示
#define kAlert(mess)                                            \
do                                                                      \
{                                                                       \
UIAlertController *alert = [UIAlertController alertControllerWithTitle:YYTLocalized(@"提示") message:mess preferredStyle:UIAlertControllerStyleAlert];\
[alert addAction:[UIAlertAction actionWithTitle:YYTLocalized(@"确定") style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {\
}]];\
\
[[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:alert animated:YES completion:nil];\
} \
while(0) \

#endif /* HTUtilsMacroDefine_h */
