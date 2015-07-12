//
//  LoginViewController.m
//  WhereYouAt
//
//  Created by Jon Richards on 7/11/15.
//  Copyright (c) 2015 MoversAndShakers. All rights reserved.
//

#import "LoginViewController.h"
#import "WaitingViewController.h"

@implementation LoginViewController

- (IBAction)loginButtonPressed:(id)sender {
    
    WaitingViewController *wvc = (WaitingViewController *)[self.storyboard instantiateViewControllerWithIdentifier:@"waitingViewController"];
    
    wvc.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentViewController:wvc animated:YES completion:nil];
}

- (IBAction)loginButtonTouchDown:(id)sender {
    self.bgView.image = [UIImage imageNamed: @"login6.png"];
}

@end
