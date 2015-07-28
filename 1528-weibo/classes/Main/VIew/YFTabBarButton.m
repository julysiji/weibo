//
//  YFTabBarButton.m
//  1528-weibo
//
//  Created by 杨元锋 on 15/7/5.
//  Copyright (c) 2015年 netcore. All rights reserved.
//
#define YFTabBarButtonImageRation 0.6

// 按钮的默认文字颜色
#define  IWTabBarButtonTitleColor (iOS7 ? [UIColor blackColor] : [UIColor whiteColor])
// 按钮的选中文字颜色
#define  IWTabBarButtonTitleSelectedColor (iOS7 ? IWColor(234, 103, 7) : IWColor(248, 139, 0))


#import "YFTabBarButton.h"
#import "YFBadgeButton.h"
@interface YFTabBarButton()
//提醒数字
@property (nonatomic,weak) YFBadgeButton *badgeButton;

@end

@implementation YFTabBarButton

-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self)
    {
        self.imageView.contentMode = UIViewContentModeCenter;
        
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        
        self.titleLabel.font = [UIFont systemFontOfSize:11];
        
        [self setTitleColor:IWTabBarButtonTitleSelectedColor forState:UIControlStateSelected];
        
        [self setTitleColor:IWTabBarButtonTitleColor forState:UIControlStateNormal];
        
        if (!iOS7)
        {
            [self setBackgroundImage:[UIImage imageWithName:@"tabbar_slider"] forState:UIControlStateSelected];
        }
        
        YFBadgeButton *badgeButton = [[YFBadgeButton alloc]init];
        
        badgeButton.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin|UIViewAutoresizingFlexibleBottomMargin;
        
        [self addSubview:badgeButton];
        
        self.badgeButton = badgeButton;
    }
    return self;
}

-(CGRect)imageRectForContentRect:(CGRect)contentRect
{
    CGFloat imageW = contentRect.size.width;
    CGFloat imageH = contentRect.size.height*YFTabBarButtonImageRation;
    return CGRectMake(0, 0, imageW, imageH);
}
-(CGRect)titleRectForContentRect:(CGRect)contentRect
{
    CGFloat titleY = contentRect.size.height*YFTabBarButtonImageRation;
    CGFloat titleW = contentRect.size.width;
    CGFloat titleH = contentRect.size.height*(1-YFTabBarButtonImageRation);
    
    return CGRectMake(0, titleY, titleW, titleH);
}

-(void)setItem:(UITabBarItem *)item
{
    _item = item;

    [item addObserver:self forKeyPath:@"badgeValue" options:0 context:nil];
    [item addObserver:self forKeyPath:@"title" options:0 context:nil];
    [item addObserver:self forKeyPath:@"selectedImage" options:0 context:nil];
    [item addObserver:self forKeyPath:@"image" options:0 context:nil];
    
    [self observeValueForKeyPath:nil ofObject:nil change:nil context:nil];
}

-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    
    [self setTitle:self.item.title forState:UIControlStateNormal];
    [self setTitle:self.item.title forState:UIControlStateSelected];
    [self setImage:self.item.image forState:UIControlStateNormal];
    [self setImage:self.item.selectedImage forState:UIControlStateSelected];
    
    // 设置提醒数字
    self.badgeButton.badgeValue = self.item.badgeValue;
    
    // 设置提醒数字的位置
    CGFloat badgeY = 0;
    
    CGFloat badgeX = self.frame.size.width - self.badgeButton.frame.size.width - 10;
    
    CGRect badgeF = self.badgeButton.frame;
    
    badgeF.origin.x = badgeX;
    
    badgeF.origin.y = badgeY;
    
    self.badgeButton.frame = badgeF;

}


-(void)dealloc
{
    [self.item removeObserver:self forKeyPath:@"badgeValue"];
    [self.item removeObserver:self forKeyPath:@"title"];
    [self.item removeObserver:self forKeyPath:@"selectedImage"];
    [self.item removeObserver:self forKeyPath:@"image"];
}

-(void)setHighlighted:(BOOL)highlighted{}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
