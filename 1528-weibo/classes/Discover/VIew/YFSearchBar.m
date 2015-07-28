//
//  YFSearchBar.m
//  1528-weibo
//
//  Created by 杨元锋 on 15/7/12.
//  Copyright (c) 2015年 netcore. All rights reserved.
//

#import "YFSearchBar.h"

@implementation YFSearchBar

+ (instancetype)searchBar
{
    return [[self alloc]init];
}

-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self)
    {
        self.background = [UIImage resizeImageWithName:@"searchbar_textfield_background"];
        
        
        self.leftView = [[UIImageView alloc]initWithImage:[UIImage imageWithName:@"searchbar_textfield_search_icon"]];
        
        self.leftView.frame = CGRectMake(0, 0, 30, self.frame.size.height);
        
        self.leftView.contentMode = UIViewContentModeCenter;
        
        self.leftViewMode = UITextFieldViewModeAlways;
        
        self.clearButtonMode = UITextFieldViewModeAlways;
        
        self.font = [UIFont systemFontOfSize:13];
        
        NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
        
        attrs[NSForegroundColorAttributeName] = [UIColor grayColor];
        
        self.attributedPlaceholder = [[NSAttributedString alloc]initWithString:@"搜索" attributes:attrs];
//        设置键盘右下角按钮样式
        self.returnKeyType = UIReturnKeySearch;
        
        self.enablesReturnKeyAutomatically = YES;
    }
    
    return self;
}
 

-(void)layoutSubviews
{
    [super layoutSubviews];
    
    self.leftView.frame = CGRectMake(0, 0, 30, self.frame.size.height);
}
@end
