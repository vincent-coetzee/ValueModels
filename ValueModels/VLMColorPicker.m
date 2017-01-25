//
//  VLMColorPicker.m
//  ValueModels
//
//  Created by Vincent Coetzee on 2017/01/25.
//  Copyright © 2017 MacSemantics. All rights reserved.
//

#import "VLMColorPicker.h"
#import "VLMSelectionInList.h"

@implementation VLMColorPicker
    {
    __strong NSMutableArray* _layers;
    __strong VLMSelectionInList* _list;
    }

- (instancetype) initWithFrame: (CGRect) frame
    {
    self = [super initWithFrame: frame];
    if (self)
        {
        [self initLayers];
        }
    return(self);
    }

- (void) initLayers
    {
    _layers = [NSMutableArray array];
    [self initList];
    [self initLayersFromList];
    }

- (void) awakeFromNib
    {
    [super awakeFromNib];
    [self initLayers];
    }

- (void) initList
    {
    self.listModel = [VLMSelectionInList selectionInList];
    }

- (void) initLayersFromList
    {
    NSArray* list;
    
    for (CALayer* aLayer in _layers)
        {
        [aLayer removeFromSuperlayer];
        }
    _layers = [NSMutableArray array];
    list = _list.list;
    for (UIColor* color in list)
        {
        CALayer* aLayer;
        
        aLayer = [CALayer layer];
        aLayer.backgroundColor = color.CGColor;
        [self.layer addSublayer: aLayer];
        [_layers addObject: aLayer];
        }
    [self setNeedsLayout];
    }

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
    {
    UITouch* touch;
    CGPoint location;
    
    touch = [touches anyObject];
    location = [touch locationInView: self];
    for (CALayer* aLayer in _layers)
        {
        if (CGRectContainsPoint(aLayer.frame,location))
            {
            _list.selection = [UIColor colorWithCGColor: aLayer.backgroundColor];
            }
        }
    }

- (void) layoutSubviews
    {
    CGRect bounds;
    CGFloat xPadding;
    CGFloat yPadding;
    CGFloat width;
    CGFloat height;
    CGPoint offset;
    
    [super layoutSubviews];
    bounds = self.bounds;
    xPadding = 2*8 + (_layers.count - 1)*4;
    yPadding = 2*4;
    width = (bounds.size.width - xPadding) / _layers.count;
    height = (bounds.size.height - yPadding) / 2.0;
    offset = CGPointMake(8,4);
    for (CALayer* aLayer in _layers)
        {
        aLayer.frame = CGRectMake(offset.x,offset.y,width,height);
        offset.x += width + 4;
        }
    }

- (void) setListModel: (VLMSelectionInList*) listModel
    {
    [_list removeDependent: self];
    _list = listModel;
    [_list addDependent: self];
    }

- (VLMSelectionInList*) listModel
    {
    return(_list);
    }

- (void) update: (NSString*) aspect with: (id) object from: (id) sender
    {
    if ([aspect isEqualToString: @"list"] && (sender == _list))
        {
        [self initLayersFromList];
        }
    else if ([aspect isEqualToString: @"selection"] && (sender == _list))
        {
        [self updateSelection];
        }
    }

- (void) updateSelection
    {
    }

@end
