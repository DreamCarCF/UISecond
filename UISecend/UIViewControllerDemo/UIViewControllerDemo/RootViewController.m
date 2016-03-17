//
//  RootViewController.m
//  UIViewControllerDemo
//
//  Created by qianfeng on 15/7/28.
//  Copyright (c) 2015年 cfboon.org. All rights reserved.
//

#import "RootViewController.h"
//导入另一个视图控制器，让他可以跳转；
#import "SecondViewController.h"
@interface RootViewController ()
{
    NSInteger _time;
    UILabel *_label;
}

@end

@implementation RootViewController
- (instancetype)init
//1.构造方法
{
    self = [super init];
    if (self) {
        NSLog(@"WWWWW1.init构造方法被调用");
     _time=100;
    }
    return self;
}



//2.视图已经加载完成；
- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"WWWWWWW2.视图加载完成");
    // Do any additional setup after loading the view.
  //self.view 视图控制器天生自带得一个view.view的大小和window一样大；
    //将视图控制器拥有的视图的背景颜色设置为红色；
    self.view.backgroundColor=[UIColor grayColor];
    
    //建一个按钮，点击这个按钮，跳到下一个页面；
    UIButton *button=[UIButton buttonWithType:UIButtonTypeSystem];
    button.frame=CGRectMake(50, 50, 100, 30);
    [button setTitle:@"点击跳转" forState:UIControlStateNormal];
   
    
    [button addTarget:self action:@selector(skip) forControlEvents:UIControlEventTouchUpInside];
    
    
    //将按钮加到·视图之上；
[self.view addSubview:button];
    
    
}


//3.试图即将出现
-(void)viewWillAppear:(BOOL)animated
{
    NSLog(@"WWWWWW3.vieWillAppeat,视图即将出现");
    NSLog(@"time=====%ld",_time);
}
//4.视图已经出现
-(void)viewDidAppear:(BOOL)animated
{
    
    NSLog(@"WWWWWW4.viewDidAppear,已经出现");
}
//5.视图即将消失
-(void)viewWillDisappear:(BOOL)animated
{
    
    NSLog(@"WWWWWW5.viewWillDisapper,视图即将消失");
}
//6.视图已经消失
-(void)viewDidDisappear:(BOOL)animated
{
    NSLog(@"WWWWWW6.viewDidDisapper,视图已经消失");
}
//7.析构函数
-(void)dealloc
{
    NSLog(@"WWWWWW7.dealloc,析构函数");
}

-(void)skip
{
    //先将上一个页面实例化；
    SecondViewController *seconVC=[[SecondViewController alloc]init];
//进行页面跳转，用的是试图控制器自带的方法；
    //presentViewController   往哪个页面跳
    //animated           是否需要动画；
    //completion         页面跳转之后，要干的实情，放到这个block里面
    
    [self presentViewController:seconVC animated:YES completion:^{
    //页面跳转成功，来这里执行回调；
    }];
//执行跳转之后，就会显示下一个试图控制器的视图。前面的视图器就会被挡住看不见；
    
}
//收到了内存警告
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.

//将占用内存较大的，并且是可以释放的对象，释放掉；


}



@end
