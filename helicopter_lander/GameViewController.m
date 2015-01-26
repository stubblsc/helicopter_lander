//
//  GameViewController.m
//  helicopter_lander
//
//  Created by ScottStubblebine on 1/20/15.
//  Copyright (c) 2015 ScottStubblebine. All rights reserved.
//

#import "GameViewController.h"

@interface GameViewController ()

@property Helicopter *helicopter;
@property UIImageView *playerView;
@property Target *target;
@property NSTimer *t_timer;
@property NSTimer *h_timer;
@property NSTimer *c_timer;
@property NSTimer *f_timer;
@property UITapGestureRecognizer *tapGesture;

@end

@implementation GameViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self.helicopter action:@selector(fly)];
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"clouds.jpg"]];
    self.helicopter = [[[Helicopter alloc] init] initHelicopter:self.view];
    self.target = [[[Target alloc] init] initTarget:self.view];
    self.t_timer = [NSTimer scheduledTimerWithTimeInterval:.03
                                     target:self.target
                                   selector:@selector(move)
                                   userInfo:nil
                                    repeats:YES];
    self.h_timer = [NSTimer scheduledTimerWithTimeInterval:.03
                                                       target:self.helicopter
                                                     selector:@selector(drop)
                                                     userInfo:nil
                                                      repeats:YES];
    self.c_timer = [NSTimer scheduledTimerWithTimeInterval:.03
                                                    target:self
                                                  selector:@selector(detect_collision)
                                                  userInfo:nil
                                                   repeats:YES];
}

-(void) detect_collision{
    if(self.helicopter.heliRect.origin.y > 635){
        [self.h_timer invalidate];
        self.h_timer = NULL;
        [self.t_timer invalidate];
        self.t_timer = NULL;
        [self.c_timer invalidate];
        self.c_timer = NULL;
        int score;
        if(self.helicopter.heliRect.origin.x > self.target.tarRect.origin.y){
            score = 1000 - abs(self.helicopter.heliRect.origin.x - self.target.tarRect.origin.x);
        }else{
            score = 1000 - abs(self.target.tarRect.origin.x - self.helicopter.heliRect.origin.x);
        }
        char n[50];
        sprintf (n, "%i", score);
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Score"
                                                        message:(@(n))
                                                       delegate:nil
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
        [alert show];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)moveLeft:(id)sender {
    [self.helicopter moveLeft];
}

- (IBAction)moveRight:(id)sender {
    [self.helicopter moveRight];
}

- (IBAction)fly:(id)sender {
    [self.h_timer invalidate];
    self.h_timer = nil;
    self.h_timer = [NSTimer scheduledTimerWithTimeInterval:.03
                                                    target:self.helicopter
                                                  selector:@selector(fly)
                                                  userInfo:nil
                                                   repeats:YES];
}

- (IBAction)quit_app:(id)sender {
    exit(0);
}

- (IBAction)touchRelease:(id)sender {
    [self.h_timer invalidate];
    self.h_timer = nil;
    //if(self.h_timer == nil){
    self.h_timer = [NSTimer scheduledTimerWithTimeInterval:.03
                                                        target:self.helicopter
                                                      selector:@selector(drop)
                                                      userInfo:nil
                                                       repeats:YES];
    //}
}

/*-(void)releaseTouch{
    [self.f_timer invalidate];
    self.f_timer = nil;
    if(self.h_timer == nil){
        self.h_timer = [NSTimer scheduledTimerWithTimeInterval:.03
                                                        target:self.helicopter
                                                      selector:@selector(drop)
                                                      userInfo:nil
                                                       repeats:YES];
    }
}*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
