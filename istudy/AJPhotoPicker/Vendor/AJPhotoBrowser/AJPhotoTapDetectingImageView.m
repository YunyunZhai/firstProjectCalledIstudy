//
//  AJPhotoTapDetectingImageView.m
//  AJPhotoBrowser
//
//  Created by AlienJunX on 16/2/15.
//  Copyright (c) 2015 AlienJunX
//
//  This source code is licensed under the MIT-style license found in the
//  LICENSE file in the root directory of this source tree.
//

#import "AJPhotoTapDetectingImageView.h"

@implementation AJPhotoTapDetectingImageView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.userInteractionEnabled = YES;
        self.exclusiveTouch = YES;
    }
    return self;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    NSInteger tapCount = touch.tapCount;
    switch (tapCount) {
        case 1:
        {
            if (_delegate && [_delegate respondsToSelector:@selector(singleTapDetected:touch:)]) {
                [_delegate singleTapDetected:self touch:touch];
            }
        }
            break;
            
        case 2:
        {
            if (_delegate && [_delegate respondsToSelector:@selector(doubleTapDetected:touch:)]) {
                [_delegate doubleTapDetected:self touch:touch];
            }
        }
            break;
    }
}

- (void)dealloc {
    _delegate = nil;
}

@end
// 版权属于原作者
// http://code4app.com (cn) http://code4app.net (en)
// 发布代码于最专业的源码分享网站: Code4App.com