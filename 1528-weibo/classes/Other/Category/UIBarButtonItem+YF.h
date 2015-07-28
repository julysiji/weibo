//
//  UIBarButtonItem+YF.h
//  1528-weibo
//
//  Created by 杨元锋 on 15/7/12.
//  Copyright (c) 2015年 netcore. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (YF)

+ (UIBarButtonItem*)itemWithIcon:(NSString*)icon highIcon:(NSString*)highIcon target:(id)target action:(SEL)action;

@end
