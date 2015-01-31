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
    
    int timeCount;//メインタイマー
    int doubleTap;//ダブルタップ
    int guCount;
    
    int tapCount;
    
    bool isTapped;
    
}



@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //タップViewの生成
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


    //初期値を設定
    timeCount = 1; //最初に手が出てくるようにするために１
    par.hidden=YES;
    gu.hidden=YES;
    red.hidden = NO;
    doubleTap = 0;
    number=0;
    
}


-(void)time:(NSTimer*)timer{
    timeCount += 1;
    countLabel.text = [NSString stringWithFormat:@"%d",timeCount-1];

    
    NSLog(@"time:%d", timeCount-1);

    //------------------
    //１回もTapしてなかった場合アウト
    if (3 <= timeCount && timeCount%2 == 0) {
        if (isTapped == NO) {
            [self presentGameoverVC];
        }
    }
    //4以上の偶数の場合、Tapを消す
    if (timeCount%2 == 0) {
        isTapped = NO;
    }
    //------------------
    
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
    //２秒ごとにダブルタップを初期化
    if (timeCount%2 == 0) {
        doubleTap = 0;
    }
    
    
    
//    //グーボタンを４秒の時初期化
//    if (timeCount == 4) {
//        guCount = 0;
//    }
    //時間が６秒になった時　グーボタンが1回押されてないといけない
//    if (timeCount  == 6 && guCount == 0 < guCount >2) {
//       
//        GameoverViewController *gameover= [self.storyboard instantiateViewControllerWithIdentifier:@"gameover"];
//        [self presentModalViewController:gameover animated:YES ];
//    }



}


-(IBAction)start{
    
    startButton.hidden=YES;
    
    timer = [NSTimer scheduledTimerWithTimeInterval:0.5
                                             target:self
                                           selector:@selector(time:)
                                           userInfo:nil
                                            repeats:YES];


}


-(IBAction)gubutton{
    
    
    guCount += 1;
    //    NSLog( @"グー押した%d", guCount)
    //
    
    //    if (timeCount == 5+4*guCount ) {
    //
    //
    //
    //          NSLog( @"グー押した%d", guCount);
    ////                       NSLog(@"****ok");
    //
    //
    //    }else {
    ////                   GameoverViewController *gameover= [self.storyboard instantiateViewControllerWithIdentifier:@"gameover"];
    ////                    [self presentModalViewController:gameover animated:YES ];
    ////        
    //    
    //    
    //    }
    
}




- (void)view_Tapped:(UITapGestureRecognizer *)sender{
    tapCount++;
    NSLog(@"タップされました．");
  
    isTapped=YES;
 
 
    //
    if (timeCount%2 == 1) {
        doubleTap += 1;
        NSLog(@"%d",doubleTap);
        
        number=number+1;
        tapLabel.text =[NSString  stringWithFormat:@"%d",number];
        
        
        //間違って２連続タップでアウト
        NSLog(@"%d",doubleTap);
        if (doubleTap == 2) {
            [self presentGameoverVC];
        }
   

        
//        if (timeCount%4 == 0) {

        //            guCount += 1;
//            if (guCount == 1) {
//                NSLog(@"****ok");
//            } else {
//                GameoverViewController *gameover= [self.storyboard instantiateViewControllerWithIdentifier:@"gameover"];
//                [self presentModalViewController:gameover animated:YES ];
//            }
//        }
//        
     }else{
        
        
         [self presentGameoverVC];
        
        
    }


 
      //10回でクリア
      if (number== 10) {

          GameclearViewController*gameclear= [self.storyboard instantiateViewControllerWithIdentifier:@"gameclear"];
          [self presentModalViewController:gameclear animated:YES ];
    
      }

    
    
}





//長押し関連処理
//-(void)longPressedHandler:(UILongPressGestureRecognizer *)gestureRecognizer
//{
//    NSLog(@"%s",__func__);
//    switch (gestureRecognizer.state) {
//        case UIGestureRecognizerStateBegan://長押しを検知開始
//        {
//            NSLog(@"UIGestureRecognizerStateBegan");
//            guCount = 1;
//        }
//        break;
//        case UIGestureRecognizerStateEnded://長押し終了時
//        {
//            NSLog(@"UIGestureRecognizerStateEnded");
//            guCount = 0;
//        }
//        break;
//        default:
//            break;
//    }
//}









- (void)presentGameoverVC {
    GameoverViewController *gameover= [self.storyboard instantiateViewControllerWithIdentifier:@"gameover"];
    [self presentModalViewController:gameover animated:YES ];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
