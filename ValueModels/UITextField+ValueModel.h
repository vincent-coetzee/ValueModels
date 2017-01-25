//
//  UITextField+UITextField_Extensions.h
//  ValueModels
//
//  Created by Vincent Coetzee on 2017/01/25.
//  Copyright © 2017 MacSemantics. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "VLMValueModel.h"

@interface UITextField (UITextField_ValueModel) <VLMDependence>

@property(readwrite,retain) VLMValueModel textModel;
@property(readwrite,retain) VLMValueModel textColorModel;

@end
