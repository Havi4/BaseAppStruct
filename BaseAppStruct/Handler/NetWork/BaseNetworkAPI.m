//
//  BaseNetworkAPI.m
//  BaseAppStruct
//
//  Created by Havi on 16/6/21.
//  Copyright © 2016年 Havi. All rights reserved.
//

#import "BaseNetworkAPI.h"
#import "NSObject+Common.h"

//for debug test request method
#define kNetworkMethodName @[@"Get", @"Post", @"Put", @"Delete"]

static BaseNetworkAPI *_BaseNetworkAPI = nil;

@implementation BaseNetworkAPI

+ (instancetype)sharedJSONClient
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _BaseNetworkAPI = [[BaseNetworkAPI alloc]initWithBaseURL:[NSURL URLWithString:[self baseURLStr]]];
    });
    return _BaseNetworkAPI;
}

@end
