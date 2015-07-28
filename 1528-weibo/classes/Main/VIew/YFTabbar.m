//
//  YFTabbar.m
//  1528-weibo
//
//  Created by 杨元锋 on 15/7/5.
//  Copyright (c) 2015年 netcore. All rights reserved.
//

#import "YFTabbar.h"
#import "YFTabBarButton.h"
@interface YFTabbar()

@property (nonatomic,strong) NSMutableArray *tabBarButtons;

@property (nonatomic,weak)UIButton *plusButton;

@property (nonatomic,weak)YFTabBarButton *selectButton;
@end
@implementation YFTabbar

- (NSMutableArray *)tabBarButtons
{
    if (_tabBarButtons==nil)
    {
        _tabBarButtons = [NSMutableArray array];
    }
    return _tabBarButtons;
}

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        if (!iOS7)
        {
            self.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageWithName:@"tabbar_background"]];
        }
        
        UIButton *plusButton = [UIButton buttonWithType:UIButtonTypeCustom];
        
        [plusButton setBackgroundImage:[UIImage imageWithName:@"tabbar_compose_button"] forState:UIControlStateNormal];
        
        [plusButton setBackgroundImage:[UIImage imageWithName:@"tabbar_compose_button_highlighted"] forState:UIControlStateHighlighted];
        
        [plusButton setImage:[UIImage imageWithName:@"tabbar_compose_icon_add"] forState:UIControlStateNormal];
        
        [plusButton setImage:[UIImage imageWithName:@"tabbar_compose_icon_add_highlighted"] forState:UIControlStateHighlighted];
        
        plusButton.bounds = CGRectMake(0, 0, plusButton.currentBackgroundImage.size.width, plusButton.currentBackgroundImage.size.height);
        
        [self addSubview:plusButton];
        
        self.plusButton = plusButton;
    }
    
    return self;
}

-(void)addTbabbarButtonWithItem:(UITabBarItem*)item
{
    YFTabBarButton *button = [[YFTabBarButton alloc]init];
    [self addSubview:button];
    
    [self.tabBarButtons addObject:button];
    
    button.item = item;
    
    [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchDown];
    
    if (self.tabBarButtons.count==1)
    {
        [self buttonClick:button];
    }
}


-(void)buttonClick:(YFTabBarButton*)button
{
//    通知代理
    if ([self.delegate  respondsToSelector:@selector(tabBar:didSelectedButtonFrom:to:)])
    {
        [self.delegate tabBar:self didSelectedButtonFrom:(int)self.selectButton.tag to:(int)button.tag];
    }
//    设置按钮的状态
    self.selectButton.selected = NO;
    button.selected = YES;
    self.selectButton = button;
}


-(void)layoutSubviews
{
    [super layoutSubviews];
    
    CGFloat h = self.frame.size.height;
    CGFloat w = self.frame.size.width;
    
    self.plusButton.center = CGPointMake(w*0.5, h*0.5);
    
    CGFloat buttonW = w/self.subviews.count;
    CGFloat buttonH = h;
    
    for (int index = 0; index<self.tabBarButtons.count; index++)
    {
        YFTabBarButton*button = self.tabBarButtons[index];

        CGFloat buttonX = index * buttonW;
        
        if (index>1)
        {
            buttonX += buttonW;
        }
        
        button.frame = CGRectMake(buttonX,  0, buttonW, buttonH);
        
        button.tag = index;
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
