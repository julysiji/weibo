//
//  UIBarButtonItem+YF.m
//  1528-weibo
//
//  Created by 杨元锋 on 15/7/12.
//  Copyright (c) 2015年 netcore. All rights reserved.
//

#import "UIBarButtonItem+YF.h"

@implementation UIBarButtonItem (YF)

+ (UIBarButtonItem*)itemWithIcon:(NSString*)icon highIcon:(NSString*)highIcon target:(id)target action:(SEL)action
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [button setBackgroundImage:[UIImage imageWithName:icon] forState:UIControlStateNormal];
    [button setBackgroundImage:[UIImage imageWithName:highIcon] forState:UIControlStateHighlighted];
    button.frame = (CGRect){CGPointZero,button.currentBackgroundImage.size};
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    return [[UIBarButtonItem alloc]initWithCustomView:button];
}

@end
