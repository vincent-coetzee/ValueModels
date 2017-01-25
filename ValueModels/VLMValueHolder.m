//
//  VLMValueHolder.m
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
