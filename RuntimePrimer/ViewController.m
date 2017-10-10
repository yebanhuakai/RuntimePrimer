//
//  ViewController.m
//  RuntimePrimer
//
//  Created by Shenry on 2017/10/10.
//  Copyright © 2017年 Shenry. All rights reserved.
//

//深入理解Objective-C的Runtime机制
//http://www.jianshu.com/p/25a319aee33d
//
//Understanding the Objective-C Runtime:
//http://cocoasamurai.blogspot.jp/2010/01/understanding-objective-c-runtime.html
//
//理解 Objective-C Runtime
//https://justinyan.me/post/1624
//
//Objective-C Runtime
//http://tech.glowing.com/cn/objective-c-runtime/
//
//http://blog.sunnyxx.com/2014/03/06/ios_exam_0_key/ iOS程序员6级考试

#import "ViewController.h"
#import "Message.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //Rumtime sendMessage机制于message.m实现
    Message *message = [Message new];
    [message sendMessage:@"Shenry"];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
