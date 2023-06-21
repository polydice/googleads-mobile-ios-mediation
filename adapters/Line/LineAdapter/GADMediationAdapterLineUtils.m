// Copyright 2023 Google LLC
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

#import "GADMediationAdapterLineUtils.h"

#import <FiveAd/FiveAd.h>

#import "GADMediationAdapterLineConstants.h"

NSError *GADMediationAdapterLineErrorWithCodeAndDescription(GADMediationAdapterLineErrorCode code,
                                                            NSString *_Nonnull description) {
  NSDictionary *userInfo =
      @{NSLocalizedDescriptionKey : description, NSLocalizedFailureReasonErrorKey : description};
  NSError *error = [NSError errorWithDomain:GADMediationAdapterLineErrorDomain
                                       code:code
                                   userInfo:userInfo];
  return error;
}

NSError *_Nonnull GADMediationAdapterLineErrorWithFiveAdErrorCode(FADErrorCode code) {
  NSString *description = @"Five Ad returned with a failure callback.";
  NSDictionary<NSErrorUserInfoKey, NSString *> *userInfo =
      @{NSLocalizedDescriptionKey : description, NSLocalizedFailureReasonErrorKey : description};
  NSError *error = [NSError errorWithDomain:GADMediationAdapterFiveAdErrorDomain
                                       code:code
                                   userInfo:userInfo];
  return error;
}

void GADMediationAdapterLineLog(NSString *_Nonnull format, ...) {
#ifdef DEBUG
  va_list arguments;
  va_start(arguments, format);
  NSString *log = [[NSString alloc] initWithFormat:format arguments:arguments];
  va_end(arguments);

  NSLog(@"GADMediationAdapterLine - %@", log);
#endif
}

void GADMediationAdapterLineMutableSetAddObject(NSMutableSet *_Nullable set,
                                                NSObject *_Nonnull object) {
  if (object) {
    [set addObject:object];  // Allow pattern.
  }
}

NSString *_Nullable GADMediationAdapterLineSlotID(
    GADMediationAdConfiguration *_Nonnull adConfiguration, NSError *_Nullable *_Nonnull errorPtr) {
  NSString *slotID =
      adConfiguration.credentials.settings[GADMediationAdapterLineCredentialKeyAdUnit];
  if (!slotID) {
    NSString *errorDescription = [NSString
        stringWithFormat:@"Invalid slot ID was received from the ad configuration. Please verify "
                         @"the ad unit mapping from the AdMob UI. Slot ID: %@.",
                         slotID];
    *errorPtr = GADMediationAdapterLineErrorWithCodeAndDescription(
        GADMediationAdapterLineErrorInvalidServerParameters, errorDescription);
    return nil;
  }
  return slotID;
}
