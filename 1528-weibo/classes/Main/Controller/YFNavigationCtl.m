//
//  YFNavigationCtl.m
//  1528-weibo
//
//  Created by 杨元锋 on 15/7/11.
//  Copyright (c) 2015年 netcore. All rights reserved.
//

#import "YFNavigationCtl.h"

@interface YFNavigationCtl ()

@end

@implementation YFNavigationCtl

//- (void)viewDidLoad {
//    [super viewDidLoad];
//    // Do any additional setup after loading the view.
//}

+ (void)initialize
{
//    设置标题属性
    [self setupNavBarTheme];
    
//    设置导航栏按钮主题
    [self setupBarButtonItemTheme];
    
}

+(void)setupBarButtonItemTheme
{
    UIBarButtonItem *item = [UIBarButtonItem appearance];
    
    if (!iOS7)
    {
        [item setBackgroundImage:[UIImage imageWithName:@"navigationbar_button_background"] forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
        [item setBackgroundImage:[UIImage imageWithName:@"navigationbar_button_background_pushed"] forState:UIControlStateHighlighted barMetrics:UIBarMetricsDefault];
        [item setBackgroundImage:[UIImage imageWithName:@"navigationbar_button_background_disable"] forState:UIControlStateHighlighted barMetrics:UIBarMetricsDefault];
    }
    


    NSMutableDictionary *textAttrs = [NSMutableDictionary dictionary];
    
    textAttrs[UITextAttributeTextColor] = iOS7 ? [UIColor orangeColor] : [UIColor grayColor];
    textAttrs[UITextAttributeTextShadowOffset] =[NSValue valueWithUIOffset:UIOffsetMake(0, 0)];
    textAttrs[UITextAttributeFont] = [UIFont systemFontOfSize:iOS7 ? 14 : 12];
    
    [item setTitleTextAttributes:textAttrs forState:UIControlStateNormal];
    [item setTitleTextAttributes:textAttrs forState:UIControlStateHighlighted];
    
}

+ (void)setupNavBarTheme
{
    UINavigationBar *navBar = [UINavigationBar appearance];
    
    if (!iOS7)
    {
        [navBar setBackgroundImage:[UIImage imageWithName:@"navigationbar_background"] forBarMetrics:UIBarMetricsDefault];
        
        [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleBlackOpaque;
    }
    

    NSMutableDictionary *textAttrs = [NSMutableDictionary dictionary];
    
    textAttrs[UITextAttributeTextColor] = [UIColor blackColor];
    
    textAttrs[UITextAttributeTextShadowOffset] =[NSValue valueWithUIOffset:UIOffsetMake(0, 0)];
    
    textAttrs[UITextAttributeFont] = [UIFont boldSystemFontOfSize:19];
    
    [navBar setTitleTextAttributes:textAttrs];
}



-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if (self.viewControllers.count>0)
    {
        viewController.hidesBottomBarWhenPushed = YES;
    }

    [super pushViewController:viewController animated:animated];
}

@end
