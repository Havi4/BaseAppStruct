//
//  NSObject+Common.m
//  BaseAppStruct
//
//  Created by Havi on 16/6/21.
//  Copyright © 2016年 Havi. All rights reserved.
//

#import "NSObject+Common.h"
#import "BaseNetworkAPI.h"

#define kPath_ImageCache @"ImageCache"
#define kPath_ResponseCache @"ResponseCache"
#define kTestKey @"BaseURLIsTest"

@implementation NSObject (Common)

#pragma mark baseUrl 处理url
//处理基本的BaseUrl
+ (NSString *)baseURLStr
{
    NSString *baseURLStr = nil;
    if ([self baseURLStrIsTest]) {
        baseURLStr = kAppTestBaseURL;
    }else{
        baseURLStr = kAppBaseURL;
    }
    return baseURLStr;
}

+ (BOOL)baseURLStrIsTest
{
    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
    return [[userDefault objectForKey:kTestKey] boolValue];
}

+ (void)changeBaseURLStrToTest:(BOOL)isTest
{
    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
    [userDefault setObject:@(isTest) forKey:kTestKey];
    [userDefault synchronize];
    //将api中的client改变为测试环境
    [BaseNetworkAPI changeJSONClient];
    //我们可以在切换之后进行其他的操作，比如改变导航栏的颜色
//    [[UINavigationBar appearance] setBackgroundImage: [UIImage imageWithColor:[UIColor colorWithHexString:isTest?@"0x3bbd79": @"0x28303b"]] forBarMetrics:UIBarMetricsDefault];
}

/**
 *  根据图片名拼接文件路径
 */
- (NSString *)getFilePathWithImageName:(NSString *)imageName
{
    if (imageName) {
        
        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask, YES);
        NSString *adversement = [[paths objectAtIndex:0] stringByAppendingPathComponent:@"Adversement"];
//        NSFileManager *fileManager = [[NSFileManager alloc] init];
//        if (![[NSFileManager defaultManager] fileExistsAtPath:adversement]) {
//            [fileManager createDirectoryAtPath:adversement withIntermediateDirectories:YES attributes:nil error:nil];
//        }
        NSString *imageFile = [adversement stringByAppendingPathComponent:imageName];

        return imageFile;
    }
    
    return nil;
}

/**
 *  判断文件是否存在
 */
- (BOOL)isFileExistWithFilePath:(NSString *)filePath
{
    NSFileManager *fileManager = [NSFileManager defaultManager];
    BOOL isDirectory = FALSE;
    return [fileManager fileExistsAtPath:filePath isDirectory:&isDirectory];
}

/**
 *  删除旧图片
 */
- (void)deleteOldImage
{
    NSString *imageName = [kUserDefaults valueForKey:@"adImageName"];
    if (imageName) {
        NSString *filePath = [self getFilePathWithImageName:imageName];
        NSFileManager *fileManager = [NSFileManager defaultManager];
        [fileManager removeItemAtPath:filePath error:nil];
    }
}

/**
 *  初始化广告页面
 */
- (void)getAdvertisingImage
{
    
    // TODO 请求广告接口
    
    // 这里原本采用美团的广告接口，现在了一些固定的图片url代替
    NSArray *imageArray = @[@"http://imgsrc.baidu.com/forum/pic/item/9213b07eca80653846dc8fab97dda144ad348257.jpg", @"http://pic.paopaoche.net/up/2012-2/20122220201612322865.png", @"http://img5.pcpop.com/ArticleImages/picshow/0x0/20110801/2011080114495843125.jpg", @"http://www.mangowed.com/uploads/allimg/130410/1-130410215449417.jpg"];
    NSString *imageUrl = imageArray[arc4random() % imageArray.count];
    
    // 获取图片名:43-130P5122Z60-50.jpg
    NSArray *stringArr = [imageUrl componentsSeparatedByString:@"/"];
    NSString *imageName = stringArr.lastObject;
    
    // 拼接沙盒路径
    NSString *filePath = [self getFilePathWithImageName:imageName];//图片
    BOOL isExist = [self isFileExistWithFilePath:filePath];
    if (!isExist){// 如果该图片不存在，则删除老图片，下载新图片
        
        BaseNetworkAPI *a = [BaseNetworkAPI sharedJSONClient];
        [a downloadImageWithPath:imageUrl successBlock:^(id responseObject) {
            
        } failureBlock:^(NSError *error) {
            
        } progerssBlock:^(CGFloat progressValue) {
            
        }];
        
    }
    
}


@end
