//
//  VLMAbstractModel.m
//  ValueModels
//
//  Created by Vincent Coetzee on 2017/01/25.
//  Copyright © 2017 MacSemantics. All rights reserved.
//

#import "VLMAbstractModel.h"
#import "VLMDependentSet.h"

@implementation VLMAbstractModel
    {
    __strong VLMDependentSet* _dependents;
    }

- (instancetype) init
    {
    self = [super init];
    if (self)
        {
        _dependents = [VLMDependentSet set];
        }
    return(self);
    }

- (void) addDependent: (VLMDependent) dependent
    {
    [_dependents addDependent: dependent];
    }

- (void) removeDependent: (VLMDependent) dependent
    {
    [_dependents removeDependent: dependent];
    }

- (void) changed: (NSString*) aspect
    {
    [self changed: aspect with: nil];
    }

- (void) changed: (NSString*) aspect with: (id) object
    {
    [self changed: aspect with: object from: self];
    }

- (void) changed: (NSString*) aspect with: (id) object from: (id) sender
    {
    [_dependents update: aspect with: object from: sender];
    }

@end
