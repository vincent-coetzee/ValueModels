//
//  VLMSelectionInList.h
//  ValueModels
//
//  Created by Vincent Coetzee on 2017/01/25.
//  Copyright © 2017 MacSemantics. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "VLMAbstractModel.h"
#import "VLMDependent.h"

@interface VLMSelectionInList : VLMAbstractModel <UITableViewDataSource,UITableViewDelegate>

@property(readwrite,retain) id list;
@property(readwrite,retain) id selection;

+ (instancetype) selectionInList;
+ (instancetype) on: (id) list selection: (id) selection;

@end
