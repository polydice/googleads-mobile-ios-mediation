// Copyright 2019 Google LLC.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

#import <Foundation/Foundation.h>
#import "GADFBNativeAdBase.h"

/// Wrapper for Meta Audience Network native banner ads.
@interface GADFBNativeBannerAd : GADFBNativeAdBase

/// Requests a native banner ad from the Meta Audience Network SDK.
- (void)requestNativeBannerAd;

/// Stops being Meta Audience Network native banner ad delegate.
- (void)stopBeingDelegate;

@end
