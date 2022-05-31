//
//  ViewController.m
//  WKWebView-JSPatch
//
//  Created by BoWang on 16/4/12.
//  Copyright © 2016年 BoWang. All rights reserved.
//

#import "ViewController.h"
#import "JPEngine.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];
    _rwWebView=[[WKWebView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    [_rwWebView.configuration.userContentController addScriptMessageHandler:self name:@"LoadScript"];
    [_rwWebView.configuration.userContentController addScriptMessageHandler:self name:@"DoFunction"];
    _rwWebView.backgroundColor = [UIColor clearColor];
    _rwWebView.scrollView.backgroundColor = [UIColor clearColor];
    _rwWebView.autoresizingMask = UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
    _rwWebView.scrollView.showsVerticalScrollIndicator=NO;
    _rwWebView.scrollView.showsHorizontalScrollIndicator=NO;
    _rwWebView.navigationDelegate = self;
    _rwWebView.allowsBackForwardNavigationGestures=YES;
    [self.view addSubview:_rwWebView];
    NSURL *url=[[NSBundle mainBundle]URLForResource:@"index" withExtension:@"html"];
    NSMutableURLRequest *tmpRequest=[[NSMutableURLRequest alloc] initWithURL:url];
    tmpRequest.timeoutInterval=60;
    [_rwWebView loadRequest:tmpRequest];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - MessageHandler
- (void)userContentController:(WKUserContentController *)userContentController
      didReceiveScriptMessage:(WKScriptMessage *)message{
    if ([message.name isEqualToString:@"LoadScript"]) {
        NSString *script=message.body;
        [JPEngine evaluateScript:script];
        NSLog(@"Script loaded");
    }
    else if ([message.name isEqualToString:@"DoFunction"])
    {
        NSDictionary *messageDic=message.body;
        NSString *function=messageDic[@"function"];
        NSDictionary *parameters=messageDic[@"parameters"];
        if ([self respondsToSelector:NSSelectorFromString(function)]) {
            [self performSelectorOnMainThread:NSSelectorFromString(function) withObject:parameters waitUntilDone:YES];
            NSLog(@"Script excuted");

        }
        else NSLog(@"Please load script first");
    }
    
}
@end
