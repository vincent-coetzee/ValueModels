//
//  VLMAspectAdaptor.m
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
