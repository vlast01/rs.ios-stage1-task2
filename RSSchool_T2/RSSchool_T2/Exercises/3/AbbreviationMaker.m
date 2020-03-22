#import "AbbreviationMaker.h"

@implementation AbbreviationMaker
// Complete the abbreviation function below.
- (NSString *) abbreviationFromA:(NSString *)a toB:(NSString *)b {
    
    
    NSMutableString * niceString =  [NSMutableString stringWithString: a];
    NSString * aInUpper = [[NSString stringWithString:a] uppercaseString];
    
    BOOL flag = YES;
    int deleteCounter = 0;
    
    for (int i = 0; i < [a length]; i++){
        
        char buff = [aInUpper characterAtIndex:i];
        
        for (int j = 0; j < [b length]; j++){
            flag = NO;
            if (buff == [b characterAtIndex:j]) {
                flag = YES;
                break;
            }
        }
        if (!flag) {
            if ([a characterAtIndex:i] >= 'A' && [a characterAtIndex:i] <= 'Z') {
                return @"NO";
            }
            else {
                [niceString deleteCharactersInRange:NSMakeRange(i-deleteCounter, 1)];
                NSLog(@"%d", i);
                deleteCounter++;
            }
        }
        flag = YES;
    }
    
    if ([[niceString uppercaseString] isEqual:b]) {
        return @"YES";
    }
    
    return @"NO";
    
    
}
@end
