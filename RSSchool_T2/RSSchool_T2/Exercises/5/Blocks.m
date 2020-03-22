#import "Blocks.h"

@interface Blocks ()


@property (nonatomic, copy) NSArray *bufferArray;


@end


@implementation Blocks


-(BlockA)blockA{
    return [^(NSArray *array)  {
        _bufferArray = array;
    } copy];
}

-(BlockB)blockB{
    return [^(Class class){
        
        if (class == [NSString class]) {
            NSMutableString * result = [NSMutableString stringWithString:@""];
            for (int i = 0; i < [_bufferArray count]; i++) {
                if ([[_bufferArray objectAtIndex:i] isKindOfClass:class]) {
                    [result appendString:[_bufferArray objectAtIndex:i]];
                }
            }
            NSLog(@"%@", result);
            self.blockC(result);
        }
        
         else if (class == [NSNumber class]) {
            int result = 0;
            for (int i = 0; i < [_bufferArray count]; i++) {
                           if ([[_bufferArray objectAtIndex:i] isKindOfClass:class]) {
                               result+=[[_bufferArray objectAtIndex:i] intValue];
                           }
                       }
                       self.blockC([NSNumber numberWithInt:result]);
        }
        
        else {
            
            NSDate * earliestDate = [NSDate new];
            for (int i = 0; i < [_bufferArray count]; i++) {
                if ([[_bufferArray objectAtIndex:i] isKindOfClass: class] && [[_bufferArray objectAtIndex:i] compare:earliestDate] == NSOrderedDescending) {
                        earliestDate = [_bufferArray objectAtIndex:i];
                }
            }
            NSDateFormatter * ddmmyyyy = [NSDateFormatter new];
            ddmmyyyy.dateFormat = @"dd.MM.yyyy";
            self.blockC([ddmmyyyy stringFromDate:earliestDate]);
        }
              } copy] ;
}



@end

