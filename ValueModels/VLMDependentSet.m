//
//  VMLDependentSet.m
//  ValueModels
//
//  Created by Vincent Coetzee on 2017/01/25.
//  Copyright © 2017 MacSemantics. All rights reserved.
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
