//
//  YFTitleButton.m
//  1528-weibo
//
//  Created by 杨元锋 on 15/7/18.
//  Copyright (c) 2015年 netcore. All rights reserved.
//

#import "YFTitleButton.h"
#define IMAGW 20

@implementation YFTitleButton

+(instancetype)titleButton
{
    return [[self alloc]init];
}

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        self.adjustsImageWhenHighlighted = NO;
        
        self.imageView.contentMode = UIViewContentModeCenter;
        
        [self setBackgroundImage:[UIImage resizeImageWithName:@"navigationbar_fliter_background_highlighted"] forState:UIControlStateHighlighted];
        
        [self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        
        self.titleLabel.font = [UIFont boldSystemFontOfSize:19];
        
        self.titleLabel.textAlignment = NSTextAlignmentRight;
    }
    return self;
}

-(CGRect)imageRectForContentRect:(CGRect)contentRect
{
    CGFloat imageY = 0;
    CGFloat imageW = IMAGW;
    CGFloat imageX = contentRect.size.width - imageW;
    CGFloat imageH = contentRect.size.height;
    return CGRectMake(imageX, imageY, imageW, imageH);
}


-(CGRect)titleRectForContentRect:(CGRect)contentRect
{
    CGFloat titleW = contentRect.size.width - IMAGW;
    CGFloat titleH = contentRect.size.height;
    return CGRectMake(0, 0, titleW, titleH);
}

@end
