//
// Copyright 2017 Google Inc.
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

#import <UIKit/UIKit.h>

/**
 *  A UIView that detects if an event sent to it is a UITouchEvent.
 */
@interface TouchEventView : UIView
@end

@interface GestureViewController : UIViewController

@property(retain, nonatomic) IBOutlet UILabel *detectedGesture;
// For now, the value of this label is only set when the gesture recognized is a tap or swipe.
@property(retain, nonatomic) IBOutlet UILabel *detectedGestureCoordinate;
@property(retain, nonatomic) IBOutlet UILabel *detectedWindowGesture;
@property(retain, nonatomic) IBOutlet TouchEventView *greyBox;
@property(retain, nonatomic) IBOutlet UIButton *resetButton;
@property(retain, nonatomic) IBOutlet UILabel *counter;

@end
