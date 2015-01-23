//
//  GameViewController.m
//  helicopter_lander
//
//  Created by ScottStubblebine on 1/20/15.
//  Copyright (c) 2015 ScottStubblebine. All rights reserved.
//

#import "GameViewController.h"
#import "Helicopter.h"

@interface GameViewController ()

@property Helicopter *helicopter;
@property UIImageView *playerView;

@end

@implementation GameViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    srand(time(NULL));
    int x_coord = rand() % 300;
    self.playerView.frame = CGRectMake(x_coord,10,32,32);//(50,400, 32,32);
    [self.view addSubview: self.playerView];
    self.helicopter = [[[Helicopter alloc] init] initHelicopter:self.view];
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
