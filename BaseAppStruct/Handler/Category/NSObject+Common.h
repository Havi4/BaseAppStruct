//
//  NSObject+Common.h
//  BaseAppStruct
//
//  Created by Havi on 16/6/21.
//  Copyright © 2016年 Havi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (Common)

#pragma mark BaseURL

+ (NSString *)baseURLStr;
+ (BOOL)baseURLStrIsTest;
+ (void)changeBaseURLStrToTest:(BOOL)isTest;

+ (id) loadResponseWithPath:(NSString *)requestPath;
+ (BOOL)saveResponseData:(NSDictionary *)data toPath:(NSString *)requestPath;

@end
