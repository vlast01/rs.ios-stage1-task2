#import "TimeConverter.h"

@implementation TimeConverter
// Complete the following function
- (NSString*)convertFromHours:(NSString*)hours minutes:(NSString*)minutes {
    
    NSArray * numbers = @[@"one", @"two", @"three", @"four", @"five", @"six", @"seven", @"eight", @"nine", @"ten",@"eleven", @"twelve", @"thirteen", @"fourteen", @"fifteen", @"sixteen", @"seventeen", @"eighteen", @"nineteen", @"twenty", @"twenty one", @"twenty two", @"twenty three", @"twenty four", @"twenty five", @"twenty six", @"twenty seven", @"twenty nine"];
    
    
    if ([hours intValue]>23 || [hours intValue]<0 || [minutes intValue]>59 || [minutes intValue] < 0) {
        return @"";
    }
    
    if ([minutes intValue] == 0){
        return [NSString stringWithFormat:@"%@ o' clock",[numbers objectAtIndex:[hours intValue]-1]];
    }
    
    if ([minutes intValue] == 30){
        return [NSString stringWithFormat:@"half past %@",[numbers objectAtIndex:[hours intValue]-1]];
    }
    
    if ([minutes intValue] > 30){
        int difference = 60 - [minutes intValue];
        if (difference == 15){
            return [NSString stringWithFormat:@"quarter to %@",[numbers objectAtIndex:[hours intValue]]];
        }

        return [NSString stringWithFormat:@"%@ minutes to %@", [numbers objectAtIndex:difference-1], [numbers objectAtIndex:[hours intValue]]];
    }
    
    else{
        if ([minutes intValue] == 15){
            return [NSString stringWithFormat:@"quarter past %@",[numbers objectAtIndex:[hours intValue]-1]];
        }
        
        return [NSString stringWithFormat:@"%@ minutes past %@", [numbers objectAtIndex:[minutes intValue]-1], [numbers objectAtIndex:[hours intValue]-1]];
    }

}
@end
