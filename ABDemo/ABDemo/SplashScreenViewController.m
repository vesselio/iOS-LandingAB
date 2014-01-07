//
//  SplashScreenViewController.m
//  ABDemo
//
//  Created by Anupam Godbole on 8/22/13.
//  Copyright (c) 2013 Vessel. All rights reserved.
//

#import "SplashScreenViewController.h"
#import <Vessel/Vessel.h>
#import "ViewController.h"
#import "AppDelegate.h"

@interface SplashScreenViewController ()

@end

@implementation SplashScreenViewController

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
    
    // Do any additional setup after loading the view from its nib.
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(testChanged:) name:VesselABTestChangedNotification object:nil];
    [VesselAB getTestWithSuccessBlock:^ (NSString *testName, VesselABTestVariation variation) {
        NSString *nibName;
        if (variation == VesselABTestVariationA) {
            nibName = @"ViewControllerA";
        } else if (variation == VesselABTestVariationB) {
            nibName = @"ViewControllerB";
        }
        [self loadView:nibName];
    } failureBlock:^ {
        [self loadView:@"ViewControllerB"];
    }];
}

- (void) testChanged:(NSNotification*)notification {
    [VesselAB reloadTest];
}


- (void) loadView:(NSString *)nibName{
    [self.view removeFromSuperview];
    _viewController = [[ViewController alloc] initWithNibName:nibName bundle:nil];
    ((AppDelegate*)[UIApplication sharedApplication].delegate).window.rootViewController = _viewController;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
