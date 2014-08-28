//
//  SplashScreenViewController.h
//  ABDemo
//
//  Copyright (c) 2014 Vessel. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SplashViewController : UIViewController {
    UIViewController *_viewController;
    
}
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *progressIndicator;

@end
