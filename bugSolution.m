The solution involves creating the NSData object outside the initializer and passing it in as an argument.  This ensures the object retains a strong reference until it's no longer needed.

```objectivec
@interface MyClass : NSObject
@property (strong, nonatomic) NSData *data;
@end

@implementation MyClass
- (instancetype)initWithData:(NSData *)data {
    self = [super init];
    if (self) {
        self.data = data; //Now safe, as long as data has a strong reference somewhere else
    }
    return self;
}
@end

// Example usage:
NSData *myData = [NSData dataWithBytes:(void *) "Hello" length:5]; // Create outside of initializer
MyClass *myObject = [[MyClass alloc] initWithData:myData];
```
Alternatively, you could create a strong property to hold the data object outside the initializer and pass it in, this may require some rethinking of the design, but will improve the code structure.