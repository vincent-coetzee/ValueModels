//
//  VLMAspectAdaptor.m
//  ValueModels
//
//  Created by Vincent Coetzee on 2017/01/25.
//  Copyright © 2017 MacSemantics. All rights reserved.
//

#import "VLMAspectAdaptor.h"

@implementation VLMAspectAdaptor
    {
    __strong id _model;
    __strong NSString* _aspect;
    }

+ (instancetype) on: (id) model forAspect: (NSString*) aspect
    {
    VLMAspectAdaptor* adaptor;
    
    adaptor = [[self alloc] initWith: model];
    adaptor.aspect = aspect;
    return(adaptor);
    }

- (instancetype) initWith: (id) model
    {
    self = [super init];
    if (self)
        {
        self.model = model;
        }
    return(self);
    }

- (void) setAspect: (NSString*) aspect
    {
    _aspect = aspect;
    }

- (NSString*) aspect
    {
    return(_aspect);
    }

- (void) setModel: (id) model
    {
    [_model removeDependent: self];
    _model = model;
    [_model addDependent: self];
    }

- (id) model
    {
    return(_model);
    }

- (void) update: (NSString*) aspect with: (id) object from: (id) sender
    {
    if ([aspect isEqualToString: _aspect] && (sender == _model))
        {
        [self changed: @"value" with: self.value];
        }
    }

- (void) setValue: (id) value
    {
    [_model setValue: value forKeyPath: _aspect];
    }

- (id) value
    {
    return([_model valueForKeyPath: _aspect]);
    }

@end
