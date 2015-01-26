//
//  GameViewController.h
//  helicopter_lander
//
//  Created by ScottStubblebine on 1/20/15.
//  Copyright (c) 2015 ScottStubblebine. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <stdlib.h>
#import <time.h>
#import "Helicopter.h"
#import "Target.h"

@interface GameViewController : UIViewController

- (IBAction)moveLeft:(id)sender;

- (IBAction)moveRight:(id)sender;

-(IBAction)quit_app:(id)sender;
-(IBAction)touchRelease:(id)sender;

-(void) detect_collision;
-(void) quit;

@end
