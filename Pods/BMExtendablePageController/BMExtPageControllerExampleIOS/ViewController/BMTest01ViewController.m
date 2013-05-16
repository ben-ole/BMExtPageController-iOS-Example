//
//  BMTest01ViewController.m
//  BMExtPageControllerExampleIOS
//
//  Created by Benjamin Müller on 08.05.13.
//  Copyright (c) 2013 BM. All rights reserved.
//

#import "BMTest01ViewController.h"

@implementation BMTest01ViewController

#pragma mark - INIT
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - PROPERTIES
-(void)setLabelText:(NSString *)labelText{
    _labelText = [labelText copy];
    
    if(_label) _label.text = _labelText;
}

-(void)setColor:(UIColor *)color{
    _color = color;
    
    if(self.view && _color) self.view.backgroundColor = _color;
}

-(void)setLabel:(UILabel *)label{
    _label = label;
    
    if (label && _labelText) _label.text = _labelText;
}

-(void)setView:(UIView *)view{
    [super setView:view];
    
    if(self.view && _color) self.view.backgroundColor = _color;
}

@end
