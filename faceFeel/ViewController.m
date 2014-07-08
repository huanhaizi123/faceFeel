//
//  ViewController.m
//  faceFeel
//
//  Created by jky-group on 14-5-9.
//  Copyright (c) 2014年 ___FULLUSERNAME___. All rights reserved.
//

#import "ViewController.h"
#define KImgH 40

@interface ViewController ()

@end

@implementation ViewController

#pragma mark 控制器的view加载完毕就调用一次
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    // 创建表情
    NSLog(@"start->%i", self.view.subviews.count);
    int colums=2;
    CGFloat margin=(self.view.frame.size.width - colums*KImgH)/(colums+1);
    // 第一个表情的y值
    CGFloat oneY=120;
    // 第一个表情的x值
    CGFloat oneX=margin;
    
    for (int i=0; i<9; i++) {
        int num = i %9;//num = [0,8];
        
        NSString *imageName=[NSString stringWithFormat:@"01%d.png",num];
        
        // i这个位置对应的列数
        int col = i%colums;
        // i这个位置对应的行数
        int row = i/colums;
        
        CGFloat x=oneX + col*(KImgH+margin);
        CGFloat y=oneY + row*(KImgH+margin);
        
        NSLog(@"start == %lf, %lf", x, y);
        
        [self addImg:imageName x:x y:y];
    }
}

#pragma mark 添加图片
- (void)addImg: (NSString *)icon x:(CGFloat)x y:(CGFloat)y
{
    UIImageView *img=[[UIImageView alloc]init];
    NSLog(@"%lu", self.view.subviews.count);
    img.image=[UIImage imageNamed:icon];
    img.frame=CGRectMake(x, y, KImgH, KImgH);
    
    [self.view addSubview:img];
    
}

#pragma mark 更新表情的列数
- (IBAction)indexChange:(UISegmentedControl *)sender {
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.5];
   // 列数
    int colums = sender.selectedSegmentIndex + 2;
    
    CGFloat margin=(self.view.frame.size.width - colums*KImgH)/(colums+1);
    // 第一个表情的y值
    CGFloat oneY=120;
    // 第一个表情的x值
    CGFloat oneX=margin;

    for (int i=0; i<10; i++) {
        // i这个位置对应的列数
        int col = i % colums;
        // i这个位置对应的行数
        int row = i / colums;
        
        CGFloat x=oneX + col*(KImgH + margin);
        CGFloat y=oneY + row*(KImgH + margin);
        
        // 取出i 位置对象的x，y位置
        //
        UIView *child  = self.view.subviews[i + 1];
        
        // 取出fram
        CGRect tmpF=child.frame;
        
        // 修改x，y
        tmpF.origin=CGPointMake(x, y);
        
        // 重新赋值
        child.frame = tmpF;
    }
}
@end
