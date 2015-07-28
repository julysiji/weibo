//
//  YFTabbarViewCtl.m
//  1528-weibo
//
//  Created by 杨元锋 on 15/7/4.
//  Copyright (c) 2015年 netcore. All rights reserved.
//

#import "YFTabbarViewCtl.h"
#import "YFHomeVC.h"    
#import "YFMessageVC.h"
#import "YFDiscoverVC.h"
#import "YFMeVC.h"
#import "YFTabbar.h"


#import "YFNavigationCtl.h"

@interface YFTabbarViewCtl ()<YFTabbarDelegate>

@property (nonatomic ,weak)YFTabbar*customTabbar;

@end

@implementation YFTabbarViewCtl

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setupTabbar];
    
    [self setupChildViewControllers];
}

-(void)setupTabbar
{
    YFTabbar *customTabbar = [[YFTabbar alloc]init];
    customTabbar.frame = self.tabBar.bounds;
    customTabbar.delegate = self;
    [self.tabBar addSubview:customTabbar];
    self.customTabbar = customTabbar;
}


-(void)tabBar:(YFTabbar *)tabbar didSelectedButtonFrom:(int)from to:(int)to
{
    DLog(@"%dfrom  %d  ",from,to);
    
    self.selectedIndex = to;
}

// 不删除的话 会有系统的tabbar覆盖在上面 点不到 变成只默认选中第一个
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    
    for (UIView*child in self.tabBar.subviews)
    {
        if ([child isKindOfClass:[UIControl class]])
        {
            [child removeFromSuperview];
        }
    }
}

-(void)setupChildViewControllers
{
    YFHomeVC *home = [[YFHomeVC alloc]init];
    
    home.tabBarItem.badgeValue = @"99+";
    
    [self setupChildViewController:home title:@"首页" imageName:@"tabbar_home" selectImageName:@"tabbar_home_selected"];
    
    YFMessageVC *message = [[YFMessageVC alloc]init];
    
    message.tabBarItem.badgeValue = @"55";
    
    [self setupChildViewController:message title:@"消息" imageName:@"tabbar_message_center" selectImageName:@"tabbar_message_center_selected"];
    
    YFDiscoverVC *discover = [[YFDiscoverVC alloc]init];
    discover.tabBarItem.badgeValue = @"1";
    [self setupChildViewController:discover title:@"广场" imageName:@"tabbar_discover" selectImageName:@"tabbar_discover_selected"];
    
    YFMeVC *me = [[YFMeVC alloc]init];
    me.tabBarItem.badgeValue = @"5";
    [self setupChildViewController:me title:@"我" imageName:@"tabbar_profile" selectImageName:@"tabbar_profile_selected"];
    
}

-(void)setupChildViewController:(UIViewController*)childVC title:(NSString*)title imageName:(NSString*)imagename selectImageName:(NSString*)selectedImageName
{
    if(iOS7)
    {
        childVC.tabBarItem.selectedImage = [[UIImage imageWithName:selectedImageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    }
    else
    {
        childVC.tabBarItem.selectedImage = [UIImage imageWithName:selectedImageName];
    }
 
    childVC.title = title;
    
    childVC.tabBarItem.image = [UIImage imageWithName:imagename];
    
    YFNavigationCtl *nav = [[YFNavigationCtl alloc]initWithRootViewController:childVC];
    
    [self addChildViewController:nav];
    
    [self.customTabbar addTbabbarButtonWithItem:childVC.tabBarItem];
}










































@end
