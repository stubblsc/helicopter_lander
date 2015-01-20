//
//  Helicopter.h
//  helicopter_lander
//
//  Created by ScottStubblebine on 1/20/15.
//  Copyright (c) 2015 ScottStubblebine. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreMotion/CoreMotion.h>

@interface Helicopter : NSObject

@property int x_pos, y_pos;
@property bool has_landed;
@property CMAttitude *att;
@property double roll;

-(void) set_position: (int) x : (int) y;

-(void) drop;

-(void) fly;

-(void) move_horiz;

@end
