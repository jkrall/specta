#import "TestHelper.h"

SpecBegin(_AsyncSpecTimeoutTest)

describe(@"group", ^{
  it_(@"example 1", ^AsyncSpec {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 200LL * NSEC_PER_MSEC), dispatch_get_main_queue(), ^{
      expect(NO).toBeFalsy();
      done();
    });
  });

  it_(@"example 2", ^AsyncSpec {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 50LL * NSEC_PER_MSEC), dispatch_get_main_queue(), ^{
      expect(NO).toBeFalsy();
      done();
    });
  });
});

SpecEnd

@interface AsyncSpecTimeoutTest : SenTestCase; @end
@implementation AsyncSpecTimeoutTest

- (void)testAsyncSpec {
  setAsyncSpecTimeout(0.1);
  SenTestRun *result = RunSpec(_AsyncSpecTimeoutTestSpec);
  expect([result failureCount]).toEqual(1);
  expect([result hasSucceeded]).toEqual(NO);
  setAsyncSpecTimeout(10.0);
}

@end
