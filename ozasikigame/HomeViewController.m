//
//  HomeViewController.m
//  ozasikigame
//
//  Created by nanami on 2015/01/31.
//  Copyright (c) 2015年 nanami. All rights reserved.
//

#import "HomeViewController.h"
#import "MainViewController.h"
#import "RandomViewController.h"



@interface HomeViewController ()

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    
    
    
}

-(IBAction)lavel1{
    
    MainViewController *mainVC =  [self.storyboard instantiateViewControllerWithIdentifier:@"MainViewController"];
    mainVC.level = 1;
    
    //mainVC.secondNum = self.firstNum;
    [self presentViewController:mainVC animated:YES completion:nil];//YESならModal,Noなら何もなし
    
};
-(IBAction)lavel2{
    
    MainViewController *mainVC =  [self.storyboard instantiateViewControllerWithIdentifier:@"MainViewController"];
    mainVC.level = 0.7;
    
    //mainVC.secondNum = self.firstNum;
    [self presentViewController:mainVC animated:YES completion:nil];//YESならModal,Noなら何もなし
    
};
-(IBAction)lavel3{
    
    MainViewController *mainVC =  [self.storyboard instantiateViewControllerWithIdentifier:@"MainViewController"];
    mainVC.level = 0.65;
    
    //mainVC.secondNum = self.firstNum;
    [self presentViewController:mainVC animated:YES completion:nil];//YESならModal,Noなら何もなし
    
};

-(IBAction)random{
    
     RandomViewController*randomVC =  [self.storyboard instantiateViewControllerWithIdentifier:@"RandomViewController"];
   
    //mainVC.secondNum = self.firstNum;
    [self presentViewController:randomVC animated:YES completion:nil];//YESならModal,Noなら何もなし
    
};






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
