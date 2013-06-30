// This Test Case class uses CBAsyncTestCase as the base class

#import "MyExampleTestCase.h"

@implementation MyExampleTestCase

- (void)testNetworkStuff
{
    [self beginAsyncOperation]

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