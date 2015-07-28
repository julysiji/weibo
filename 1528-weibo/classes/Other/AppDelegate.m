//
//  AppDelegate.m
//  1528-weibo
//
//  Created by 杨元锋 on 15/7/2.
//  Copyright (c) 2015年 netcore. All rights reserved.
//

#import "AppDelegate.h"
#import "YFTabbarViewCtl.h"
#import "YFNewfeatureVC.h"

#import "YFOAuthVC.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    application.statusBarHidden = NO;
    self.window = [[UIWindow alloc]initWithFrame:[[UIScreen mainScreen] bounds]];
    
    self.window.rootViewController = [[YFOAuthVC alloc]init];
    
//    NSString *key = @"CFBundleVersion";
//    
////    取出沙盒中存储的上次使用的软件版本号
//    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
//    NSString *lastVersionyyf = [defaults stringForKey:key];
//    
////    获取当前软件版本号
//    NSString *currentVersion = [NSBundle mainBundle].infoDictionary[key];
//
//    if ([currentVersion isEqualToString:lastVersionyyf])
//    {
//        self.window.rootViewController = [[YFTabbarViewCtl alloc]init];
//    }
//    else
//    {
//        self.window.rootViewController = [[YFNewfeatureVC alloc]init];
//        [defaults setObject:currentVersion forKey:key];
//        [defaults synchronize];
//    }
    
    [self.window makeKeyAndVisible];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
