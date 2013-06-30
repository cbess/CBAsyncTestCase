// This Test Case class uses CBAsyncTestCase as the base class

#import "MyExampleTestCase.h"

@implementation MyExampleTestCase

- (void)setUp
{
    [super setUp];
    
    // shortcut: all tests are asynchronous
    // [self beginAsyncOperation];
}

- (void)testNetworkStuff
{
    // can be placed in each test or in [setUp] for the entire test case
    [self beginAsyncOperation];

    NSString *identifier = @"777";
    // do something asynchronous (perform a network operation)
    [_networkManager fetchStuffWithID:identifier completion:^(NSArray *results, NSError *error) {

        STAssertNil(error, @"error occurred: %@", error);
        STAssertTrue(results.count, @"no results");
        
        [self finishedAsyncOperation];
    }];
    
    // waits for async operation or timeout and fail assertion
    [self assertAsyncOperationTimeout];
}

@end
