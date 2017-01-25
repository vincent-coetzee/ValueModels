//
//  VLMAspectAdaptor.h
//  ValueModels
//
//  Created by Vincent Coetzee on 2017/01/25.
//  Copyright © 2017 MacSemantics. All rights reserved.
//

#import "VLMAbstractModel.h"
#import "VLMValueModel.h"

@interface VLMAspectAdaptor : VLMAbstractModel <VLMDependence,VLMValueModeling>

@property(readwrite,retain) id model;
@property(readwrite,retain) NSString* aspect;
@property(readwrite,retain) id value;

+ (instancetype) on: (id) model forAspect: (NSString*) aspect;

@end
