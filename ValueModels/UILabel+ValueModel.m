//
//  UILabel+ValueModel.m
//  ValueModels
//
//  Created by Vincent Coetzee on 2017/01/25.
//  Copyright © 2017 Vincent Coetzee
//
//  Distributed under the permissive zlib license
//  Get the latest version from here:
//
//  https://github.com/vincent-coetzee/ValueModels
//
//  This software is provided 'as-is', without any express or implied
//  warranty.  In no event will the authors be held liable for any damages
//  arising from the use of this software.
//
//  Permission is granted to anyone to use this software for any purpose,
//  including commercial applications, and to alter it and redistribute it
//  freely, subject to the following restrictions:
//
//  1. The origin of this software must not be misrepresented; you must not
//  claim that you wrote the original software. If you use this software
//  in a product, an acknowledgment in the product documentation would be
//  appreciated but is not required.
//
//  2. Altered source versions must be plainly marked as such, and must not be
//  misrepresented as being the original software.
//
//  3. This notice may not be removed or altered from any source distribution.
//

#import "UILabel+ValueModel.h"
#import <objc/runtime.h>

@implementation UILabel (UILabel_ValueModel)

    @dynamic textModel;
    @dynamic textColorModel;

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
