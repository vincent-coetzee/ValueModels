//
//  ViewController.m
//  ValueModels
//
//  Created by Vincent Coetzee on 2017/01/25.
//  Copyright © 2017 MacSemantics. All rights reserved.
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
