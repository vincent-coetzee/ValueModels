//
//  VLMValueModel.h
//  ValueModels
//
//  Created by Vincent Coetzee on 2017/01/25.
//  Copyright © 2017 MacSemantics. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "VLMModel.h"

@protocol VLMValueModeling <VLMModel>

@property(readwrite,retain) id value;

@end

typedef id <VLMValueModeling> VLMValueModel;

