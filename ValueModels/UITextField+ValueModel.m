//
//  UITextField+UITextField_Extensions.m
//  ValueModels
//
//  Created by Vincent Coetzee on 2017/01/25.
//  Copyright © 2017 MacSemantics. All rights reserved.
//

#import "UITextField+ValueModel.h"
#import <objc/runtime.h>

@implementation UITextField (UITextField_ValueModel)

- (void) setTextModel: (VLMValueModel) textModel
    {
    VLMValueModel currentModel;
    
    currentModel = (VLMValueModel)objc_getAssociatedObject(self,@selector(textModel));
    [currentModel removeDependent: self];
    objc_setAssociatedObject(self,@selector(textModel),textModel,OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    [textModel addDependent: self];
    }

- (VLMValueModel) textModel
    {
    VLMValueModel currentModel;
    
    currentModel = (VLMValueModel)objc_getAssociatedObject(self,@selector(textModel));
    return(currentModel);
    }

- (void) setTextColorModel: (VLMValueModel) textColorModel
    {
    VLMValueModel currentModel;
    
    currentModel = (VLMValueModel)objc_getAssociatedObject(self,@selector(textColorModel));
    [currentModel removeDependent: self];
    objc_setAssociatedObject(self,@selector(textColorModel),textColorModel,OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    [textColorModel addDependent: self];
    }

- (VLMValueModel) textColorModel
    {
    VLMValueModel currentModel;
    
    currentModel = (VLMValueModel)objc_getAssociatedObject(self,@selector(textColorModel));
    return(currentModel);
    }

- (void) update: (NSString*) aspect with: (id) object from: (id) sender
    {
    if ([aspect isEqualToString: @"value"] && (sender == self.textModel))
        {
        self.text = self.textModel.value;
        }
    else if ([aspect isEqualToString: @"value"] && (sender == self.textColorModel))
        {
        self.textColor = self.textColorModel.value;
        }
    }

@end
