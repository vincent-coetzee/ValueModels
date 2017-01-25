//
//  UIColor+UIColor_Extensions.m
//  ValueModels
//
//  Created by Vincent Coetzee on 2017/01/25.
//  Copyright © 2017 MacSemantics. All rights reserved.
//

#import "UIColor+Extensions.h"
#import <stdlib.h>

@implementation UIColor (UIColor_Extensions)

+ (NSArray*) kellyColors
    {
    NSMutableArray* colors;
    NSArray* sortedColors;
    NSArray* descriptors;
    
    colors = [NSMutableArray array];
    [colors addObject: [UIColor colorWithWebColor: @"FFB300"]];    // Vivid Yellow
    [colors addObject: [UIColor colorWithWebColor: @"803E75"]];    // Strong Purple
    [colors addObject: [UIColor colorWithWebColor: @"FF6800"]];    // Vivid Orange
    [colors addObject: [UIColor colorWithWebColor: @"A6BDD7"]];    // Very Light Blue
    [colors addObject: [UIColor colorWithWebColor: @"C10020"]];    // Vivid Red
    [colors addObject: [UIColor colorWithWebColor: @"CEA262"]];    // Grayish Yellow
    [colors addObject: [UIColor colorWithWebColor: @"817066"]];    // Medium Gray
    [colors addObject: [UIColor colorWithWebColor: @"007D34"]];    // Vivid Green
    [colors addObject: [UIColor colorWithWebColor: @"F6768E"]];    // Strong Purplish Pink
    [colors addObject: [UIColor colorWithWebColor: @"00538A"]];    // Strong Blue
    [colors addObject: [UIColor colorWithWebColor: @"FF7A5C"]];    // Strong Yellowish Pink
    [colors addObject: [UIColor colorWithWebColor: @"53377A"]];    // Strong Violet
    [colors addObject: [UIColor colorWithWebColor: @"FF8E00"]];    // Vivid Orange Yellow
    [colors addObject: [UIColor colorWithWebColor: @"B32851"]];    // Strong Purplish Red
    [colors addObject: [UIColor colorWithWebColor: @"F4C800"]];    // Vivid Greenish Yellow
    [colors addObject: [UIColor colorWithWebColor: @"7F180D"]];    // Strong Reddish Brown
    [colors addObject: [UIColor colorWithWebColor: @"93AA00"]];    // Vivid Yellowish Green
    [colors addObject: [UIColor colorWithWebColor: @"593315"]];    // Deep Yellowish Brown
    [colors addObject: [UIColor colorWithWebColor: @"F13A13"]];    // Vivid Reddish Orange
    [colors addObject: [UIColor colorWithWebColor: @"232C16"]];    // Dark Olive Green
    descriptors = @[[NSSortDescriptor sortDescriptorWithKey: @"hue" ascending: NO]];
    sortedColors = [colors sortedArrayUsingDescriptors: descriptors];
    return(sortedColors);
    }

+ (NSArray*) crayonColors
    {
    NSMutableArray* colors;
    NSArray* sortedColors;
    NSArray* descriptors;
    
    colors = [NSMutableArray array];
    [colors addObject: [UIColor blackColor]];
    [colors addObject: [UIColor redColor]];
    [colors addObject: [UIColor greenColor]];
    [colors addObject: [UIColor blueColor]];
    [colors addObject: [UIColor orangeColor]];
    [colors addObject: [UIColor cyanColor]];
    [colors addObject: [UIColor magentaColor]];
    [colors addObject: [UIColor yellowColor]];
    [colors addObject: [UIColor purpleColor]];
    [colors addObject: [UIColor brownColor]];
    [colors addObject: [UIColor grayColor]];
    [colors addObject: [UIColor lightGrayColor]];
    [colors addObject: [UIColor darkGrayColor]];
    descriptors = @[[NSSortDescriptor sortDescriptorWithKey: @"hue" ascending: NO]];
    sortedColors = [colors sortedArrayUsingDescriptors: descriptors];
    return(sortedColors);
    }

+ (instancetype) colorWithWebColor: (NSString*) string
    {
    char redString[3];
    char greenString[3];
    char blueString[3];
    CGFloat red;
    CGFloat green;
    CGFloat blue;
    
    if (string.length != 6)
        {
        return(nil);
        }
    redString[0] = [string characterAtIndex: 0];
    redString[1] = [string characterAtIndex: 1];
    redString[2] = 0;
    greenString[0] = [string characterAtIndex: 2];
    greenString[1] = [string characterAtIndex: 3];
    greenString[2] = 0;
    blueString[0] = [string characterAtIndex: 4];
    blueString[1] = [string characterAtIndex: 5];
    blueString[2] = 0;
    red = strtol(redString,NULL,16) / 255.0;
    green = strtol(greenString,NULL,16) / 255.0;
    blue = strtol(blueString,NULL,16) / 255.0;
    return([UIColor colorWithRed: red green: green blue: blue alpha: 1.0]);
    }

- (NSNumber*) hue
    {
    CGFloat hue = 0;
    
    [self getHue: &hue saturation: nil brightness: nil alpha: nil];
    return(@(hue));
    }

@end
