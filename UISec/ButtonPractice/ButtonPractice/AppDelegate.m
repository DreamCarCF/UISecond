//
//  AppDelegate.m
//  ButtonPractice
//
//  Created by liuyuecheng on 15/7/28.
//  Copyright (c) 2015年 liuyuecheng. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()
{
    NSArray *_normalArray;
    NSArray *_selectedArray;
    UIButton *_lastButton;
}
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    _normalArray = @[@"1_normal.png",@"2_normal.png",@"3_normal.png",@"4_normal.png",@"5_normal.png",];
    _selectedArray = @[@"1_selected.png",@"2_selected.png",@"3_selected.png",@"4_selected.png",@"5_selected.png",];
    
    for (int i=0; i<5; i++)
    {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(64*i, self.window.frame.size.height-64, 64, 64);
        [button setImage:[UIImage imageNamed:_normalArray[i]] forState:UIControlStateNormal];
        [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        button.tag = 100+i;
        [self.window addSubview:button];
        
        if (i==0)
        {
            _lastButton = button;
        }
    }
    
    return YES;
}
- (void)buttonClick:(UIButton *)button
{
    //快捷对齐你的代码  control+i
    //将前面的button置灰
    [_lastButton setImage:[UIImage imageNamed:_normalArray[_lastButton.tag -100]] forState:UIControlStateNormal];
    
    NSLog(@"tag==%d",_lastButton.tag);
    
    //将前面的button记住
    _lastButton = button;

    //用for循环,将所有按钮置灰
//    for (int i=0; i<5; i++)
//    {
//        //取到所有的按钮
//        UIButton *b = (UIButton *)[self.window viewWithTag:100+i];
//        [b setImage:[UIImage imageNamed:_normalArray[b.tag-100]] forState:UIControlStateNormal];
//    }
    
    //改变按钮的图片,让他有选中效果
    [button setImage:[UIImage imageNamed:_selectedArray[button.tag-100]] forState:UIControlStateNormal];
}
- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
