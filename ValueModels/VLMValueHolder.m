//
//  VLMValueHolder.m
//  ValueModels
//
//  Created by Vincent Coetzee on 2017/01/25.
//  Copyright © 2017 MacSemantics. All rights reserved.
//

#import "VLMValueHolder.h"

@implementation VLMValueHolder
    {
    __strong id _value;
    }

+ (instancetype) on: (id) anObject
    {
    return([[self alloc] initWith: anObject]);
    }

+ (instancetype) onInt: (NSInteger) anInt
    {
    return([[self alloc] initWith: @(anInt)]);
    }

+ (instancetype) onCGFloat: (CGFloat) aFloat
    {
    return([[self alloc] initWith: @(aFloat)]);
    }

- (instancetype) init
    {
    self = [super init];
    if (self)
        {
        _value = nil;
        }
    return(self);
    }

- (instancetype) initWith: (id) anObject
    {
    self = [super init];
    if (self)
        {
        _value = anObject;
        }
    return(self);
    }

- (void) setValue: (id) anObject
    {
    id oldValue = _value;
    _value = anObject;
    [self changed: @"value" with: oldValue];
    }

- (id) value
    {
    return(_value);
    }

- (void) setIntValue: (NSInteger) anInt
    {
    id oldValue = _value;
    _value = @(anInt);
    [self changed: @"value" with: oldValue];
    }

- (NSInteger) intValue
    {
    if ([_value respondsToSelector: @selector(intValue)])
        {
        return([((NSNumber*) _value) intValue]);
        }
    return(0);
    }

- (void) setCGFloatValue: (CGFloat) aFloat
    {
    id oldValue = _value;
    _value = @(aFloat);
    [self changed: @"value" with: oldValue];
    }

- (CGFloat) CGFloatValue
    {
    if ([_value respondsToSelector: @selector(doubleValue)])
        {
        return([((NSNumber*) _value) doubleValue]);
        }
    return(0.0f);
    }
    
@end
