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
    
    [VesselAB getVariationForTest:@"onboarding" WithSuccessBlock:^(NSString *testName, VesselABTestVariation variation) {
        
        // Variation A is our control i.e. default flow and in variation B - Introducing new user guide.
        if (variation == VesselABTestVariationA) {
            [self showUserLogin];
        }else{
            // Go to Guide View Controller.
            [self goToView:@"GuideViewController"];
        }
        
    } failureBlock:^{
        [self showUserLogin];
        
    }];
}

//2. Running second A/B test to decide if social login works better vs normal email login
- (void) showUserLogin{
    // 2. A/B test to decide if showing user guide upfront helps in registrations
    [VesselAB getVariationForTest:@"" WithSuccessBlock:^(NSString *testName, VesselABTestVariation variation)
    {
         [self goToView:@"LoginViewController"];
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
