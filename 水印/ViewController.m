//
//  ViewController.m
//  水印
//
//  Created by Jusive on 15/11/27.
//  Copyright © 2015年 Jusive. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *image;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIImage *image = [UIImage imageNamed:@"img"];
    //开启上下文
    UIGraphicsBeginImageContextWithOptions(image.size, NO, 0);
    //拼接路径,绘制图片
    [image drawAtPoint:CGPointZero];
    //绘制文字
    NSString *str = @"@Jusive";
    [str drawAtPoint:CGPointMake(130, 170) withAttributes:nil];
    //从上下文中取出图片
    image = UIGraphicsGetImageFromCurrentImageContext();
    //关闭上下文
    UIGraphicsEndImageContext();
    //写入到桌面
    //将图片转换成二进制
    NSData *date = UIImagePNGRepresentation(image);
    [date writeToFile:@"/Users/jusive/Desktop/1.png" atomically:YES];
    self.image.image = image;
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
