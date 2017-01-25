//
//  UITableView+ValueModel.m
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

#import "UITableView+ValueModel.h"
#import <objc/runtime.h>

@implementation UITableView (UITableView_ValueModel)

- (void) setListModel: (VLMSelectionInList*) listModel
    {
    VLMSelectionInList* currentModel;
    
    currentModel = (VLMSelectionInList*)objc_getAssociatedObject(self,@selector(listModel));
    [currentModel removeDependent: self];
    objc_setAssociatedObject(self,@selector(listModel),listModel,OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    self.delegate = listModel;
    self.dataSource = listModel;
    }

- (VLMSelectionInList*) listModel
    {
    VLMSelectionInList* currentModel;
    
    currentModel = (VLMSelectionInList*)objc_getAssociatedObject(self,@selector(listModel));
    return(currentModel);
    }

- (void) update: (NSString*) aspect with: (id) object from: (id) sender
    {
    if ([aspect isEqualToString: @"list"] && (sender == self.listModel))
        {
        [self reloadData];
        }
    else if ([aspect isEqualToString: @"selection"] && (sender == self.listModel))
        {
        }
    }
    
@end
