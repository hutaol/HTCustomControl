//
//  HTPopoverView.m
//  HTCustomControl
//
//  Created by Henry on 2019/3/11.
//  Copyright © 2019 Henry. All rights reserved.
//

#import "HTPopoverView.h"
#import "UIView+HTFrame.h"
#import "HTUtilsMacroDefine.h"

#define kContentViewHeight (180)
#define kAnimateWithDuration (0.2f)

@interface HTPopoverView ()

@property (nonatomic, strong) UIButton *overlayBtn;

@end

@implementation HTPopoverView

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self configurationDefault];
        [self initUI];
    }
    return self;
}

- (void)configurationDefault {
    _allowClickOverlayClose = YES;
    _mode = HTPopoverViewModeBottom;
    _contentHeight = kContentViewHeight;
    _contentWidth = [UIScreen mainScreen].bounds.size.width;
}

- (void)initUI {
    
    self.frame = [UIScreen mainScreen].bounds;
    
    self.overlayBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.overlayBtn addTarget:self action:@selector(dismiss) forControlEvents:UIControlEventTouchUpInside];
    self.overlayBtn.backgroundColor = [UIColor colorWithWhite:0 alpha:0.2];
    [self addSubview:self.overlayBtn];
    
    self.overlayBtn.frame = self.bounds;
    
    UIView *contentView = [[UIView alloc] init];
    contentView.backgroundColor = [UIColor whiteColor];
    [self addSubview:contentView];
    
    _contentView = contentView;
    _contentView.hidden = YES;
    
}

- (void)show {
    
    UIWindow *keywindow = [[UIApplication sharedApplication] keyWindow];
    [keywindow addSubview:self];
    
    self.contentView.hidden = NO;
    
    switch (self.mode) {
        case HTPopoverViewModeBottom:
            self.contentView.frame = CGRectMake((self.width-self.contentWidth)/2, [UIScreen mainScreen].bounds.size.height, self.contentWidth, self.contentHeight);
            break;
        case HTPopoverViewModeCenter:
            self.contentView.center = CGPointMake(self.centerX, self.centerY);
        default:
            break;
    }

    [UIView animateWithDuration:kAnimateWithDuration animations:^{
        switch (self.mode) {
            case HTPopoverViewModeBottom:
                self.contentView.top = self.height-self.contentHeight-kHeight_SafeBottom;
                break;
            case HTPopoverViewModeCenter:
                self.contentView.bounds = CGRectMake(0, 0, self.contentWidth-20, self.contentHeight);
            default:
                break;
        }
    }];
    
}

- (void)dismiss {
    if (!self.allowClickOverlayClose) {
        return;
    }
    [UIView animateWithDuration:kAnimateWithDuration animations:^{
        switch (self.mode) {
            case HTPopoverViewModeBottom:
                self.contentView.top = self.height;
                break;
            case HTPopoverViewModeCenter:
                self.contentView.bounds = CGRectMake(0, 0, 0, 0);
            default:
                break;
        }
    } completion:^(BOOL finished) {
        self.contentView.hidden = YES;
        [self removeFromSuperview];
    }];
}

- (void)setContentHeight:(CGFloat)contentHeight {
    _contentHeight = contentHeight;
}

- (void)setContentWidth:(CGFloat)contentWidth {
    _contentWidth = contentWidth;
}

- (void)setAllowClickOverlayClose:(BOOL)allowClickOverlayClose {
    _allowClickOverlayClose = allowClickOverlayClose;
}

@end
