//
//  VLMValueHolder.h
//  ValueModels
//
//  Created by Vincent Coetzee on 2017/01/25.
//  Copyright © 2017 MacSemantics. All rights reserved.
//

#import "VLMValueModel.h"
#import "VLMAbstractModel.h"
#import <UIKit/UIKit.h>

@interface VLMValueHolder : VLMAbstractModel <VLMValueModeling>

@property(readwrite,assign) NSInteger intValue;
@property(readwrite,retain) id value;
@property(readwrite,assign) CGFloat CGFloatValue;

+ (instancetype) on: (id) object;
+ (instancetype) onInt: (NSInteger) anInteger;
+ (instancetype) onCGFloat: (CGFloat) aFloat;

@end
