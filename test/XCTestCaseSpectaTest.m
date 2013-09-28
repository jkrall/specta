#import "TestHelper.h"
#import "XCTestCase+Specta.h"

SpecBegin(_XCTestCaseSpectaTest)

describe(@"group", ^{
  it(@"example 1", ^{
    XCTAssertTrue(YES, @"YES is true");
  });
});

SpecEnd

@interface XCTestCaseSpectaTest : XCTestCase

@end

@implementation XCTestCaseSpectaTest

- (void)test_SPT_title_when_test_case_is_a_spec_example
{
  XCTestSuite * testSuite = [XCTestSuite testSuiteForTestCaseClass:[_XCTestCaseSpectaTestSpec class]];
  
  XCTAssertEqual((NSUInteger)[[testSuite valueForKey:@"tests"] count],
                 (NSUInteger)1,
                 @"Only one test exists in the sample spec");
  
  SPTXCTestCase * specExample = [[testSuite valueForKey:@"tests"] objectAtIndex:0];
  XCTAssertEqualObjects([specExample SPT_title],
                       @"group example 1",
                       @"Spec example titles equal the full example name");
}

- (void)test_SPT_title_when_test_case_is_a_sen_test_case
{
  XCTestSuite * testSuite = [XCTestSuite testSuiteForTestCaseClass:[XCTestCaseSpectaTest class]];
  
  NSArray * testCases = [testSuite valueForKey:@"tests"];
  
  NSString * thisTestCaseName = NSStringFromSelector(_cmd);
  NSUInteger thisTestCaseIndex =
    [testCases indexOfObjectPassingTest:^BOOL(id testCase, NSUInteger idx, BOOL *stop) {
      return [NSStringFromSelector([(XCTestCase *)testCase selector]) isEqualToString:thisTestCaseName];
    }];

  XCTestCase * thisTestCase = [testCases objectAtIndex:thisTestCaseIndex];
  
  XCTAssertEqualObjects([thisTestCase SPT_title],
                       thisTestCaseName,
                       @"Test case titles equal the test's selector");
}

@end
