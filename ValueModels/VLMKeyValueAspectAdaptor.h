//
//  VLMKeyValueAspectAdaptor.h
//  ValueModels
//
//  Created by Vincent Coetzee on 2017/01/25.
//  Copyright © 2017 MacSemantics. All rights reserved.
//

#import "VLMAbstractModel.h"
#import "VLMValueModel.h"

@interface VLMKeyValueAspectAdaptor : VLMAbstractModel <VLMValueModeling,VLMDependence>

@property(readwrite,retain) NSString* aspect;
@property(readwrite,retain) id model;

+ (instancetype) on: (id) model forAspect: (NSString*) aspect;
- (instancetype) initWith: (id) model;

@end
