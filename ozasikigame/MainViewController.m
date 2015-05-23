//
//  ViewController.m
//  ozasikigame
//
//  Created by nanami on 2014/11/29.
//  Copyright (c) 2014年 nanami. All rights reserved.
//

#import "MainViewController.h"
#import "GameoverViewController.h"
#import "GameclearViewController.h"

@interface MainViewController ()
@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"level:%f",self.level);
    //タップViewの生成
    tapView.backgroundColor = [UIColor clearColor];
    //タップ認識
    UITapGestureRecognizer *tapGesture =
    [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(view_Tapped:)];
    // ビューにジェスチャーを追加（タップしたか確認のビュー）
    [tapView addGestureRecognizer:tapGesture];
    
    //初期値を設定
    timeCount = 1; //最初に手が出てくるようにするために１
    par.hidden=YES;
    gu.hidden=YES;
    red.hidden = NO;
    doubleTap = 0;
    number=0;
    
    //最初に設定しておく、タップされていないのでNOにする
    isTapped = NO;
    isMultiTapped = NO;
    multiTapButton.backgroundColor = [UIColor clearColor];
    multiTapButton.hidden = YES;
    mypar.hidden = YES;
}

-(void)time:(NSTimer*)timer{

    mypar.hidden=YES;
    //TODO: mygu.hidden = YES;
    timeCount += 1;
    countLabel.text = [NSString stringWithFormat:@"%d",timeCount-1];
    NSLog(@"time:%d", timeCount-1);
    //-----タッチされてなかったの実装---
    if (3 <= timeCount && timeCount%2 == 0) {
        if (isTapped == NO) {
            NSLog(@"たっちされなかったのでアウト");
            //NSAssert(isTappedOdd==YES, @"no tap");
            [self presentGameoverVC];
        }
    }
    //4以上の偶数の場合、Tapを消す
    if (timeCount%2 == 0) {
        isTapped = NO;
    }
    //------------------------------
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
    //-------------------------
    //tapButtonの処理
    //TODO: ここを5の倍数の時ではなく、
    if (timeCount %4 == 1) {
        multiTapButton.hidden = NO;
        if (isMultiTapped == YES) {
            NSLog(@"５の倍数秒の時以外に押したらアウト");
            [self presentGameoverVC];
        }
    } else {
        multiTapButton.hidden = YES;
        //FIX: 要確認
        isTapped = YES;
    }
    //-------------------------
    //２秒ごとにダブルタップを初期化
    //FIX: ２秒毎に初期化するならBool型でいいのでは？
    if (timeCount%2 == 0) {
        doubleTap = 0;
    }
    //-------------------------
    if (3 < timeCount && timeCount%2 == 1 && number + 1 != timeCount/2) {
        NSLog(@"一定の点数を取ってないのでアウト,number:%d,time:%d",number,timeCount);
        [self presentGameoverVC];
    }
}


-(IBAction)start{
    startButton.hidden=YES;
    timer = [NSTimer scheduledTimerWithTimeInterval:self.level
                                             target:self
                                           selector:@selector(time:)
                                           userInfo:nil
                                            repeats:YES];
}

//xibでmultipletouchesのチェック入れるのを注意する
//同時押しを実装
-(IBAction)tapButton:(UIButton*)sendButton andEvent:(UIEvent*) event {
    
    [self presentGameclearVC];
    NSSet *touches = [event touchesForView:sendButton];
    int fingerCount = (int)[touches count];
    if (timeCount % 4 == 1) {
        if (fingerCount == 2) {
            NSLog(@"OK!!!");
            mypar.hidden = NO;//TODO: guの画像を用意しよう
            number++;
            tapLabel.text =[NSString  stringWithFormat:@"%d",number];
            isMultiTapped = YES;
        } else {
            [self presentGameoverVC];
            NSLog(@"2タップじゃないと駄目！");
        }
        isMultiTapped = NO;
        
    } else {
        isMultiTapped = NO;
        //それ以外でTwoタップ
    }
}



- (void)view_Tapped:(UITapGestureRecognizer *)sender{
    NSLog(@"%@",sender);
 
    isTapped = YES;
    mypar.hidden = NO;
    if (timeCount%2 == 1) {
        
        number=number+1;
        tapLabel.text =[NSString  stringWithFormat:@"%d",number];
        
        
        doubleTap += 1;
        NSLog(@"%d",doubleTap);
        if (doubleTap == 2) {
            NSLog(@"間違って２連続タップでアウト");
            [self presentGameoverVC];
        }
    } else {
        NSLog(@"奇数の時以外に、タップしてもアウト");
        [self presentGameoverVC];
    }
    [self presentGameclearVC];
}
- (void)presentGameclearVC{
    //10回でクリア
    if (number >= 10) {
        [timer invalidate];
        GameclearViewController *gameclear= [self.storyboard instantiateViewControllerWithIdentifier:@"gameclear"];
        [self presentViewController:gameclear animated:YES completion:nil];
    }
}
- (void)presentGameoverVC{
    [timer invalidate];
    GameoverViewController *gameover= [self.storyboard instantiateViewControllerWithIdentifier:@"gameover"];
    [self presentViewController:gameover animated:YES completion:nil];
}

@end
