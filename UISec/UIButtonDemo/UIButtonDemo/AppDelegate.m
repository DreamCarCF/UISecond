//
//  AppDelegate.m
//  UIButtonDemo
//
//  Created by liuyuecheng on 15/7/28.
//  Copyright (c) 2015年 liuyuecheng. All rights reserved.
//

#import "AppDelegate.h"
#import "Person.h"
@interface AppDelegate ()
{
    Person *_people;
}
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    //UIButton是按钮,也是继承至UIView
    //UIbutton : UIControl : UIView
    //所有继承UIControl的控件,都是可以添加事件的
    
    /*
     UIButtonTypeCustom = 0,   //用户自定义按钮类型,没有点击效果
     UIButtonTypeSystem,       //系统按钮类型,有点击效果
     UIButtonTypeDetailDisclosure, //系统提供的,信息符号按钮
     UIButtonTypeInfoLight,        //系统提供的,信息符号按钮
     UIButtonTypeInfoDark,         //系统提供的,信息符号按钮
     UIButtonTypeContactAdd,       //系统提供的,加号按钮
     
     UIButtonTypeRoundedRect = UIButtonTypeSystem,
     //带有边框的按钮.但是在IOS7以后,丢弃了.
     */
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    
    button.frame = CGRectMake(50, 50, 100, 30);
    
    //设置边框颜色
    //每一个视图都拥有一个layer.layer一般做一些高级操作,图层渲染这些.
    //因为layer.borderColor需要一个CGColorRef对象,所以进行.CGColor操作
    button.layer.borderColor = [UIColor blackColor].CGColor;
    
    //设置边框大小为2个像素
    button.layer.borderWidth = 2;
    
    //设置圆角
    button.layer.cornerRadius = 5;
    
    //给button设置title
    /*
     UIControlStateNormal       //按钮正常状态
     UIControlStateHighlighted  //按钮高亮状态
     UIControlStateDisabled     //按钮不可用状态
     UIControlStateSelected     //按钮选择状态
     */
    //按钮正常状态,名称为"按钮1"
    [button setTitle:@"按钮1" forState:UIControlStateNormal];
    //按钮高亮状态,名称为"高亮状态"  点住按钮不放开,就是高亮状态
    [button setTitle:@"高亮状态" forState:UIControlStateHighlighted];
    
    //因为xcode对中文支持不好.有时出现后面的关键字无法联想出来
    //解决的办法,先把中文剪切掉.
    
    //按钮不可用状态,名称为"不可用状态"
    [button setTitle:@"不可用状态" forState:UIControlStateDisabled];
    
    //设置按钮为不可用
//    button.enabled = NO;
    
    //按钮选择状态,名称为"选择状态"
    [button setTitle:@"选择状态" forState:UIControlStateSelected];
    
    //设置按钮为选择状态
//    button.selected = YES;
    
    //设置不同状态下的文字颜色
    [button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateHighlighted];
    
    //背景颜色没有状态之分,只有一种
    button.backgroundColor = [UIColor cyanColor];
    
    
    //给视图添加tag.打上标记,方便于在任何地方通过tag来取到该视图
    //tag值不应从0 1.应该给它加上100 200
    button.tag = 101;
    
    [self.window addSubview:button];
    
    
    UIButton *button2 = [UIButton buttonWithType:UIButtonTypeCustom];
    button2.frame = CGRectMake(50, 100, 150, 40);
    
    //获取图片
    //两种方式来获取图片
    //第一种,通过在工程中图片名字来获取图片.这种方式会将图片放到缓存中,不适合加载大图片.适合加载频繁使用的小图片
    //如果图片类型是png格式,后缀名是可用省略.因为苹果支持它.
    //如果是jpg,不可省略
    UIImage *image = [UIImage imageNamed:@"1"];
    
    
    //第二种获取图片的方式
    //先找到图片的路径
    NSString *imagePath = [[NSBundle mainBundle]pathForResource:@"1" ofType:@"png"];
//    NSLog(@"imagePath==%@",imagePath);
    //再通过图片路径来获得图片
    //这种方式,不会将图片加载到缓存
    UIImage *image2 = [UIImage imageWithContentsOfFile:imagePath];
    
    //获取图片的宽高
    CGFloat with = image2.size.width;
    CGFloat height = image2.size.height;
    NSLog(@"with==%f,height=%f",with,height);
    
    //给按钮设置图片
    [button2 setImage:image2 forState:UIControlStateNormal];
    
    
    //设置按钮的背景图片
    UIImage *backImg = [UIImage imageNamed:@"map.png"];
    [button2 setBackgroundImage:backImg forState:UIControlStateNormal];
    
    //setImage 图片不会变形
    //setBackgroundImage  图片会根据button的frame改变而改变
    
    //给按钮添加一个事件.就是你点击按钮的时候,让它干一件事
    //addTarget          给谁添加一个事件.self代表给本类添加一个事件
    //action             事件内容
    //forControlEvents   如何触发这个事件.UIControlEventTouchUpInside代表按钮按下并抬起事件
    //如果添加了事件,但是又没实现这个selector,会崩溃
    //buttonClick:  代表将调用该方法的对象传递过去
//    [button2 addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    
    
    _people = [[Person alloc]init];
    NSLog(@"people==%@",_people);
    [button2 addTarget: _people action:@selector(personClick) forControlEvents:UIControlEventTouchUpInside];
    
    [button2 setTitle:@"按钮2" forState:UIControlStateNormal];
    
    
    //移除事件
//    [button2 removeTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    
    button2.tag = 102;
    [self.window addSubview:button2];
    
    return YES;
}

//实现action事件
- (void)buttonClick:(UIButton *)button
{
    NSLog(@"按钮被点击了");
    
    //打印按钮的当前title
    NSLog(@"currentTitle==%@",button.currentTitle);
    
    //通过tag值来取到对应的视图
    //父视图通过子视图的tag,来找到它
    UIButton *button1 = (UIButton *)[self.window viewWithTag:101];
    UIButton *button2 = (UIButton *)[self.window viewWithTag:102];
    
    NSLog(@"button1.currentTitle=%@",button1.currentTitle);
    NSLog(@"button2.currentTitle=%@",button2.currentTitle);
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
