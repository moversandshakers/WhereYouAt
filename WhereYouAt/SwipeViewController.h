//
//  SwipeViewController.h
//  WhereYouAt
//
//  Created by Jon Richards on 7/11/15.
//  Copyright (c) 2015 MoversAndShakers. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MDCSwipeToChoose/MDCSwipeToChoose.h>

@interface SwipeViewController : UIViewController <MDCSwipeToChooseDelegate>
{
    int counter;
}

@end
