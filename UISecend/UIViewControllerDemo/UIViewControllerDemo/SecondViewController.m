//
//  SecondViewController.m
//  UIViewControllerDemo
//
//  Created by qianfeng on 15/7/28.
//  Copyright (c) 2015年 cfboon.org. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()
{
    NSInteger _time;
}

@end

@implementation SecondViewController
- (instancetype)init

//1.构造方法
{
    self = [super init];
    if (self) {
        NSLog(@"OOOOOOOOOO1.init构造方法被调用");
       
    
    }
    return self;
}
//2.视图加载完成
- (void)viewDidLoad {
    //需要先将父视图加载；
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSLog(@"OOOOOOOOO2.视图加载完成");
    self.view.backgroundColor=[UIColor redColor];

    UIButton *button=[UIButton buttonWithType:UIButtonTypeSystem];
    button.frame=CGRectMake(50, 50, 100, 30);
    [button setTitle:@"点击跳转" forState:UIControlStateNormal];
    
    
    [button addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    
    
    //将按钮加到·视图之上；
    [self.view addSubview:button];
//因为viewDidLoad只会走一次，所以创建控件的操作，都应该放在这里
}
//3.试图即将出现
-(void)viewWillAppear:(BOOL)animated
{
    NSLog(@"OOOOOOOO3.vieWillAppeat,视图即将出现");
    


}
//4.视图已经出现
-(void)viewDidAppear:(BOOL)animated
{
    
    NSLog(@"OOOOOOOOO4.viewDidAppear,已经出现");
}
//5.视图即将消失
-(void)viewWillDisappear:(BOOL)animated
{
    
    NSLog(@"OOOOOOOOO5.viewWillDisapper,视图即将消失");
}
//6.视图已经消失
-(void)viewDidDisappear:(BOOL)animated
{
    NSLog(@"OOOOOOOO6.viewDidDisapper,视图已经消失");
}
//7.析构函数
-(void)dealloc
{
    NSLog(@"000000007.dealloc,析构函数");
}

-(void)back
{
//返回上一个视图控制器
    //dismissViewControllerAnimated  返回时是否带动画
    //completion                    返回成功之后执行block
   //视图控制器一返回，就会被销毁
    [self dismissViewControllerAnimated:YES completion:^{
        
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
