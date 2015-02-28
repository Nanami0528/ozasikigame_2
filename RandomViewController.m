//
//  RandomViewController.m
//  ozasikigame
//
//  Created by nanami on 2015/02/28.
//  Copyright (c) 2015年 nanami. All rights reserved.
//

#import "RandomViewController.h"

@interface RandomViewController (){
    NSTimer *timer;
    
}

@end

@implementation RandomViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    timeCount0 = 0;
    
}

-(void)time:(NSTimer*)timer{

    timeCount0 += 1;
    timecount.text = [NSString stringWithFormat:@"%d",timeCount0];

    
    
    
}


-(IBAction)start{
    
    startButton.hidden=YES;
    
    timer0= [NSTimer scheduledTimerWithTimeInterval:1
                                             target:self
                                           selector:@selector(time:)
                                           userInfo:nil
                                            repeats:YES];
    
    
}












- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
