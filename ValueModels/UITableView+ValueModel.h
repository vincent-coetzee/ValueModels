//
//  UITableView+UITableView_Extensions.h
//  ValueModels
//
//  Created by Vincent Coetzee on 2017/01/25.
//  Copyright © 2017 MacSemantics. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "VLMSelectionInList.h"

@interface UITableView (UITableView_ValueModel) <VLMDependence>

@property(readwrite,retain) VLMSelectionInList* listModel;

@end
