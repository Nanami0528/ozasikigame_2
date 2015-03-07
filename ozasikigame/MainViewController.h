//
//  ViewController.h
//  ozasikigame
//
//  Created by nanami on 2014/11/29.
//  Copyright (c) 2014年 nanami. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainViewController : UIViewController
{
    //相手の手
    IBOutlet UIImageView *par;
    IBOutlet UIImageView *gu;
    IBOutlet UIImageView *red;
    
    //自分の手
    IBOutlet UIImageView*mypar;
    
    //ボタン
    IBOutlet UIButton *startButton;
    IBOutlet UIButton *tapButton;
    
    //ラベル
    IBOutlet UILabel * countLabel;
    IBOutlet UILabel * tapLabel;

    IBOutlet UIView *tapView;
    
    int number;
    
    NSTimer *timer;
    int timeCount;//メインタイマー
    int doubleTap;//ダブルタップ
    int guCount;
    
    int tapCount;
    
    BOOL isTapped;
    BOOL isMultiTapped;
    
}

@property float level;

-(IBAction)start;

@end

