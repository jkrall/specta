#import "TestHelper.h"

SPEC_BEGIN(_CedarDSLTest)

it(@"it with PENDING", PENDING);

SPEC_END

@interface CedarDSLTest : XCTestCase; @end
@implementation CedarDSLTest

- (void)testSingleExampleGroup {
  XCTestSuiteRun *result = RunSpec(_CedarDSLTestSpec);
  expect([result testCaseCount]).toEqual(1);
  expect([result failureCount]).toEqual(0);
  expect([result hasSucceeded]).toEqual(YES);
  expect([result pendingTestCaseCount]).toEqual(1);
}

@end
