//
//  SplashScreenViewController.m
//  ABDemo
//
//  Copyright (c) 2014 Vessel. All rights reserved.
//

#import "SplashViewController.h"
#import "LoginViewController.h"
#import "AppDelegate.h"
#import <Vessel/Vessel.h>

@interface SplashViewController ()

@end

@implementation SplashViewController

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
    [self.progressIndicator startAnimating];
    [self runOnBoardingTest];
}


// 1. First A/B test to decide if showing user guide upfront imporves overall registrations.
-(void) runOnBoardingTest{
    
    [VesselAB getVariationForTest:@"onboarding-test" WithSuccessBlock:^(NSString *testName, VesselABTestVariation variation) {
        
        // Variation A is our control i.e. default flow and in variation B - Introducing new user guide.
        if (variation == VesselABTestVariationA) {
            [self goToView:@"GuideViewController"];
        }else{
            // Go to Guide View Controller.
            [self goToView:@"SocialEmailController"];
        }
        
    } failureBlock:^{
       [self goToView:@"SocialEmailController"];
    }];
}



- (void) goToView:(NSString *)viewIdentifier{
    [self.view removeFromSuperview];
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"MainStoryboard" bundle:nil];
    _viewController = [storyboard instantiateViewControllerWithIdentifier:viewIdentifier];
    ((AppDelegate*)[UIApplication sharedApplication].delegate).window.rootViewController = _viewController;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
