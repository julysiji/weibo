//
//  UIImage+YF.h
//  1528-weibo
//
//  Created by 杨元锋 on 15/7/5.
//  Copyright (c) 2015年 netcore. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (YF)

+(UIImage*)imageWithName:(NSString*)name;
/**
 *返回一张可自由拉伸的图片
 */
+(UIImage*)resizeImageWithName:(NSString*)name;



@end
