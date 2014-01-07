//
//  ViewController.m
//  ABDemo
//
//  Created by Anupam Godbole on 8/22/13.
//  Copyright (c) 2013 Vessel. All rights reserved.
//

#import "ViewController.h"
#import <Vessel/Vessel.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.lblSubtitle.text = [VesselAB valueForVariationVariable:@"welcome_text" defaultValue:@"Let's get started"];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)signUpWithEmail:(id)sender {
    [VesselAB checkpointVisited:@"Sign Up"];
        
}

- (IBAction)signUpWithFacebook:(id)sender {
    [VesselAB checkpointVisited:@"Sign Up Facebook"];
    
}
- (IBAction)signUpWithGoogle:(id)sender {
    [VesselAB checkpointVisited:@"Sign Up Goolge"];
}

@end
