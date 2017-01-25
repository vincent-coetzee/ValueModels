//
//  VLMColorPicker.h
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

// WARNING
//
// This class is purely intended as a demonstration of how to use
// ValueModels to write a custom control. It's a crappy implementation
// of a rudimentary color picker control for iOS. The SelectionInList that
// it models can be fed straight into other widgets that understand how to
// consume ValueModels. Please don't judge my iOS skills based on this class
// since it is ugly and crude.
//

#import <UIKit/UIKit.h>
#import "VLMSelectionInList.h"

@interface VLMColorPicker : UIView <VLMDependence>

@property(readwrite,retain) IBOutlet VLMSelectionInList* listModel;

@end
