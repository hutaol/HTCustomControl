//
//  HTPopoverView.h
//  HTCustomControl
//
//  Created by Henry on 2019/3/11.
//  Copyright © 2019 Henry. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, HTPopoverViewMode) {
    HTPopoverViewModeBottom,
    HTPopoverViewModeCenter
};


@interface HTPopoverView : UIView

@property (nonatomic, strong) UIView *contentView;

@property (nonatomic, assign) CGFloat contentHeight;

@property (nonatomic, assign) CGFloat contentWidth;

@property (nonatomic, assign) BOOL allowClickOverlayClose;

@property (nonatomic, assign) HTPopoverViewMode mode;

- (void)show;

- (void)dismiss;

@end

NS_ASSUME_NONNULL_END
