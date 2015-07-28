//
//  YFTabbar.h
//  1528-weibo
//
//  Created by 杨元锋 on 15/7/5.
//  Copyright (c) 2015年 netcore. All rights reserved.
//

#import <UIKit/UIKit.h>

@class YFTabbar;

@protocol YFTabbarDelegate<NSObject>

@optional

-(void)tabBar:(YFTabbar*)tabbar didSelectedButtonFrom:(int)from to:(int)to;

@end

@interface YFTabbar : UIView

@property(nonatomic,weak)id<YFTabbarDelegate>delegate;

-(void)addTbabbarButtonWithItem:(UITabBarItem*)item;

@end
