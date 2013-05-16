//
//  BMMainViewController.m
//  BMExtPageControllerExampleIOS
//
//  Created by Benjamin Müller on 08.05.13.
//  Copyright (c) 2013 BM. All rights reserved.
//

#import "BMMainViewController.h"
#import "BMTest01ViewController.h"
#import "UIColor+Random.h"
#import <BMExtendablePageController/BMHorizontalFlipTransition.h>
#import <BMExtendablePageController/BMFadeTransition.h>
#import <BMExtendablePageController/BMHorizontalCTransition.h>

@implementation BMMainViewController{
    id<BMExtendableContinuousePageTransition> _currentTransition;
}

#pragma mark - VIEW STUFF

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    
    _pageController.loggingEnabled = YES;
    [_pageController setArrangedObjects:@[@"page 01",@"page 02", @"page 03", @"page 04"]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - PAGE CONTROLLER DELEGATE

-(NSString *)pageController:(BMExtendablePageController *)pageController identifierForIndex:(int)index{
    
    return (index < 3) ? TEST_CONTROLLER_01_ID : TEST_CONTROLLER_02_ID;
}

-(UIViewController *)pageController:(BMExtendablePageController *)pageController viewControllerForIdentifier:(NSString *)identifier{
    
    // remember to set the storyboardID for your view controllers in the storyboard file
    return [self.storyboard instantiateViewControllerWithIdentifier:identifier];
}

-(void)pageController:(BMExtendablePageController *)pageController prepareViewController:(UIViewController *)viewController withObject:(id)object{
    
    if ([viewController isKindOfClass:[BMTest01ViewController class]] &&
        [object isKindOfClass:[NSString class]]) {
        
        // set label text source
        [(BMTest01ViewController*)viewController setLabelText:object];
        
        // set a random background color
        [(BMTest01ViewController*)viewController setColor:[UIColor randomColor]];
    }
}

#pragma mark - TOUCH HANDLER

// Basic Transition
- (IBAction)forwardHandler:(id)sender {
    [_pageController nextPageWithTransitionStyle:[BMHorizontalFlipTransition transition]];
//    [_pageController nextPageWithTransitionStyle:[BMFadeTransition transition]];
}

- (IBAction)backwardsHandler:(id)sender {
    [_pageController prevPageWithTransitionStyle:[BMHorizontalFlipTransition transition]];
}

// Continuous Transition Part
- (IBAction)sliderValueChangeHandler:(UISlider *)sender {
    
    [_currentTransition updateTransitionWithValue:sender.value];
}

- (IBAction)sliderBeginEditingHandler:(UISlider *)sender {
    _currentTransition = [_pageController attachContinuouseTransition:[BMHorizontalCTransition transition]];
}

- (IBAction)sliderEndEditingHandler:(UISlider *)sender {
    [_currentTransition finishTransitionWithRelativeIndex:roundf(sender.value)];
    sender.value = 0.;
}
@end
