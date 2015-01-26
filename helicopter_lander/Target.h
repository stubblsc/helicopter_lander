//
//  Target.h
//  helicopter_lander
//
//  Created by ScottStubblebine on 1/22/15.
//  Copyright (c) 2015 ScottStubblebine. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <CoreMotion/CoreMotion.h>

@interface Target : NSObject

@property int x_pos, y_pos;
@property bool has_landed;
@property CMAttitude *att;
@property double roll;
@property UIView *gameView;
@property CGRect tarRect;
@property UIImageView *target;
@property NSTimer *target_timer;
@property int count;
@property bool left;

-(Target *) initTarget: (UIView *) gameView;

-(void) move;

@end
