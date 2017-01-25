//
//  UITableView+UITableView_Extensions.m
//  ValueModels
//
//  Created by Vincent Coetzee on 2017/01/25.
//  Copyright © 2017 MacSemantics. All rights reserved.
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
