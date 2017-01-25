//
//  VLMDependent.h
//  ValueModels
//
//  Created by Vincent Coetzee on 2017/01/25.
//  Copyright © 2017 MacSemantics. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol VLMDependence <NSObject>

- (void) update: (NSString*) aspect with: (id) object from: (id) sender;

@optional

- (void) update: (NSString*) aspect with: (id) object;
- (void) update: (NSString*) aspect;

@end

typedef id <VLMDependence> VLMDependent;
