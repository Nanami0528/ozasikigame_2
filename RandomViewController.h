//
//  RandomViewController.h
//  ozasikigame
//
//  Created by nanami on 2015/02/28.
//  Copyright (c) 2015年 nanami. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RandomViewController : UIViewController
{

    //相手の手
    IBOutlet UIImageView *par;
    IBOutlet UIImageView *gu;
    IBOutlet UIImageView *red;

    
    IBOutlet UIButton *startButton;
    IBOutlet UILabel  *timecount;
    
    
    NSTimer *timer;
    int timeCount;
    
    
    
    
}




@property float level;

-(IBAction)start;
@end
