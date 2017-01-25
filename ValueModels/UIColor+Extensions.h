//
//  UIColor+UIColor_Extensions.h
//  ValueModels
//
//  Created by Vincent Coetzee on 2017/01/25.
//  Copyright © 2017 MacSemantics. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (UIColor_Extensions)

+ (NSArray*) kellyColors;
+ (NSArray*) crayonColors;
+ (instancetype) colorWithWebColor: (NSString*) string;
- (NSNumber*) hue;

@end
