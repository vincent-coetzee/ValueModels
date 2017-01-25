//
//  VLMColorPicker.h
//  ValueModels
//
//  Created by Vincent Coetzee on 2017/01/25.
//  Copyright © 2017 MacSemantics. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "VLMSelectionInList.h"

@interface VLMColorPicker : UIView <VLMDependence>

@property(readwrite,retain) IBOutlet VLMSelectionInList* listModel;

@end
