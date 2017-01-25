//
//  VLMSelectionInList.m
//  ValueModels
//
//  Created by Vincent Coetzee on 2017/01/25.
//  Copyright © 2017 MacSemantics. All rights reserved.
//

#import "VLMSelectionInList.h"

@implementation VLMSelectionInList
    {
    __strong id _list;
    __strong id _selection;
    }

+ (instancetype) on: (id) list selection: (id) selection
    {
    VLMSelectionInList* listHolder;
    
    listHolder = [[self alloc] initWith: list];
    listHolder.selection = selection;
    return(listHolder);
    }

+ (instancetype) selectionInList
    {
    return([self on: [NSArray array] selection: nil]);
    }

- (instancetype) initWith: (id) list
    {
    self = [super init];
    if (self)
        {
        _list = list;
        }
    return(self);
    }

- (id) list
    {
    return(_list);
    }

- (void) setList: (id) list
    {
    _list = list;
    [self changed: @"list" with: list];
    }

- (id) selection
    {
    return(_selection);
    }

- (void) setSelection: (id) selection
    {
    _selection = selection;
    [self changed: @"selection" with: selection];
    }

@end
