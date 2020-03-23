#import "NSString+Transform.h"

@implementation NSString (Transform)

-(NSString*)transform {
    
    
    NSMutableString * helpString = [NSMutableString stringWithString:self];
    NSMutableArray * words = [NSMutableArray new];
    NSMutableArray * lettersAmountArray = [NSMutableArray new];
    NSMutableString * result = [NSMutableString stringWithString:@""];
    NSString * alphabet = @"abcdefghijklmnopqrstuvwxyz";
    NSArray * vowels = @[@"a",@"e",@"i",@"o",@"u",@"y"];
    NSArray * consonants = @[@"b", @"c", @"d", @"f", @"g", @"h", @"j", @"k", @"l", @"m", @"n", @"p", @"q", @"r", @"s", @"t", @"v", @"w", @"x", @"z"];
    
    BOOL isPangram = YES;
    
    for (int i = 0; i < [alphabet length]; i++) {
        char temp = [alphabet characterAtIndex:i];
        if (![self containsString:[NSString stringWithFormat:@"%c", temp]] &&
            ![self containsString:[NSString stringWithFormat:@"%c", temp-32]]) {
            isPangram = NO;
            break;
        }
    }
    
    while (YES) {
        if ([helpString isEqualToString:@""]) {
            return @"";
        }
        if ([[helpString substringFromIndex:[helpString length]-1] isEqualToString:@" "]){
            [helpString deleteCharactersInRange:NSMakeRange([helpString length]-1, 1)];;
        }
        else break;
    }
    
    while (YES) {
        while (YES) {
            if ([[NSString stringWithFormat:@"%c",[helpString characterAtIndex:0]]  isEqual: @" "]) {
                [helpString deleteCharactersInRange:NSMakeRange(0, 1)];
            }
            else break;
        }
        
        if ([helpString length] == 0) {
            break;
        }
        
        if ([helpString rangeOfString:@" "].location == NSNotFound) {
            [words addObject:helpString];
            break;
        }
        else{
            
            int spaseIndex = (int)[helpString rangeOfString:@" "].location;
            
            NSString * word = [helpString substringWithRange:NSMakeRange(0, spaseIndex)];
            [helpString deleteCharactersInRange:NSMakeRange(0, spaseIndex)];
            
            [words addObject:word];
        }
    }
    
    for (int i = 0; i < [words count]; i++) {
        NSMutableString * tempString = [NSMutableString stringWithString:[NSString stringWithFormat:@"%@", [words objectAtIndex:i]]];
        int k = 0;
        for (int j = 0; j < [tempString length]; j++) {
            
            if ((isPangram && [vowels containsObject:[[NSString stringWithFormat:@"%c",[tempString characterAtIndex:j]]lowercaseString]]) || (!isPangram && ![vowels containsObject:[[NSString stringWithFormat:@"%c",[tempString characterAtIndex:j]]lowercaseString]] && [consonants containsObject:[[NSString stringWithFormat:@"%c",[tempString characterAtIndex:j]]lowercaseString]]))
            {
                
                NSString * letter = [[NSString stringWithFormat:@"%c", [[words objectAtIndex:i] characterAtIndex:j]] uppercaseString];
                
                [tempString replaceCharactersInRange:NSMakeRange(j, 1) withString:letter];
                [words replaceObjectAtIndex:i withObject:tempString];
                
                k++;
            }
        }
        [lettersAmountArray addObject:[NSNumber numberWithInt:k]];
    }
    
    while (YES) {
        
        NSNumber *min=[lettersAmountArray valueForKeyPath:@"@min.self"];
        if ([min intValue] == 100) {
            break;
        }
        [result appendString:[NSString stringWithFormat:@"%@", min]];
        [result appendString:[NSString stringWithFormat:@"%@ ", [words objectAtIndex: [lettersAmountArray indexOfObject:min]]]];
        [lettersAmountArray replaceObjectAtIndex:[lettersAmountArray indexOfObject:min] withObject:@(100)];
    }
    
    [result deleteCharactersInRange:NSMakeRange([result length]-1, 1)];
    return result;
}
@end
