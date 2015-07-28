//
//  UIImage+YF.m
//  1528-weibo
//
//  Created by 杨元锋 on 15/7/5.
//  Copyright (c) 2015年 netcore. All rights reserved.
//

#import "UIImage+YF.h"

@implementation UIImage (YF)

+(UIImage*)imageWithName:(NSString*)name
{
    if (iOS7)
    {
        NSString *newname = [name stringByAppendingString:@"_os7"];
        UIImage *image = [UIImage imageNamed:newname];
        if (image == nil)
        {
            image = [UIImage imageNamed:name];
        }
        
        return image;
    }
    
    return [UIImage imageNamed:name];
}


+(UIImage*)resizeImageWithName:(NSString*)name
{
    UIImage*image = [UIImage imageWithName:name];
    
    return [image stretchableImageWithLeftCapWidth:image.size.width*0.5 topCapHeight:image.size.height*0.5];
}


@end
