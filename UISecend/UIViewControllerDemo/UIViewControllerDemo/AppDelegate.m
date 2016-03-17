//
//  AppDelegate.m
//  UIViewControllerDemo
//
//  Created by qianfeng on 15/7/28.
//  Copyright (c) 2015年 cfboon.org. All rights reserved.
//

#import "AppDelegate.h"
#import "RootViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    
    //UIViewController 视图控制器：管理视图和数据
    //为什么使用视图控制器？
    //每个视图控制器拥有不同的视图
    //一般的，通过继承UIViewController来创建我们自己的视图控制器
    //实例化视图控制器
    
    RootViewController* root=[[RootViewController alloc]init];
    
    
    
    //将视图控制器设置为window的根视图；
    
    self.window.rootViewController=root;
    
    //执行上面这句话之后，程序启动，看到就是视图控制器了；
    //然后我们做的任何视图操作。或者数据获取，加载等操作，都应该放在试图控制器中
    //因为有视图控制器，才可以做跳转操作
    return YES;
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
