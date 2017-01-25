//
//  VMLDependentSet.h
//  ValueModels
//
//  Created by Vincent Coetzee on 2017/01/25.
//  Copyright © 2017 MacSemantics. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "VLMDependent.h"

@interface VLMDependentSet : NSObject

+ (instancetype) set;

- (void) addDependent: (VLMDependent) dependent;
- (void) removeDependent: (VLMDependent) dependent;
- (void) update: (NSString*) aspect with: (id) object from: (id) sender;

@end
