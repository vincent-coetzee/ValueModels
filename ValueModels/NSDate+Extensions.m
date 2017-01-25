//
//  NSDate+NSDate_Extensions.m
//  ValueModels
//
//  Created by Vincent Coetzee on 2017/01/25.
//  Copyright © 2017 MacSemantics. All rights reserved.
//

#import "NSDate+Extensions.h"

@implementation NSDate (NSDate_Extensions)

+ (instancetype) day: (int) day month: (int) month year: (int) year
    {
    NSCalendar* calendar;
    NSDateComponents* components;
    
    calendar = [NSCalendar currentCalendar];
    components = [NSDateComponents new];
    components.day = day;
    components.month = month;
    components.year = year;
    components.hour = 0;
    components.minute = 0;
    components.second = 0;
    return([calendar dateFromComponents: components]);
    }

@end
