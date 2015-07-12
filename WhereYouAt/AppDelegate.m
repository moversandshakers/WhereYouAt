//
//  AppDelegate.m
//  WhereYouAt
//
//  Created by Jon Richards on 7/11/15.
//  Copyright (c) 2015 MoversAndShakers. All rights reserved.
//

#import "AppDelegate.h"
@import SenseSdk;
#import "EnteredMyArea.h"
#import "WaitingViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    [SenseSdk enableSdkWithKey:@"91a9f40a-0d2e-42bd-b19c-45fb8cdb02ae"];
    
    SenseSdkErrorPointer *errorPtr = [SenseSdkErrorPointer create];
    
    CustomGeofence *myplace = [[CustomGeofence alloc] initWithLatitude:37.124 longitude:-127.456 radius:50 customIdentifier:@"My Location"];
    self.geofence = [[NSArray alloc] initWithObjects:myplace, nil];
    Trigger *geoTrigger = [FireTrigger whenEntersGeofences: self.geofence conditions:nil errorPtr:nil];
    if(geoTrigger)
    {
        Recipe *recipe = [[Recipe alloc] initWithName: @"EnteredMyArea"
                          trigger:geoTrigger
                          // Do NOT restrict the firing to a particular time of day
                          timeWindow: [TimeWindow allDay]
                          // Wait at least 30 mins (default) between consecutive trigger firings.
                          cooldown: [Cooldown defaultCooldown]];
        EnteredMyArea *callback = [EnteredMyArea alloc];
        [SenseSdk registerWithRecipe:recipe delegate:callback errorPtr:errorPtr];
        
    }
    
    if ([errorPtr error] != nil) {
        NSLog(@"%@", [[errorPtr error] message]);
    }
    return YES;
    
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

+ (AppDelegate*) sharedAppDelegate
{
    return (AppDelegate*) [UIApplication sharedApplication].delegate;
}

@end
