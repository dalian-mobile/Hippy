/*!
 * iOS SDK
 *
 * Tencent is pleased to support the open source community by making
 * Hippy available.
 *
 * Copyright (C) 2019 THL A29 Limited, a Tencent company.
 * All rights reserved.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#import "HippyNextListTableView.h"

@implementation HippyNextListTableView

HIPPY_NESTEDSCROLL_PROTOCOL_PROPERTY_IMP

/**
 * we need scroll indicator to be at top
 * indicator is UIImageView type at lower ios version
 * _UIScrollViewScrollIndicator type at higher ios version.
 * UIImageView zPosition is zero by default, so we need set it manually.
 * _UIScrollViewScrollIndicator zPosition is HUGE by default
 */
- (void)didAddSubview:(UIView *)subview {
    [super didAddSubview:subview];
    if ([subview isKindOfClass:[UIImageView class]]) {
        subview.layer.zPosition = CGFLOAT_MAX;
    }
}

- (void)layoutSubviews {
    [super layoutSubviews];
    if ([_layoutDelegate respondsToSelector:@selector(tableViewDidLayoutSubviews:)]) {
        [_layoutDelegate tableViewDidLayoutSubviews:self];
    }
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer
shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
    if (self.nestedGestureDelegate &&
        gestureRecognizer == self.panGestureRecognizer &&
        [self.nestedGestureDelegate respondsToSelector:@selector(shouldRecognizeScrollGestureSimultaneouslyWithView:)]) {
        return [self.nestedGestureDelegate shouldRecognizeScrollGestureSimultaneouslyWithView:otherGestureRecognizer.view];
    }
    return NO;
}

@end
