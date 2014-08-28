//
//  ViewController.m
//  ABDemo
//
//  Copyright (c) 2014 Vessel. All rights reserved.
//

#import "LoginViewController.h"
#import <Vessel/Vessel.h>

@interface LoginViewController ()

@end

@implementation LoginViewController


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
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)signUpWithEmail:(id)sender {
    // This will report a checkpoint to all active tests.
    [VesselAB reportCheckPoint:@"Email Login"];
    
}
- (IBAction)signUpWithFacebook:(id)sender {
    // This will report a checkpoint to only social email test if it is active.
    [VesselAB reportCheckPoint:@"Facebook Login" forTest:@"socialemail"];
}
- (IBAction)signUpWithGPlus:(id)sender {
    // This will report a checkpoint to only social email test if it is active with meta data.
    NSDictionary *metaData = @{@"userId" : @123455 , @"paidUer": @YES};
    [VesselAB reportCheckPoint:@"Facebook Login" forTest:@"socialemail" with:metaData];

}


@end
