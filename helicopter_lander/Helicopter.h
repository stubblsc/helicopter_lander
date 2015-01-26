//
//  Helicopter.h
//  helicopter_lander
//
//  Created by ScottStubblebine on 1/20/15.
//  Copyright (c) 2015 ScottStubblebine. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreMotion/CoreMotion.h>
#import <UIKit/UIKit.h>

@interface Helicopter : NSObject

@property int x_pos, y_pos, score;
@property bool has_landed;
@property CMAttitude *att;
@property double roll;
@property UIView *gameView;
@property CGRect heliRect;
@property UIImageView *player;
@property NSTimer *heli_timer;

-(Helicopter *) initHelicopter: (UIView *) gameView;
-(void) drop;
-(void) moveLeft;
-(void) moveRight;
-(void) fly;

@end
