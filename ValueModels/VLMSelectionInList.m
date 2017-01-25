//
//  VLMSelectionInList.m
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
