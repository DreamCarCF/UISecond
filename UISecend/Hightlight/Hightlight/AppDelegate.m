//
//  AppDelegate.m
//  Hightlight
//
//  Created by qianfeng on 15/7/28.
//  Copyright (c) 2015年 cfboon.org. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()
{
    UIButton *_lastbutton;
    NSArray *_arr;
    NSArray *_arr1;
}
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    _arr=@[@"1_normal.png",@"2_normal.png",@"3_normal.png",@"4_normal.png",@"5_normal.png"];
    
    for (int i=0; i<5; i++) {
        UIButton *button=[UIButton buttonWithType:UIButtonTypeCustom];
        button.frame=CGRectMake(64*i+30, 600, 64, 64);
        UIImage *image=[UIImage imageNamed: _arr[i]];
        [button setImage:image forState:UIControlStateNormal];
        [button addTarget:self action:@selector(light:) forControlEvents:UIControlEventTouchUpInside];
        button.tag=100+i;
        [self.window addSubview:button];
        
    
    if (i==0) {
        _lastbutton=button;
    }
    }
    
    return YES;
}
-(void)light:(UIButton*)button
{_arr1=@[@"1_selected.png",@"2_selected.png",@"3_selected.png",@"4_selected.png",@"5_selected.png"];
    for (int i=0; i<5; i++) {
        
        UIButton *b=(UIButton*)[self.window viewWithTag:100+i];
        [b setImage:[UIImage imageNamed:_arr[b.tag-100]] forState:UIControlStateNormal];
    }
    [button setImage:[UIImage imageNamed:_arr1[button.tag-100]] forState:UIControlStateNormal];
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
