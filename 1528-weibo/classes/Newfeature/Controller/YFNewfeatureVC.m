//
//  YFNewfeatureVC.m
//  1528-weibo
//
//  Created by 杨元锋 on 15/7/21.
//  Copyright (c) 2015年 netcore. All rights reserved.
//

#import "YFNewfeatureVC.h"
#import "YFTabbarViewCtl.h"
#define Pagenumber 3

@interface YFNewfeatureVC()
@property (nonatomic,weak) UIPageControl *pageControl;
@end

@implementation YFNewfeatureVC
-(void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setupScrollView];
    
    [self setupPageControl];
}


-(void)setupPageControl
{
    UIPageControl *pageControl = [[UIPageControl alloc]init];
    pageControl.numberOfPages = Pagenumber;
    CGFloat centerX = self.view.frame.size.width*0.5;
    CGFloat centerY = self.view.frame.size.height -30;
    pageControl.center = CGPointMake(centerX, centerY);
    pageControl.bounds = CGRectMake(0, 0, 100, 30);
    [self.view addSubview:pageControl];
    self.pageControl = pageControl;
    pageControl.currentPageIndicatorTintColor = IWColor(253, 98, 42);
    pageControl.pageIndicatorTintColor = IWColor(189, 189, 189);
    pageControl.userInteractionEnabled = NO;
}


-(void)setupScrollView
{
    UIScrollView *scrollView = [[UIScrollView alloc]initWithFrame:self.view.bounds];
    scrollView.delegate = self;
    [self.view addSubview:scrollView];
    
    CGFloat imageW = scrollView.frame.size.width;
    CGFloat imageH = scrollView.frame.size.height;
    
    for (int i= 0; i< Pagenumber; i++)
    {
        UIImageView *imgView = [[UIImageView alloc]init];
        imgView.userInteractionEnabled = YES;
        NSString*name = [NSString stringWithFormat:@"new_feature_%d",i+1];
        imgView.image = [UIImage imageWithName:name];
        
        CGFloat imageX = i*imageW;
        imgView.frame = CGRectMake(imageX, 0, imageW, imageH);
        
        [scrollView addSubview:imgView];
        
        if (i == Pagenumber-1)
        {
            [self setupLastImageView:imgView];
        }
    }
    
    scrollView.contentSize = CGSizeMake(imageW*3, 0);//设置滚动尺寸
    
    scrollView.showsHorizontalScrollIndicator = NO;//显示水平条
    
    scrollView.pagingEnabled = YES;//分页
    
    self.view.backgroundColor = [UIColor whiteColor];
}


-(void)setupLastImageView:(UIImageView*)imageView
{
    UIButton* startButton = [[UIButton alloc]init];
    [startButton setBackgroundImage:[UIImage imageWithName:@"new_feature_finish_button"] forState:UIControlStateNormal];
    [startButton setBackgroundImage:[UIImage imageWithName:@"new_feature_finish_button_highlighted"] forState:UIControlStateHighlighted];
//    设置frame
    CGFloat centerX = imageView.frame.size.width*0.5;
    CGFloat centerY = imageView.frame.size.height*0.6;
    
    startButton.center = CGPointMake(centerX, centerY);
    startButton.bounds = (CGRect){CGPointZero,startButton.currentBackgroundImage.size};
//    设置文字
    [startButton setTitle:@"开始微博" forState:UIControlStateNormal];
    [startButton addTarget:self action:@selector(start) forControlEvents:UIControlEventTouchUpInside];
    [imageView addSubview:startButton];
    
//    添加checkbox
    UIButton *checkbox = [[UIButton alloc]init];
    [checkbox setTitle:@"分享给大家" forState:UIControlStateNormal];
    [checkbox setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [checkbox setImage:[UIImage imageWithName:@"new_feature_share_true"] forState:UIControlStateNormal];
    [checkbox setImage:[UIImage imageWithName:@"new_feature_share_false"] forState:UIControlStateSelected];
    checkbox.titleLabel.font = [UIFont systemFontOfSize:14];
    checkbox.bounds = startButton.bounds;
    [checkbox addTarget:self action:@selector(checkboxClick:) forControlEvents:UIControlEventTouchUpInside];
    CGFloat checkboxX = centerX;
    CGFloat checkboxY = imageView.frame.size.height*0.5;
    
    checkbox.center = CGPointMake(checkboxX, checkboxY);
    [imageView addSubview:checkbox];
//    关于UIButton 内部控件的偏移
    checkbox.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 10);
//    checkbox.titleEdgeInsets = UIEdgeInsetsMake(CGFloat top, CGFloat left, CGFloat bottom, CGFloat right);
//    checkbox.contentEdgeInsets = UIEdgeInsetsMake(CGFloat top, CGFloat left, CGFloat bottom, CGFloat right);
}

#pragma mark - scrollView delegate
-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
//    1.取出水平方向上滚动的距离
    CGFloat offsetX = scrollView.contentOffset.x;
//    2.求出页码
    double pageDouble = offsetX/scrollView.frame.size.width;
    
    int pageInt = (int)(pageDouble + 0.5);

    self.pageControl.currentPage = pageInt;
}

-(void)checkboxClick:(UIButton*)checkbox
{
    checkbox.selected =!checkbox.selected;
}

-(void)start
{
//    [UIApplication sharedApplication].keyWindow.rootViewController = [[YFTabbarViewCtl alloc]init];
    self.view.window.rootViewController = [[YFTabbarViewCtl alloc]init];
    
}

@end

