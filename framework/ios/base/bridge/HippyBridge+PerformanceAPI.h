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

#import "HippyBridge.h"

NS_ASSUME_NONNULL_BEGIN

/// Performance API Category of HippyBridge
@interface HippyBridge (PerformanceAPI)

/// Update perf records of FP, DOM_START/DOM_END etc.
/// - Parameter rootTag: Tag of rootView
- (void)updatePerfRecordsOnRootContentDidAppear:(NSNumber *)rootTag;

/// Update FCP perf record.
- (void)updatePerfRecordOnFirstContentfulPaintEnd;

/// Get all perf data
- (NSDictionary *)getHippyInitPerformanceData;

/// Get fcp perf data
- (nullable NSDictionary *)getFCPPerformanceData;

@end

NS_ASSUME_NONNULL_END
