//
//  ViewController.h
//  ozasikigame
//
//  Created by nanami on 2014/11/29.
//  Copyright (c) 2014年 nanami. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
{
    
    IBOutlet UIImageView *par;
    IBOutlet UIImageView *gu;
    IBOutlet UIImageView *red;
    IBOutlet UIButton *startButton;
    IBOutlet  UIView * tapView;
    
    
    int number;
}



-(IBAction)start;
-(IBAction)tap;


@end

