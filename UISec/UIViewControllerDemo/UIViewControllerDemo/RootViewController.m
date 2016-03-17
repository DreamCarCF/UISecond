//
//  RootViewController.m
//  UIViewControllerDemo
//
//  Created by liuyuecheng on 15/7/28.
//  Copyright (c) 2015年 liuyuecheng. All rights reserved.
//

#import "RootViewController.h"
//导入另一个视图控制器,让它可以跳转
#import "SecondViewController.h"
@interface RootViewController ()
{
    NSInteger _time;
    UILabel *_label;
}
@end

@implementation RootViewController
//1.构造方法
- (instancetype)init
{
    self = [super init];
    if (self)
    {
        NSLog(@"ROOTVC--1.init,构造方法被调用");
        _time = 100;
    }
    return self;
}
//2.视图加载完成
//视图已经加载完成
- (void)viewDidLoad
{
    [super viewDidLoad];
    NSLog(@"ROOTVC--2.viewDidLoad,视图加载完成");
    // Do any additional setup after loading the view.
    
    //self.view  视图控制器天生自带的一个view.view的大小和window一样大
    
    //将视图控制器拥有的视图的背景颜色设置为红色
    self.view.backgroundColor = [UIColor yellowColor];
    
    
    //建一个按钮,点击这个按钮,跳到下一个页面
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    button.frame = CGRectMake(50, 50, 100, 30);
    [button setTitle:@"点击跳转" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(skip) forControlEvents:UIControlEventTouchUpInside];
    //将按钮加到视图之上
    [self.view addSubview:button];
    
     _label= [[UILabel alloc]initWithFrame:CGRectMake(50, 250, 100, 30)];
     _label.text = @"12345678";
    [self.view addSubview:_label];
}

//3.视图即将出现
- (void)viewWillAppear:(BOOL)animated
{
    NSLog(@"ROOTVC--3.viewWillAppear,视图即将出现");
    NSLog(@"time=============%ld",_time);
}
//4.视图已经出现
- (void)viewDidAppear:(BOOL)animated
{
    NSLog(@"ROOTVC--4.viewDidAppear,视图已经出现");
}
//5.视图即将消失
- (void)viewWillDisappear:(BOOL)animated
{
    NSLog(@"ROOTVC--5.viewWillDisappear,视图即将消失");
}
//6.视图已经消失
-(void)viewDidDisappear:(BOOL)animated
{
    NSLog(@"ROOTVC--6.viewDidDisappear,视图已经消失");
}

//7.析构函数
- (void)dealloc
{
    NSLog(@"ROOTVC--7.dealloc,析构函数");
}

- (void)skip
{
    //将label置空
    _label.text = @"qwer";
    return;
    
    //先将下一个页面实例化
    SecondViewController *seconVC = [[SecondViewController alloc]init];
    //进行页面跳转,用的是视图控制器自带的方法
    //presentViewController     往哪个页面跳
    //animated                  是否需要动画
    //completion                页面跳转完成之后,要干的事情.放到这个block里面
    [self presentViewController:seconVC animated:YES completion:^{
        //页面跳转成功,来这里执行回调
    }];
    
    //执行跳转之后,就会显示下一个视图控制器的视图,前面的视图控制器就会被挡住看不见
}
//收到了内存警告
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
    //将占用内存较大的,并且是可以释放的对象,释放掉
}


@end
