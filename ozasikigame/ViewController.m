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
    int timeCount;
    int doubleTap;
    int guCount;

  
}



@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIView *tapView = [[UIView alloc]init];
    tapView.frame = CGRectMake(0, 0, 108, 97);
    tapView.backgroundColor = [UIColor clearColor];
    [tapButton addSubview:tapView];
    
    
   //タップ認識
    UITapGestureRecognizer *tapGesture =
    [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(view_Tapped:)];
    
    // ビューにジェスチャーを追加（タップしたか確認のビュー）
    [tapView addGestureRecognizer:tapGesture];
    
    
    //ボタンの長押し設定部分
    UILongPressGestureRecognizer *gestureRecognizer = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longPressedHandler:)];
    [guButton addGestureRecognizer:gestureRecognizer];


    
    timeCount = 1; //最初に手が出てくるようにするために１
    par.hidden=YES;
    gu.hidden=YES;
    red.hidden = NO;
    doubleTap = 0;
    
}


-(void)time:(NSTimer*)timer{
    timeCount += 1;
    countLabel.text = [NSString stringWithFormat:@"%d",timeCount];

    
    NSLog(@"time:%d", timeCount-1);
    
    if (timeCount%4 == 0) {
        par.hidden = YES; // 非表示になる。
        gu.hidden = NO;
        
        NSLog(@"gu"); //手ぐーが出てきた時
        
        
        
        [UIView animateWithDuration:0.5f delay:0 options:UIViewAnimationOptionCurveEaseInOut
                         animations:^{
                             gu.center = CGPointMake(160, 400);

        }completion:^(BOOL finished) {
            red.hidden =YES;
            [UIView animateWithDuration:0.4f delay:0.2 options:UIViewAnimationOptionCurveEaseInOut
                             animations:^{
                gu.center = CGPointMake(160, 50);
            }completion:^(BOOL finished) {
            }];
        }];
        
        
    }else if(timeCount%4==1){
        
//        red.hidden =YES;
        gu.hidden = YES;
        NSLog(@"par");//手パーが出てきたとき
        
    }else if(timeCount%2 == 0){
        
        par.hidden = NO;// 見えるようになる。
      
        
     
        
        
        
        [UIView animateWithDuration:0.5f delay:0 options:UIViewAnimationOptionCurveEaseInOut
                         animations:^{
                             par.center = CGPointMake(160, 400);
//                             par.frame = CGRectMake(80, 300, 102, 183);

                         }completion:^(BOOL finished) {
                             [UIView animateWithDuration:0.4f delay:0.2 options:UIViewAnimationOptionCurveEaseInOut
                                              animations:^{
                                                  par.center = CGPointMake(160, 50);
                                              }completion:^(BOOL finished) {
                                              }];
                         }];
        
        
     
        
        
        gu.hidden = YES;
        red.hidden = NO;
       
    }else{
        par.hidden=YES;
        

        gu.hidden=YES;
        
    
        red.hidden = NO;
        
        
        
    }
    
    if (timeCount%2 == 0) {
        doubleTap = 0;
    }
   
    
    
}


-(IBAction)start{
    
    startButton.hidden=YES;
    
    timer = [NSTimer scheduledTimerWithTimeInterval:1
                                             target:self
                                           selector:@selector(time:)
                                           userInfo:nil
                                            repeats:YES];


}


- (void)view_Tapped:(UITapGestureRecognizer *)sender{
    
    NSLog(@"タップされました．");
       
 
 
    //
    if (timeCount%2 == 1) {
       doubleTap += 1;
       number=number+1;
       
        //
        tapLabel.text =[NSString  stringWithFormat:@"%d",number];
        NSLog(@"******%d",doubleTap);
        
        if (doubleTap == 2) {
            GameoverViewController *gameover= [self.storyboard instantiateViewControllerWithIdentifier:@"gameover"];
            [self presentModalViewController:gameover animated:YES ];
        }
        //FIX: なんだったっけ...
//        if (timeCount%4 == 0) {
//            if (guCount == 1) {
//                NSLog(@"****ok");
//            } else {
//                GameoverViewController *gameover= [self.storyboard instantiateViewControllerWithIdentifier:@"gameover"];
//                [self presentModalViewController:gameover animated:YES ];
//            }
//        }
        
        
     }else{
        
        
        GameoverViewController *gameover= [self.storyboard instantiateViewControllerWithIdentifier:@"gameover"];
        [self presentModalViewController:gameover animated:YES ];
        
        
    }


 
      //10回でクリア
      if (number== 10) {

          GameclearViewController*gameclear= [self.storyboard instantiateViewControllerWithIdentifier:@"gameclear"];
          [self presentModalViewController:gameclear animated:YES ];
    
      }
    
    
    
}



-(IBAction)gubutton{

    
}

//長押し関連処理
-(void)longPressedHandler:(UILongPressGestureRecognizer *)gestureRecognizer
{
    NSLog(@"%s",__func__);
    switch (gestureRecognizer.state) {
        case UIGestureRecognizerStateBegan://長押しを検知開始
        {
            NSLog(@"UIGestureRecognizerStateBegan");
            guCount = 1;
        }
        break;
        case UIGestureRecognizerStateEnded://長押し終了時
        {
            NSLog(@"UIGestureRecognizerStateEnded");
            guCount = 0;
        }
        break;
        default:
            break;
    }
}











- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
