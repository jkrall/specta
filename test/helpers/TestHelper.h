#import <XCTest/XCTest.h>
#define SPT_CEDAR_SYNTAX
#import "Specta.h"
#define EXP_SHORTHAND
#import "Expecta.h"

#define RunSpec(TestClass) RunSpecClass([TestClass class])

XCTestSuiteRun * RunSpecClass(Class testClass);
