#import "TestHelper.h"

XCTestSuiteRun * RunSpecClass(Class testClass) {
//  [XCTestObserver suspendObservation];
  [XCTestObserver stopObserving];
  XCTestSuiteRun *result = (id)[(XCTestSuite *)[XCTestSuite testSuiteForTestCaseClass:testClass] run];
//  [XCTestObserver resumeObservation];

  return result;
}
