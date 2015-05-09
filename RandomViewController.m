//
//  RandomViewController.m
//  ozasikigame
//
//  Created by nanami on 2015/02/28.
//  Copyright (c) 2015年 nanami. All rights reserved.
//

#import "RandomViewController.h"

@interface RandomViewController ()

@end

@implementation RandomViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
       
    timeCount = 0;
    gu.hidden = YES;
    par.hidden =YES;
    
}

-(void)time:(NSTimer*)timer{

    timeCount += 1;
    timecount.text = [NSString stringWithFormat:@"%d",timeCount];

    
    switch (timeCount) {
     
     case 0:
     gu.hidden = YES;
     par.hidden =NO;
     NSLog(@"par"); //手ぱーが出てきた時
     red.hidden = NO;
     
     break;
     
     
     case 1:
     gu.hidden = YES;
     par.hidden =YES;
     red.hidden = NO;
     
     break;
     
     
     case 2:
     gu.hidden = NO;
     par.hidden =YES;
     red.hidden = YES;
     
     break;
     
     case 3:
     gu.hidden = YES;
     par.hidden =YES;
     red.hidden = YES;
     
     break;
     
     case 4:
     gu.hidden = YES;
     par.hidden =NO;
     red.hidden = NO;
     
     break;
     
     case 5:
     gu.hidden = YES;
     par.hidden =YES;
     red.hidden = NO;
     
     break;
     
     
     
     case 6:
     gu.hidden = NO ;
     par.hidden =YES;
     red.hidden = NO;
     
     break;
     
     case 7:
     gu.hidden =YES;
     par.hidden =YES;
     red.hidden =YES;
     
     break;
     
     case 8:
     gu.hidden =NO ;
     par.hidden =YES;
     red.hidden = YES;
     
     break;
     
     case 9:
     gu.hidden = YES;
     par.hidden =YES;
     red.hidden = YES;
     
     break;
     
     case 10:
     gu.hidden =YES;
     par.hidden =NO;
     red.hidden = NO;
     
     break;
     
     case 11:
     gu.hidden =YES;
     par.hidden =YES;
     red.hidden =NO;
     
     break;
     
     case 12:
     gu.hidden =NO;
     par.hidden =YES;
     red.hidden = YES;
     
     break;
     
     case 13:
     gu.hidden =YES;
     par.hidden =YES;
     red.hidden =YES;
     
     break;
     
     case 14:
     gu.hidden =YES;
     par.hidden =NO;
     red.hidden = NO;
     
     break;
     
     case 15:
     gu.hidden =YES;
     par.hidden =YES;
     red.hidden =NO;
     
     break;
     case 16:
     gu.hidden =YES;
     par.hidden =NO;
     red.hidden = NO;
     
     break;
     
        
     case 17:
     gu.hidden =YES;
     par.hidden =YES;
     red.hidden =NO;
     
     break;
     
     case 18:
     gu.hidden =NO;
     par.hidden =YES;
     red.hidden = YES;
     
     break;
     
     case 19:
     gu.hidden =YES;
     par.hidden =YES;
     red.hidden = YES;
     
     break;
     

     
    
     
     
     
     
     default:
     
     // 上記のいずれの値にも一致しない場合
     
     break;
     
     }

    
}


-(IBAction)start{
    
    startButton.hidden=YES;
    
    timer= [NSTimer scheduledTimerWithTimeInterval:1
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
