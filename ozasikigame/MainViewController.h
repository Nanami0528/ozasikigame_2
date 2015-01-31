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
    
    IBOutlet UIImageView *par;
    IBOutlet UIImageView *gu;
    IBOutlet UIImageView *red;
    
    //ボタン
    IBOutlet UIButton *startButton;
    IBOutlet UIButton *tapButton;
    IBOutlet UIButton *guButton;
    
    //ラベル
    IBOutlet UILabel * countLabel;
    IBOutlet UILabel * tapLabel;

    
    int number;
    
}

@property float level;

-(IBAction)start;
-(IBAction)tap;
-(IBAction)gubutton;

@end

