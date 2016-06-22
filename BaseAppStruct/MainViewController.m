//
//  MainViewController.m
//  BaseAppStruct
//
//  Created by Havi on 16/6/21.
//  Copyright © 2016年 Havi. All rights reserved.
//

#import "MainViewController.h"
#import "BaseNetworkAPI.h"
@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    BaseNetworkAPI *a = [BaseNetworkAPI sharedJSONClient];
    [a downloadImageWithPath:@"http://imgsrc.baidu.com/forum/pic/item/9213b07eca80653846dc8fab97dda144ad348257.jpg" successBlock:^(id responseObject) {
        
    } failureBlock:^(NSError *error) {
        
    } progerssBlock:^(CGFloat progressValue) {
        
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
