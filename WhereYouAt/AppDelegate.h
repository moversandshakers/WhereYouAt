//
//  AppDelegate.h
//  WhereYouAt
//
//  Created by Jon Richards on 7/11/15.
//  Copyright (c) 2015 MoversAndShakers. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WaitingViewController.h"



@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) NSArray *geofence;
@property (strong, nonatomic) WaitingViewController *waitingViewController;


+ (AppDelegate*) sharedAppDelegate;


@end

