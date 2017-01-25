//
//  ViewController.m
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

#import "ViewController.h"
#import "VLMColorPicker.h"
#import "UIColor+Extensions.h"
#import "VLMAspectAdaptor.h"
#import "UILabel+ValueModel.h"

@interface ViewController ()

@end

@implementation ViewController
    {
    IBOutlet __weak VLMColorPicker* _colorPicker;
    IBOutlet __weak UILabel* _label;
    }

- (void)viewDidLoad
    {
    [super viewDidLoad];
    [self initColorPicker];
    [self initLabel];
    }

- (void) initLabel
    {
    _label.textColorModel = [VLMAspectAdaptor on: _colorPicker.listModel forAspect: @"selection"];
    }

- (void) initColorPicker
    {
    _colorPicker.listModel.list = [UIColor kellyColors];
    }

- (IBAction) onKellyColorsTapped: (id) sender
    {
    _colorPicker.listModel.list = [UIColor kellyColors];
    }

- (IBAction) onCrayonColorsTapped: (id) sender
    {
    _colorPicker.listModel.list = [UIColor crayonColors];
    }

- (void)didReceiveMemoryWarning
    {
    [super didReceiveMemoryWarning];
    }


@end
