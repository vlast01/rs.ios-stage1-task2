#import "FibonacciResolver.h"

@implementation FibonacciResolver
- (NSArray*)productFibonacciSequenceFor:(NSNumber*)number {
    int fn = 0;
    int fnn = 1;
    NSMutableArray * result = [NSMutableArray arrayWithCapacity:3];
    
    while (YES) {
        if (fn * fnn == number.intValue) {
            [result addObject:@(fn)];
            [result addObject:@(fnn)];
            [result addObject:@1];
            return result;
        }
        else if (fn * fnn > number.intValue){
            [result addObject:@(fn)];
            [result addObject:@(fnn)];
            [result addObject:@0];
            return result;
        }
        int buf = fn;
        fn = fnn;
        fnn += buf;
    }
    
}
@end
