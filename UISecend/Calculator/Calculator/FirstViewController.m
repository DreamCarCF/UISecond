//
//  FirstViewController.m
//  Calculator
//
//  Created by qianfeng on 15/7/28.
//  Copyright (c) 2015年 cfboon.org. All rights reserved.
//

#import "FirstViewController.h"

@interface FirstViewController ()
{
    UIButton*_lastbutton;
    UIButton*_lastbutton1;
    UILabel*_label;
    
    NSArray*_arr1;
    NSArray*_arr2;
    NSArray*_arr3;
    NSArray*_arr4;
    
}
@property(retain,nonatomic)NSString*_str;
@property(retain,nonatomic)NSString*_number;
@end
@implementation FirstViewController
- (instancetype)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}



- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    _arr1=@[@"7",@"8",@"9",@"+"];
    _arr2=@[@"4",@"5",@"6",@"-"];
    _arr3=@[@"1",@"2",@"3",@"*"];
    _arr4=@[@"0",@".",@"=",@"/"];
    
   _lastbutton=[[UIButton alloc]initWithFrame:CGRectMake(15, 40, 350, 70)];

    _lastbutton.backgroundColor=[UIColor grayColor];
    _lastbutton.layer.borderColor=[UIColor blackColor].CGColor;
    _lastbutton.layer.borderWidth=5.0;
    _lastbutton.layer.cornerRadius=20;
    [self.view addSubview:_lastbutton];
    
    
    _label=[[UILabel alloc]initWithFrame:CGRectMake(10, 40, 350,70)];
    _label.text=@"";
    [self.view addSubview:_label];
    for (int i=0; i<4; i++) {
        for (int j=0 ;j<4; j++) {
            
        
       UIButton *button=[[UIButton alloc]initWithFrame:CGRectMake(90*i+15,90*j+200, 68, 58)];
            button.layer.borderColor=[UIColor blackColor].CGColor;
            button.layer.borderWidth=2.0;
            button.layer.cornerRadius=20;
        button.backgroundColor=[UIColor grayColor];
        [self.view addSubview:button];
            UIButton *button1=[UIButton buttonWithType:UIButtonTypeCustom];
            button1.frame=button.frame;
            [self.view addSubview:button1];
            
            if (j==0) {
                [button1 setTitle:_arr1[i] forState:UIControlStateNormal];
            }
            if (j==1) {
                [button1 setTitle:_arr2[i] forState:UIControlStateNormal];
            }
            if (j==2) {
                [button1 setTitle:_arr3[i] forState:UIControlStateNormal];
            }
            if (j==3) {
                [button1 setTitle:_arr4[i] forState:UIControlStateNormal];
            }
            button1.tag=100+j;
            [button1 addTarget:self action:@selector(calculator1:) forControlEvents:UIControlEventTouchUpInside];
            [self.view addSubview:button1];
        }}
}

-(void)oppositeClick:(UIButton*)oppositeBut
{
    CGFloat num=[_label.text floatValue];
    _label.text=[NSString stringWithFormat:@"%g",(-num)];
}
-(void)percentClick:(UIButton*)percentBut
{
    CGFloat num=[_label.text floatValue];
    _label.text=[NSString stringWithFormat:@"%g",(num/100)];
}
-(void)clearClick:(UIButton*)clearBut
{
    _label.text=nil;
}

-(void)operationClick:(UIButton *)operation
{
    
    if ([operation.currentTitle isEqualToString:@"+"]) {
        self._str=[_label.text stringByAppendingString:@"+"];
    }else if ([operation.currentTitle isEqualToString:@"-"])
    {
        self._str=[_label.text stringByAppendingString:@"-"];
        
    }else if ([operation.currentTitle isEqualToString:@"*"])
    {
        self._str=[_label.text stringByAppendingString:@"*"];
        
    }else if ([operation.currentTitle isEqualToString:@"/"])
    {
        self._str=[_label.text stringByAppendingString:@"/"];
        
    }
    
}

-(void)calculator1:(UIButton*)button
{
    
    if (button.currentTitle.length>0) {
       
                       
                       if ([button.currentTitle isEqualToString:@"+"]) {
                           self._str=[_label.text stringByAppendingString:@"+"];
                           CGFloat value1=[self._str floatValue];
                           CGFloat value2=[_label.text floatValue];
                           _label.text=[NSString stringWithFormat:@"%g",(value1 + value2)];
                       }else if ([button.currentTitle isEqualToString:@"-"])
                       {
                           self._str=[_label.text stringByAppendingString:@"-"];
                           
                       }else if ([button.currentTitle isEqualToString:@"*"])
                       {
                           self._str=[_label.text stringByAppendingString:@"*"];
                           
                       }else if ([button.currentTitle isEqualToString:@"/"])
                       {
                           self._str=[_label.text stringByAppendingString:@"/"];
                           
                       }else
                       {
                           self._str=[_label.text stringByAppendingString:button.titleLabel.text];
                           
                       }
                        _label.text=self._str;
                       if ([self._str hasPrefix:@"+"]) {
                           CGFloat value1=[self._str floatValue];
                           CGFloat value2=[_label.text floatValue];
                           _label.text=[NSString stringWithFormat:@"%g",(value1 + value2)];
                       }

         
      
        _label.textAlignment=NSTextAlignmentRight;
//        [_lastbutton setTitle:button.currentTitle forState:UIControlStateNormal];
     
        
        
    }
    
}
-(void)clear
{
    _label.text=@"";
}
-(void)delete:(id)sender
{
    
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
