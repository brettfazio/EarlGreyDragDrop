Pod::Spec.new do |s|

  s.name = "EarlGreyTwo"
  s.version = "0.9.6"
  s.summary = "ObjC and Swift remote invocation framework"
  s.homepage = "https://github.com/brettfazio/EarlGrey"
  s.author = "Google Inc."
  s.summary = "eDistantObject provides users an easy way to make remote method invocations between processes in Objective-C and Swift without explicitly constructing RPC structures."
  s.license = { :type => "Apache 2.0", :file => "LICENSE" }
  s.source = { :git => "https://github.com/brettfazio/EarlGrey.git", :branch => "removed" }

  # Subspec each folder so folders exist when pod is installed.

  s.pod_target_xcconfig = { 'USER_HEADER_SEARCH_PATHS' => '"${SOURCE_ROOT}/**"', 'HEADER_SEARCH_PATHS' => '"${SOURCE_ROOT}/**"' }
  
  sources = (Dir.glob("{TestLib,CommonLib}/**/*.{m,h}")) +
            (Dir.glob("{AppFramework,UILib}/**/*.h")) +
            Dir.glob("AppFramework/Synchronization/GREYUIThreadExecutor.h") +
            Dir.glob("AppFramework/Error/GREYFailureScreenshotterStub.m") +
            Dir.glob("{TestLib,CommonLib,AppFramework,UILib}/**/*Stub.m") +
            Dir.glob("{TestLib,CommonLib,AppFramework,UILib}/**/*Shorthand.m")
  
  headers = ["AppFramework/Action/GREYAction.h",
"AppFramework/Action/GREYActionsShorthand.h",
"AppFramework/DistantObject/GREYHostBackgroundDistantObject+GREYApp.h",
"AppFramework/Matcher/GREYMatchersShorthand.h",
"CommonLib/Assertion/GREYAssertionBlock.h",
"CommonLib/Config/GREYConfiguration.h",
"CommonLib/DistantObject/GREYHostApplicationDistantObject.h",
"CommonLib/DistantObject/GREYTestApplicationDistantObject.h",
"CommonLib/Error/GREYErrorConstants.h",
"CommonLib/Exceptions/GREYFailureHandler.h",
"CommonLib/Exceptions/GREYFrameworkException.h",
"CommonLib/GREYDefines.h",
"CommonLib/Matcher/GREYElementMatcherBlock.h",
"CommonLib/Matcher/GREYMatcher.h",
"TestLib/AlertHandling/XCTestCase+GREYSystemAlertHandler.h",
"TestLib/Assertion/GREYAssertionDefines.h",
"TestLib/Condition/GREYCondition.h",
    "TestLib/EarlGreyImpl/EarlGrey.h",
        "AppFramework/Core/GREYElementInteraction.h",
        "AppFramework/Core/GREYInteraction.h",
        "AppFramework/Core/GREYInteractionDataSource.h",
        "AppFramework/Matcher/GREYAllOf.h",
        "AppFramework/Matcher/GREYAnyOf.h",
        "AppFramework/Matcher/GREYMatchers.h",
        "AppFramework/Matcher/GREYNot.h",
        "AppFramework/Synchronization/GREYAppStateTracker.h",
        "AppFramework/Synchronization/GREYAppStateTrackerObject.h",
        "AppFramework/Synchronization/GREYSyncAPI.h",
        "AppFramework/Synchronization/GREYUIThreadExecutor.h"
    ]

  s.source_files = sources
  s.public_header_files = headers

  s.ios.deployment_target = "10.0"
  s.osx.deployment_target = "10.10"
  
  s.frameworks = "XCTest", "UIKit", "CoreFoundation"

end
