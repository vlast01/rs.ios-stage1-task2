#import "FibonacciResolver.h"

@implementation FibonacciResolver
- (NSArray*)productFibonacciSequenceFor:(NSNumber*)number {
    int fn = 0;
    int fnn = 1;
    while (YES) {
        if (fn * fnn == number.intValue) {
            return @[@(fn), @(fnn), @1];
        }
        else if (fn * fnn > number.intValue){
            return @[@(fn), @(fnn), @0];
        }
        int buf = fn;
        fn = fnn;
        fnn += buf;
    }
}
@end



