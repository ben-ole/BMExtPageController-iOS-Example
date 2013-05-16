//
//  BMMainViewController.h
//  BMExtPageControllerExampleIOS
//
//  Created by Benjamin Müller on 08.05.13.
//  Copyright (c) 2013 BM. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <BMExtendablePageController/BMExtendablePageController.h>

#define TEST_CONTROLLER_01_ID   @"TestController01"
#define TEST_CONTROLLER_02_ID   @"TestController02"

@interface BMMainViewController : UIViewController <BMExtendablePageControllerDelegate>

@property (weak, nonatomic) IBOutlet BMExtendablePageController *pageController;

- (IBAction)forwardHandler:(id)sender;
- (IBAction)backwardsHandler:(id)sender;
- (IBAction)sliderValueChangeHandler:(UISlider *)sender;
- (IBAction)sliderBeginEditingHandler:(UISlider *)sender;
- (IBAction)sliderEndEditingHandler:(UISlider *)sender;

@end
