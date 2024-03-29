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

#import "BaseIntegrationTest.h"

#import "GREYHostApplicationDistantObject+NetworkTest.h"

@interface NetworkTest : BaseIntegrationTest
@end

@implementation NetworkTest

- (void)setUp {
  [super setUp];
  [self openTestViewNamed:@"Network Test"];
}

- (void)testSynchronizationWithNSURLSessionCompletionHandlers {
  [[EarlGrey selectElementWithMatcher:grey_accessibilityID(@"RequestCompletedLabel")]
      assertWithMatcher:grey_notVisible()];
  [[EarlGrey selectElementWithMatcher:grey_accessibilityID(@"NSURLSessionTest")]
      performAction:grey_tap()];
  [[EarlGrey selectElementWithMatcher:grey_accessibilityID(@"RequestCompletedLabel")]
      assertWithMatcher:grey_sufficientlyVisible()];
  [[EarlGrey selectElementWithMatcher:grey_accessibilityID(@"ResponseVerifiedLabel")]
      assertWithMatcher:grey_sufficientlyVisible()];
}

- (void)testURLPrintingInErrorLogsWhenNetworkRequestFails {
  // Setting the timeout to 0.5, a lower one might trigger an issue with Animation tracking for
  // the button press or so. The request goes on till 1.0 as set by the view controller, so this
  // should always fail.
  [[GREYConfiguration sharedConfiguration] setValue:@(0.5)
                                       forConfigKey:kGREYConfigKeyInteractionTimeoutDuration];
  [[EarlGrey selectElementWithMatcher:grey_accessibilityID(@"NSURLSessionTest")]
      performAction:grey_tap()];
  NSError *error;
  [[EarlGrey selectElementWithMatcher:grey_accessibilityID(@"RequestCompletedLabel")]
      assertWithMatcher:grey_sufficientlyVisible()
                  error:&error];
  XCTAssertTrue([error.localizedDescription containsString:@"URL:\"http://www.youtube.com/\""]);
}

- (void)testSynchronizationWorksWithNSURLSessionDelegates {
  [[EarlGrey selectElementWithMatcher:grey_accessibilityID(@"RequestCompletedLabel")]
      assertWithMatcher:grey_notVisible()];
  [[EarlGrey selectElementWithMatcher:grey_accessibilityID(@"NSURLSessionDelegateTest")]
      performAction:grey_tap()];
  [[EarlGrey selectElementWithMatcher:grey_accessibilityID(@"RequestCompletedLabel")]
      assertWithMatcher:grey_sufficientlyVisible()];
  [[EarlGrey selectElementWithMatcher:grey_accessibilityID(@"ResponseVerifiedLabel")]
      assertWithMatcher:grey_sufficientlyVisible()];
}

- (void)testSynchronizationWorksWithNSURLSessionProxyDelegate {
  [[EarlGrey selectElementWithMatcher:grey_accessibilityID(@"RequestCompletedLabel")]
      assertWithMatcher:grey_notVisible()];
  // Will cause a crash if the proxy delegate's method isn't swizzled correctly.
  [[EarlGrey selectElementWithMatcher:grey_accessibilityID(@"NSURLSessionProxyDelegateTest")]
      performAction:grey_tap()];
  [[EarlGrey selectElementWithMatcher:grey_accessibilityID(@"RequestCompletedLabel")]
      assertWithMatcher:grey_sufficientlyVisible()];
}

- (void)testSynchronizationWorksWithoutNetworkCallbacks {
  [[EarlGrey selectElementWithMatcher:grey_accessibilityID(@"RequestCompletedLabel")]
      assertWithMatcher:grey_notVisible()];
  // Make the network requests to take longer.
  [GREYHostApplicationDistantObject.sharedInstance setNetworkRequestDelayTime:1.0];
  [[EarlGrey selectElementWithMatcher:grey_accessibilityID(@"NSURLSessionNoCallbackTest")]
      performAction:grey_tap()];
  NSTimeInterval startTime = CACurrentMediaTime();
  // GREYUIThreadExecutor::drainUntilIdle will be called on the background thread here since we
  // stub it in EarlGrey's TestLib.
  [[GREYUIThreadExecutor sharedInstance] drainUntilIdle];
  NSTimeInterval idlingTime = CACurrentMediaTime() - startTime;
  // Verify that EarlGrey did not wait for the request.
  GREYAssert(idlingTime < 1.0, @"EarlGrey must not wait for the network request");
  [GREYHostApplicationDistantObject.sharedInstance setNetworkRequestDelayTime:0.0];
}

@end
