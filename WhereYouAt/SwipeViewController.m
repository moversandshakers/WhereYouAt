//
//  SwipeViewController.m
//  WhereYouAt
//
//  Created by Jon Richards on 7/11/15.
//  Copyright (c) 2015 MoversAndShakers. All rights reserved.
//

#import "SwipeViewController.h"
#import "MDCSwipeToChooseView.h"
#import "WaitingViewController.h"

@interface SwipeViewController ()

    @property (strong, nonatomic) MDCSwipeToChooseView *swipePicView;
    @property (strong, nonatomic) MDCSwipeToChooseView *swipeBackPicView;
    @property (strong, nonatomic) MDCSwipeToChooseViewOptions *options;


@end

@implementation SwipeViewController

#pragma mark - Creating and Customizing a MDCSwipeToChooseView

- (void)viewDidLoad {
    [super viewDidLoad];
    
    counter = 0;
    
    // You can customize MDCSwipeToChooseView using MDCSwipeToChooseViewOptions.
    self.options = [MDCSwipeToChooseViewOptions new];
    self.options.delegate = self;
    self.options.likedText = @"Hang";
    self.options.likedColor = [UIColor blueColor];
    self.options.nopeText = @"Pass";
    self.options.onPan = ^(MDCPanState *state){
        if (state.thresholdRatio == 1.f && state.direction == MDCSwipeDirectionLeft) {
            NSLog(@"Let go now to delete the photo!");
        }
    };
    
    CGRect f = CGRectMake(self.view.bounds.origin.x+10.0, self.view.bounds.origin.y+40.0,
                          self.view.bounds.size.width-20.0, self.view.bounds.size.width-20.0);
    self.swipePicView = [[MDCSwipeToChooseView alloc] initWithFrame:f
                                                                     options:self.options];
    self.swipePicView.imageView.image = [UIImage imageNamed:@"fb-lydia.jpg"];
    
    [self.view addSubview:self.swipePicView];
    
    
    self.swipeBackPicView = [[MDCSwipeToChooseView alloc] initWithFrame:f
                                        options:self.options];
    self.swipeBackPicView.imageView.image = [UIImage imageNamed:@"fb-daniel.jpg"];

    [self.view insertSubview:self.swipeBackPicView belowSubview:self.swipePicView];
}

#pragma mark - MDCSwipeToChooseDelegate Callbacks

// This is called when a user didn't fully swipe left or right.
- (void)viewDidCancelSwipe:(UIView *)view {
    NSLog(@"Couldn't decide, huh?");
}

// Sent before a choice is made. Cancel the choice by returning `NO`. Otherwise return `YES`.
- (BOOL)view:(UIView *)view shouldBeChosenWithDirection:(MDCSwipeDirection)direction {
    if (direction == MDCSwipeDirectionLeft) {
        return YES;
    } else {
        // Snap the view back and cancel the choice.
        //[UIView animateWithDuration:0.16 animations:^{
        //    view.transform = CGAffineTransformIdentity;
        //    view.center = [view superview].center;
        //}];
        return YES;
    }
}

// This is called then a user swipes the view fully left or right.
- (void)view:(UIView *)view wasChosenWithDirection:(MDCSwipeDirection)direction {
    
    counter ++;
    
    if (direction == MDCSwipeDirectionLeft) {
        NSLog(@"Photo deleted!");
    } else {
        NSLog(@"Photo saved!");
    }
    
    if(counter == 1)
    {
        self.swipePicView.hidden = YES;
        self.swipePicView = self.swipeBackPicView;
        self.swipePicView.imageView.image = [UIImage imageNamed:@"fb-daniel.jpg"];
        CGRect f = CGRectMake(self.view.bounds.origin.x+10.0, self.view.bounds.origin.y+40.0,
                              self.view.bounds.size.width-20.0, self.view.bounds.size.width-20.0);
        self.swipeBackPicView = [[MDCSwipeToChooseView alloc] initWithFrame:f
                                                                    options:self.options];
        self.swipeBackPicView.imageView.image = [UIImage imageNamed:@"fb-jon.jpg"];
        
        [self.view insertSubview:self.swipeBackPicView belowSubview:self.swipePicView];
    }
    if(counter == 2)
        self.swipePicView.imageView.image = [UIImage imageNamed:@"fb-jon.jpg"];
    if(counter > 2)
    {
        UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Friends Alerted!!"
                                                                       message:@"Your NEARBY friends have been sent a message that you want to hang out."
                                                                preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                              handler:^(UIAlertAction * action) {
                                                                  WaitingViewController *wvc = (WaitingViewController *)[self.storyboard instantiateViewControllerWithIdentifier:@"waitingViewController"];
                                                                  
                                                                  wvc.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
                                                                  [self presentViewController:wvc animated:YES completion:nil];
                                                              }];
        
        [alert addAction:defaultAction];
        [self presentViewController:alert animated:YES completion:nil];    }
}
- (IBAction)yesButtonPressed:(id)sender {
    [self.swipePicView mdc_swipe:MDCSwipeDirectionRight];
}

- (IBAction)noButtonPressed:(id)sender {
    [self.swipePicView mdc_swipe:MDCSwipeDirectionLeft];
}

@end
