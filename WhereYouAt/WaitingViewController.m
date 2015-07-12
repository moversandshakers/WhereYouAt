//
//  WaitingViewController.m
//  WhereYouAt
//
//  Created by Jon Richards on 7/11/15.
//  Copyright (c) 2015 MoversAndShakers. All rights reserved.
//

#import "WaitingViewController.h"
#import "SwipeViewController.h"
#import "AppDelegate.h"
@import SenseSdk;
#import "EnteredMyArea.h"

@implementation WaitingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    _open = YES;
    
    [NSTimer scheduledTimerWithTimeInterval: 1.0
                                             target: self
                                           selector: @selector(onTick:)
                                           userInfo: nil
                                            repeats: NO];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)triggerButtonPressed:(id)sender {
    
    [AppDelegate sharedAppDelegate].waitingViewController = self;
    
    SenseSdkErrorPointer *errorPtr = [SenseSdkErrorPointer create];
    
    //NSArray* places = [[NSArray alloc] initWithObjects:[[AppDelegate sharedAppDelegate] geofence], nil];
    [SenseSdkTestUtility fireTriggerFromRecipe:@"EnteredMyArea"
                               confidenceLevel:ConfidenceLevelMedium
                                        places:[[AppDelegate sharedAppDelegate] geofence]
                                      errorPtr:errorPtr];
    if(errorPtr.error != nil) {
        NSLog(@"Error sending trigger: %@", errorPtr.error.message);
    }
    
        
}

-(void)onTick:(NSTimer*)timer
{
    float t = 0.5;
    if(_open)
    {
        _open = NO;
        t = 1.0;
    }
    else
    {
        _open = YES;
    }
    
    if(_open)
        self.bgView.image = [UIImage imageNamed: @"eyes.png"];
    else
        self.bgView.image = [UIImage imageNamed: @"diarrhea.png"];
    
    [NSTimer scheduledTimerWithTimeInterval: t
                                     target: self
                                   selector: @selector(onTick:)
                                   userInfo: nil
                                    repeats: NO];
}


@end
