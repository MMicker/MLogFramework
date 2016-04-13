//
//  testLogTests.m
//  testLogTests
//
//  Created by Micker on 15/4/13.
//  Copyright © 2016年 micker. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "MLog.h"

@interface testLogTests : XCTestCase

@end

@implementation testLogTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}
- (void) testNormal {
    [MLog startLevel:M_LOG_LEVEL_TYPE_UNDEF];

    DEBUGLOG(@"debug ");
    DEBUGLOG(@"debug %@", self);
    
    INFOLOG(@"info ");
    INFOLOG(@"info %@", self);
    
    WARNLOG(@"warn ");
    WARNLOG(@"warn %@", self);
    
    ERRLOG(@"error ");
    ERRLOG(@"error %@", self);
    
    FATALLOG(@"fatal ");
    FATALLOG(@"fatal %@", self);
}

- (void) testLevel {
    DEBUGLOG(@"debug ");
    DEBUGLOG(@"debug %@", self);
    
    INFOLOG(@"info ");
    INFOLOG(@"info %@", self);
    
    [MLog startLevel:M_LOG_LEVEL_TYPE_ERROR];
    
    FRAMELOG(CGRectZero);
    
    INFOLOG(@"info ");
    INFOLOG(@"info %@", self);
    
    FATALLOG(@"fatal ");
    FATALLOG(@"fatal %@", self);
    
}

@end
