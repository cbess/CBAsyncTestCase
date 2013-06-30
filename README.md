CBAsyncTestCase
===============

Asynchronous Unit Test Case - Synchronize those async operations for testing purposes.

#### Example Usage

```objc
- (void)testNetworkStuff
{
    [self beginAsyncOperation];
 
    NSString *identifier = @"777";
    [_networkManager fetchStuffWithID:identifier completion:^(NSArray *results, NSError *error) {
 
        STAssertNil(error, @"error occurred: %@", error);
        STAssertTrue(results.count, @"no results");
        
        [self finishedAsyncOperation];
    }];
    
    // waits for async operation or timeout and fail assertion
    [self assertAsyncOperationTimeout];
}
```
