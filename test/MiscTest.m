#import "TestHelper.h"

@interface NSObject (MiscTest)

+ (NSArray *)senAllSubclasses;

@end

SpecBegin(_MiscTest)

describe(@"group", ^{
});

SpecEnd

@interface MiscTest : XCTestCase; @end
@implementation MiscTest

- (void)test_MiscTestSpecInXCTestCaseSubClassList {
  expect([XCTestCase senAllSubclasses]).toContain([_MiscTestSpec class]);
}

- (void)testSPTXCTestCaseNotInXCTestCaseSubClassList {
  // trick XCTestCase into thinking SPTXCTestCase is not a subclass of XCTestCase
  expect([XCTestCase senAllSubclasses]).Not.toContain([SPTXCTestCase class]);
}

@end
