//
//  GuideViewController.m
//  ABDemo
//
//  Created by Koustubha Deshpande on 4/1/14.
//  Copyright (c) 2014 Vessel. All rights reserved.
//

#import "GuideViewController.h"


@interface GuideViewController ()

@end

@implementation GuideViewController

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
    [VesselAB reportCheckPoint:@"Inside User Guide"];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
