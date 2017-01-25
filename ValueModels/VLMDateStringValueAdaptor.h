//
//  VLMDateStringValueAdaptor.h
//  ValueModels
//
//  Created by Vincent Coetzee on 2017/01/25.
//  Copyright © 2017 MacSemantics. All rights reserved.
//

#import "VLMAbstractModel.h"
#import "VLMValueModel.h"

@interface VLMDateStringValueAdaptor : VLMAbstractModel <VLMValueModeling,VLMDependence>

@property(readwrite,retain) VLMValueModel dateModel;

+ (instancetype) on: (VLMValueModel) dateModel;

@end
