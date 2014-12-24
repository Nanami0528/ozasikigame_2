//
//  ViewController.m
//  ozasikigame
//
//  Created by nanami on 2014/11/29.
//  Copyright (c) 2014年 nanami. All rights reserved.
//

#import "ViewController.h"
#import "GameoverViewController.h"
#import "GameclearViewController.h"

@interface ViewController (){
    NSTimer *timer;
    int count;
}



@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
   
   //タップ認識
    UITapGestureRecognizer *tapGesture =
    [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(view_Tapped:)];
    
    // ビューにジェスチャーを追加（タップしたか確認のビュー）
    [tapView addGestureRecognizer:tapGesture];
    
    
 
    
    
    1;
    
    count = 1;
    par.hidden=YES;
    gu.hidden=YES;
    red.hidden = NO;
   
    
}

- (void)view_Tapped:(UITapGestureRecognizer *)sender
{
    NSLog(@"タップされました．");
}


-(void)time:(NSTimer*)timer{
    count += 1;
    NSLog(@"time:%d", count);
    
    if (count%4 == 0) {
        par.hidden = YES; // 非表示になる。
        gu.hidden = NO;
        
        NSLog(@"1");
        
        
        
        [UIView animateWithDuration:0.5f delay:0 options:UIViewAnimationOptionCurveEaseInOut
                         animations:^{
            gu.center = CGPointMake(160, 250);

        }completion:^(BOOL finished) {
            red.hidden =YES;
            [UIView animateWithDuration:0.3f delay:0.2 options:UIViewAnimationOptionCurveEaseInOut
                             animations:^{
                gu.center = CGPointMake(160, 50);
            }completion:^(BOOL finished) {
            }];
        }];
        
        
    }else if(count%4==1){
        
//        red.hidden =YES;
        gu.hidden = YES;
        NSLog(@"2");
        
    }else if(count%2 == 0){
        
        par.hidden = NO;// 見えるようになる。
      
        
     
        
        
        
        [UIView animateWithDuration:0.5f delay:0 options:UIViewAnimationOptionCurveEaseInOut
                         animations:^{
                             par.center = CGPointMake(160, 250);
                         }completion:^(BOOL finished) {
                             [UIView animateWithDuration:0.3f delay:0.2 options:UIViewAnimationOptionCurveEaseInOut
                                              animations:^{
                                                  par.center = CGPointMake(160, 50);
                                              }completion:^(BOOL finished) {
                                              }];
                         }];
        
        
     
        
        
        gu.hidden = YES;
        red.hidden = NO;
        NSLog(@"3");
    }else{
        par.hidden=YES;
        

        gu.hidden=YES;
        
    
        red.hidden = NO;
        
        
        NSLog(@"4");
        
    }
    NSLog(@"a");
    
    
   
    
    
}


-(IBAction)start{
    
    startButton.hidden=YES;
    
    timer = [NSTimer scheduledTimerWithTimeInterval:1
                                             target:self
                                           selector:@selector(time:)
                                           userInfo:nil
                                            repeats:YES];


}
-(IBAction)tap{
    
    
    number=number+1;
 
      if (count%2 == 0) {
    GameoverViewController *gameover= [self.storyboard instantiateViewControllerWithIdentifier:@"gameover"];//手順1で付けた名前
       [self presentModalViewController:gameover animated:YES ];
  
    
      }
   
    if (number== 10) {

   GameclearViewController*gameclear= [self.storyboard instantiateViewControllerWithIdentifier:@"gameclear"];//手順1で付けた名前
    [self presentModalViewController:gameclear animated:YES ];
    
    }
    
    
    
}







- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
