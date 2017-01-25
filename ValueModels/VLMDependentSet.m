//
//  VMLDependentSet.m
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

#import "VLMDependentSet.h"

@interface VLMWeakHolder:NSObject
    {
    @public
    __weak VLMDependent dependent;
    }

- (void) update: (NSString*) aspect with: (id) object from: (id) sender;

@end

@implementation VLMWeakHolder

- (void) update: (NSString*) aspect with: (id) object from: (id) sender
    {
    [dependent update: aspect with: object from: sender];
    }

@end

@implementation VLMDependentSet
    {
    __strong NSMutableArray* _dependents;
    }

+ (instancetype) set
    {
    return([self new]);
    }

- (instancetype) init
    {
    self = [super init];
    if (self)
        {
        _dependents = [NSMutableArray array];
        }
    return(self);
    }

- (BOOL) containsDependent: (VLMDependent) dependent
    {
    for (VLMWeakHolder* holder in _dependents)
        {
        if (holder->dependent == dependent)
            {
            return(YES);
            }
        }
    return(NO);
    }

- (void) addDependent: (VLMDependent) dependent
    {
    if (![self containsDependent: dependent])
        {
        VLMWeakHolder* holder;
        
        holder = [VLMWeakHolder new];
        holder->dependent = dependent;
        [_dependents addObject: holder];
        }
    }

- (void) removeDependent: (VLMDependent) dependent
    {
    VLMWeakHolder* targetHolder = nil;
    
    for (VLMWeakHolder* holder in _dependents)
        {
        if (holder->dependent == dependent)
            {
            targetHolder = holder;
            break;
            }
        }
    if (targetHolder)
        {
        [_dependents removeObject: targetHolder];
        }
    }

- (void) update: (NSString*) aspect with: (id) object from: (id) sender
    {
    NSMutableArray* nilDependents;
    
    nilDependents = [NSMutableArray array];
    for (VLMWeakHolder* holder in _dependents)
        {
        if (holder->dependent == nil)
            {
            [nilDependents addObject: holder];
            }
        else
            {
            [holder->dependent update: aspect with: object from: sender];
            }
        }
    [_dependents removeObjectsInArray: nilDependents];
    }

@end
