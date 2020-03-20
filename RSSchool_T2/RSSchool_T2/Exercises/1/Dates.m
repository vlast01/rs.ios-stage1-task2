#import "Dates.h"

@implementation Dates

- (NSString *)textForDay:(NSString *)day month:(NSString *)month year:(NSString *)year {
    
    NSDateFormatter *weekDayFormat = [NSDateFormatter new];
    [weekDayFormat setDateFormat:@"EEEE"];
    weekDayFormat.locale = [NSLocale localeWithLocaleIdentifier:@"ru_RU"];
    
    NSDateFormatter *ddMMyyyy = [NSDateFormatter new];
    ddMMyyyy.dateFormat = @"dd/MM/yyyy";
  
    NSString * inputDate = [NSString stringWithFormat:@"%@/%@/%@", day, month, year];
    NSDate *date = [ddMMyyyy dateFromString:inputDate];
   
    NSString * weekDay = [weekDayFormat stringFromDate:date];
    
    if (date == NULL) {
        return @"Такого дня не существует";
    }
    
    NSLog(@"The day of the week is: %@", [weekDayFormat stringFromDate:date]);
 
    NSArray * monthsArray = @[@"января", @"февраля", @"марта", @"апреля", @"мая", @"июня", @"июля", @"августа", @"сентября", @"октября", @"ноября", @"декабря"];
    
    NSString * currentMonth = [monthsArray objectAtIndex:[month intValue]-1];
    
    NSString * outputDate = [NSString stringWithFormat:@"%@ %@, %@", day, currentMonth, weekDay];
    
    NSLog(@"%@", outputDate);
    
           return outputDate;
}


@end
