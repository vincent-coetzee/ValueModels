//
//  VLMDateStringValueAdaptor.m
//  ValueModels
//
//  Created by Vincent Coetzee on 2017/01/25.
//  Copyright © 2017 Vincent Coetzee
//
//  Distributed under the permissive zlib license
//  Get the latest version from here:
//
//  https://github.com/vincent-coetzee/ValueModels
//
//  This software is provided 'as-is', without any express or implied
//  warranty.  In no event will the authors be held liable for any damages
//  arising from the use of this software.
//
//  Permission is granted to anyone to use this software for any purpose,
//  including commercial applications, and to alter it and redistribute it
//  freely, subject to the following restrictions:
//
//  1. The origin of this software must not be misrepresented; you must not
//  claim that you wrote the original software. If you use this software
//  in a product, an acknowledgment in the product documentation would be
//  appreciated but is not required.
//
//  2. Altered source versions must be plainly marked as such, and must not be
//  misrepresented as being the original software.
//
//  3. This notice may not be removed or altered from any source distribution.
//

#import "VLMDateStringValueAdaptor.h"

@implementation VLMDateStringValueAdaptor
    {
    __strong VLMValueModel _dateModel;
    }

+ (instancetype) on: (VLMValueModel) model
    {
    return([[self alloc] initWith: model]);
    }

- (instancetype) initWith: (VLMValueModel) model
    {
    self = [super init];
    if (self)
        {
        _dateModel = model;
        [_dateModel addDependent: self];
        }
    return(self);
    }

- (void) dealloc
    {
    [_dateModel removeDependent: self];
    _dateModel = nil;
    }

- (void) setDateModel: (VLMValueModel) dateModel
    {
    [_dateModel removeDependent: self];
    _dateModel = dateModel;
    [_dateModel addDependent: self];
    }

- (VLMValueModel) dateModel
    {
    return(_dateModel);
    }

- (id) value
    {
    NSDate* date;
    NSDateComponents* components;
    NSCalendar* calendar;
    NSString* value;
    
    date = _dateModel.value;
    calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    components = [calendar components: NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay fromDate: date];
    value = [NSString stringWithFormat: @"%02d/%02d/%04d",components.day,components.month,components.year];
    return(value);
    }

- (void) setValue: (id) aString
    {
    NSArray* pieces;
    NSDateComponents* components;
    NSCalendar* calendar;
    NSDate* date;
    
    pieces = [((NSString*) aString) componentsSeparatedByString: @"/"];
    if (pieces.count != 3)
        {
        return;
        }
    components = [NSDateComponents new];
    components.day = [pieces[0] intValue];
    components.month = [pieces[1] intValue];
    components.year = [pieces[2] intValue];
    calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    date = [calendar dateFromComponents: components];
    _dateModel.value = date;
    }

- (void) update: (NSString*) aspect with: (id) object from: (id) sender
    {
    if ([aspect isEqualToString: @"value"] && (sender == _dateModel))
        {
        [self changed: @"value"];
        }
    }

@end
