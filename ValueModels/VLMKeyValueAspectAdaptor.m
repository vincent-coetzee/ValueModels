//
//  VLMKeyValueAspectAdaptor.m
//  ValueModels
//
//  Created by Vincent Coetzee on 2017/01/25.
//  Copyright © 2017 MacSemantics. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "VLMKeyValueAspectAdaptor.h"

@implementation VLMKeyValueAspectAdaptor
    {
    __strong id _model;
    }

+ (instancetype) on: (id) model forAspect: (NSString*) aspect
    {
    VLMKeyValueAspectAdaptor* adaptor;
    
    adaptor = [[self alloc] initWith: model];
    adaptor.aspect = aspect;
    return(adaptor);
    }

- (instancetype) initWith: (id) model
    {
    self = [super init];
    if (self)
        {
        _model = model;
        }
    return(self);
    }

- (void) dealloc
    {
    [_model removeObserver: self];
    _model = nil;
    }

- (id) model
    {
    return(_model);
    }

- (void) setModel: (id) model
    {
    [_model removeObserver: self];
    _model = model;
    [_model addObserver: self forKeyPath: _aspect options: NSKeyValueObservingOptionNew context: nil];
    }

- (void) update: (NSString*) aspect with: (id) object from: (id) sender
    {
    }

- (void)observeValueForKeyPath:(nullable NSString *)keyPath ofObject:(nullable id)object change:(nullable NSDictionary<NSKeyValueChangeKey, id> *)change context:(nullable void *)context
    {
    if ([_aspect isEqualToString: keyPath] && (object == _model))
        {
        id value;
        
        value = [object valueForKeyPath: _aspect];
        [self changed: @"value" with: value];
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
