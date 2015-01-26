//
//  Target.m
//  helicopter_lander
//
//  Created by ScottStubblebine on 1/22/15.
//  Copyright (c) 2015 ScottStubblebine. All rights reserved.
//

#import "Target.h"

@implementation Target

-(Target *) initTarget:(UIView *)gameView{
    self.gameView = gameView;
    
    UIImage *targetImage = [UIImage imageNamed:@"target.png"];
    
    srand(time(NULL));
    int x_coord = rand() % 260;
    self.tarRect = CGRectMake(x_coord, 660  , 75, 10);
    self.target = [[UIImageView alloc] initWithFrame: self.tarRect];
    [self.target setImage: targetImage];
    
    [self.gameView addSubview: self.target];
    self.count = 0;
    self.left = true;
    return self;
}

-(void) move{
    if(self.count % 10 == 0){
        if(self.left == true){
            self.left = false;
        }else{
            self.left = true;
        }
    }
    if(self.left){
        self.tarRect = CGRectOffset(self.tarRect, -10, 0);
        self.target.frame = self.tarRect;
    }else{
        self.tarRect = CGRectOffset(self.tarRect, +10, 0);
        self.target.frame = self.tarRect;
    }
    self.count++;
}

@end
