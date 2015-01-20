//
//  Helicopter.m
//  helicopter_lander
//
//  Created by ScottStubblebine on 1/20/15.
//  Copyright (c) 2015 ScottStubblebine. All rights reserved.
//

#import "Helicopter.h"

@implementation Helicopter

@synthesize x_pos, y_pos;
@synthesize has_landed;
@synthesize att;

-(void) set_position:(int)x :(int)y{
    self.x_pos = x;
    self.y_pos = y;
}

-(void) drop{
    self.y_pos -= 1;
}

-(void) fly{
    self.y_pos += 2;
}

-(void) move_horiz{
    self.x_pos += att.roll;
}

@end
