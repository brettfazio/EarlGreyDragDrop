//
// Copyright 2018 Google Inc.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//      http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//

#import "AppFramework/EarlGreyApp/EarlGreyApp.h"
#import "CommonLib/DistantObject/GREYHostApplicationDistantObject.h"
#import "CommonLib/GREYSwizzler.h"

/** GREYHostApplicationDistantObject extension for the protrait orientation test. */
@interface GREYHostApplicationDistantObject (PortraitOnlyOrientationTest)

/** Swizzle the available UIDeviceOrientations to only allow portrait. */
- (BOOL)blockNonPortraitOrientations;

/** Reset the swizzled methods to allow all orientations. */
- (BOOL)unblockNonPortraitOrientations;

@end
