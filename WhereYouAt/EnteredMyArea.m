//
//  EnteredRestaurantCallback.m
//  WhereYouAt
//
//  Created by Jon Richards on 7/11/15.
//  Copyright (c) 2015 MoversAndShakers. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EnteredMyArea.h"
#import "SwipeViewController.h"
#import "AppDelegate.h"

@import SenseSdk;
@interface EnteredMyArea ()
@end
@implementation EnteredMyArea
- (void)recipeFired:(RecipeFiredArgs*) args {
    
    // Your user has entered your geofence!
    
    NSLog(@"Recipe %@ fired at %@.", [[args recipe] name], [args timestamp]);
    for (TriggerFiredArgs* trigger in [args triggersFired]) {
        for (NSObject <NSCoding, Place>* place in [trigger places]) {
            NSLog(@"%@", [place description]);
            
            UIStoryboard *st = [UIStoryboard storyboardWithName:[[NSBundle mainBundle].infoDictionary objectForKey:@"UIMainStoryboardFile"] bundle:[NSBundle mainBundle]];
            
            SwipeViewController *svc = (SwipeViewController *)[st instantiateViewControllerWithIdentifier:@"swipeViewController"];
            
            svc.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
            [[[AppDelegate sharedAppDelegate] waitingViewController] presentViewController:svc animated:YES completion:nil];
            

            
        }
    }
}
@end

