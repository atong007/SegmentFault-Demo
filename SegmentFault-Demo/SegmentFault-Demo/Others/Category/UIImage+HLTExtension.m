//
//  UIImage+HLTExtension.m
//  SegmentFault-Demo
//
//  Created by 洪龙通 on 2016/11/1.
//  Copyright © 2016年 Atong007. All rights reserved.
//

#import "UIImage+HLTExtension.h"

@implementation UIImage (HLTExtension)


+ (instancetype)resizedImageWithImageName:(NSString *)imageName {
    UIImage *image = [UIImage imageNamed:imageName];
//    return [image resizableImageWithCapInsets:UIEdgeInsetsMake(0, 0.5 * image.size.width, 0, 0.5 * image.size.width) resizingMode:UIImageResizingModeStretch];
    return [image stretchableImageWithLeftCapWidth:image.size.width * 0.5 topCapHeight:image.size.height * 0.5];
}
@end
