//
//  ViewController.h
//  WKWebView-JSPatch
//
//  Created by BoWang on 16/4/12.
//  Copyright © 2016年 BoWang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <WebKit/WebKit.h>
@interface ViewController : UIViewController<WKNavigationDelegate,WKUIDelegate,WKScriptMessageHandler>
@property (nonatomic,strong)WKWebView *rwWebView;

@end

