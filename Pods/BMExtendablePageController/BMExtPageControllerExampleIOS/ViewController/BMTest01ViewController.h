//
//  BMTest01ViewController.h
//  BMExtPageControllerExampleIOS
//
//  Created by Benjamin Müller on 08.05.13.
//  Copyright (c) 2013 BM. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BMTest01ViewController : UIViewController

@property (copy,nonatomic) NSString* labelText;
@property (nonatomic) UIColor*  color;
@property (weak, nonatomic) IBOutlet UILabel *label;

@end
