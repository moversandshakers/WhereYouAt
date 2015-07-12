//
//  ViewController.m
//  WhereYouAt
//
//  Created by Jon Richards on 7/11/15.
//  Copyright (c) 2015 MoversAndShakers. All rights reserved.
//

#import "ViewController.h"
#import "LoginViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)startButtonPressed:(id)sender {
    
    LoginViewController *lvc = (LoginViewController *)[self.storyboard instantiateViewControllerWithIdentifier:@"loginViewController"];
    
    lvc.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    [self presentViewController:lvc animated:YES completion:nil];
    
}

@end
