//
//  YFOAuthVC.m
//  1528-weibo
//
//  Created by 杨元锋 on 15/7/25.
//  Copyright (c) 2015年 netcore. All rights reserved.
//

#import "YFOAuthVC.h"
//@interface YFOAuthVC()<UIWebViewDelegate>
//
//@end

@implementation YFOAuthVC


-(void)viewDidLoad
{
    UIWebView *webView = [[UIWebView alloc]init];
    webView.frame = self.view.bounds;
    [self.view addSubview:webView];
    
//    webView.delegate = self;
    
    NSURL *url = [NSURL URLWithString:@"https://api.weibo.com/oauth2/authorize?client_id=4288431743&redirect_uri=http://www.jianshu.com/p/190999adb020"];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    [webView loadRequest:request];
}


#pragma mark - webview delegate

//-(BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
//{
//    NSString *urlStr = request.URL.absoluteString;
//
//    
//    DLog(@"%@--",urlStr);
//    
//    NSRange range = [urlStr rangeOfString:@"code="];
//    if (range.location != NSNotFound)
//    {
//        DLog(@"%@--",urlStr);
//    }
//    
//    
//    return YES;
//}




@end
