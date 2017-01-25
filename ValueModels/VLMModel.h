//
//  VLMModel.h
//  ValueModels
//
//  Created by Vincent Coetzee on 2017/01/25.
//  Copyright © 2017 MacSemantics. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "VLMDependent.h"

@protocol VLMModel <NSObject>

- (void) addDependent: (VLMDependent) dependent;
- (void) removeDependent: (VLMDependent) dependent;
- (void) changed: (NSString*) aspect with: (id) object from: (id) sender;

@optional

- (void) changed: (NSString*) aspect with: (id) object;
- (void) changed: (NSString*) aspect;

@end
