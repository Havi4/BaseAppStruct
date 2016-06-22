//
//  AdvertisementView.h
//  BaseAppStruct
//
//  Created by Havi on 16/6/22.
//  Copyright © 2016年 Havi. All rights reserved.
//

#import <UIKit/UIKit.h>

static NSString *const adImageName = @"adImageName";
static NSString *const adUrl = @"adUrl";

@interface AdvertisementView : UIView


/** 显示广告页面方法*/
- (void)show;

/** 图片路径*/
@property (nonatomic, copy) NSString *filePath;


@end
