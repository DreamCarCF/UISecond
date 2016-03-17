//
//  AppDelegate.m
//  ChessButton
//
//  Created by qianfeng on 15/7/28.
//  Copyright (c) 2015年 cfboon.org. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()
{
    UIButton*_lastButton;
    //记住前面点的是哪个按钮；
}
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    NSArray *arr=@[@"车",@"马",@"象",@"王",@"后",@"象",@"马",@"车"];
    NSArray*arr1=@[@"车",@"马",@"象",@"后",@"王",@"象",@"马",@"车"];
    for (int i=0; i<8; i++) {
        for (int j=0; j<8; j++) {
            //画出棋盘
            UILabel *label=[[UILabel alloc]initWithFrame:CGRectMake(40*j, 20+40*i, 40, 40)];
            if (i%2==j%2) {
                label.backgroundColor=[UIColor blackColor];
            }
            else{
                
                label.backgroundColor=[UIColor whiteColor];
                
            }
            [self.window addSubview:label];
            //制作棋子
            UIButton *button=[UIButton buttonWithType:UIButtonTypeCustom];
            //让button的位置和label的位置一样，叠加效果
            button.frame=label.frame;
            [self.window addSubview:button];
            if (i==0) {
                [button setTitle:arr[j] forState:UIControlStateNormal];
            }
            if (i==7) {
                [button setTitle:arr1[j] forState:UIControlStateNormal];
            }

            if (i==1) {
                [button setTitle:@"兵" forState:UIControlStateNormal];
            }
            if (i==6) {
                [button setTitle:@"卒" forState:UIControlStateNormal];
            }
            if (i==0||i==1) {
                [button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
            }
            if (i==6||i==7) {
                [button setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];
               }
            //添加事件
            [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        }
    }
                return YES;
}
-(void)buttonClick:(UIButton*)button
{
    //如果有棋子就记录，没有则不记录；
    //currentTitle 就是当前按钮上得title；
    if (button.currentTitle.length>0) {
        _lastButton=button;
    }
    //进行棋子交换；
    //上一次必须有棋子并且现在这个位置是空白的；
    if (_lastButton!=nil && button.currentTitle.length==0) {
        
        //使用中间变量进行交换；
        CGRect frame=_lastButton.frame;
        _lastButton.frame=button.frame;
        button.frame=frame;
        //将视图放到父视图的最上面；
        [self.window bringSubviewToFront:_lastButton];
        [self.window bringSubviewToFront:button];
        
    }
    
    
    
    
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
