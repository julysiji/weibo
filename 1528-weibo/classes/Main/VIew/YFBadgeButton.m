//
//  YFBadgeButton.m
//  1528-weibo
//
//  Created by 杨元锋 on 15/7/8.
//  Copyright (c) 2015年 netcore. All rights reserved.
//

#import "YFBadgeButton.h"

@implementation YFBadgeButton

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self)
    {
        self.hidden = YES;
        
        self.userInteractionEnabled = NO;
        
        [self setBackgroundImage:[UIImage resizeImageWithName:@"main_badge"] forState:UIControlStateNormal];
        
        self.titleLabel.font = [UIFont systemFontOfSize:10];
    }
    return self;
}

-(void)setBadgeValue:(NSString*)badgeValue
{
    _badgeValue = [badgeValue copy];
    
    if (badgeValue)
    {
        self.hidden = NO;
        
        [self setTitle:self.badgeValue forState:UIControlStateNormal];
        
        // 设置frame
        CGRect frame = self.frame;
        
        CGFloat badgeH = self.currentBackgroundImage.size.height;
        CGFloat badgeW = self.currentBackgroundImage.size.width;
        
        if (badgeValue.length>1)
        {
            CGSize badgeSize = [badgeValue sizeWithFont:self.titleLabel.font];// 文字的尺寸
            
            badgeW = badgeSize.width + 10;
        }
        
        frame.size.width = badgeW;
        frame.size.height = badgeH;
        
        self.frame = frame;
    }
    else
    {
        self.hidden = YES;
    }
}

@end
