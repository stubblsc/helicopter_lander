//
//  Helicopter.m
//  helicopter_lander
//
//  Created by ScottStubblebine on 1/20/15.
//  Copyright (c) 2015 ScottStubblebine. All rights reserved.
//


#import "Helicopter.h"

@implementation Helicopter

-(Helicopter *) initHelicopter:(UIView *)gameView{
    self.gameView = gameView;
    
    UIImage *helicopterImage = [UIImage imageNamed:@"heli.jpg"];
    
    srand(time(NULL));
    int x_coord = rand() % 300;
    self.heliRect = CGRectMake(x_coord, 10, 32, 32);
    self.player = [[UIImageView alloc] initWithFrame: self.heliRect];
    [self.player setImage: helicopterImage];
    //helicopterView.frame = CGRectMake(x_coord,10,32,32);
    
    [self.gameView addSubview: self.player];
    self.heli_timer = [NSTimer scheduledTimerWithTimeInterval:.03
                                                       target:self
                                                     selector:@selector(drop)
                                                     userInfo:nil
                                                      repeats:YES];
    return self;
}

-(void) drop
{
    self.heliRect = CGRectOffset(self.heliRect, 0, 2);
    self.player.frame = self.heliRect;
    
    if(self.heliRect.origin.y > 635){
        [self.heli_timer invalidate];
        self.heli_timer = NULL;
        
    }
}

-(void) moveLeft{
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    if(self.heliRect.origin.x <= screenRect.size.width
       - self.heliRect.size.width - 10){
        self.heliRect = CGRectOffset(self.heliRect, -5, 0);
        self.player.frame = self.heliRect;
    }
}

-(void) moveRight{
    if(self.heliRect.origin.x >= 10){
        self.heliRect = CGRectOffset(self.heliRect, +5, 0);
        self.player.frame = self.heliRect;
    }
}

@end
