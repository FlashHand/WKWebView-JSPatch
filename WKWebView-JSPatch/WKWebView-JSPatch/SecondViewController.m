//
//  SecondViewController.m
//  WKWebView-JSPatch
//
//  Created by BoWang on 16/4/12.
//  Copyright © 2016年 BoWang. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UILabel *titleLabel=[[UILabel alloc]initWithFrame:CGRectMake(50, 50, 100, 50)];
    titleLabel.text=@"原生页面";
    titleLabel.textColor=[UIColor whiteColor];
    [self.view addSubview:titleLabel];
    
    [self.view setBackgroundColor:[UIColor lightGrayColor]];
    UIButton *backButton=[[UIButton alloc]initWithFrame:CGRectMake(0, 100, 100, 50)];
    [backButton setBackgroundColor:[UIColor whiteColor]];
    [backButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [backButton setTitle:@"back" forState:UIControlStateNormal];
    [backButton addTarget:self action:@selector(backAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:backButton];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)backAction:(UIButton *)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
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
