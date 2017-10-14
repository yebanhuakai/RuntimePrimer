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
#import <objc/message.h>
#import "Son.h"
#import "Message+Association.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //Rumtime sendMessage机制于message.m实现
//    Message *message = [Message new];
//    [message sendMessage:@"Shenry"];
    
//    NSMutableArray *arr = [NSMutableArray new];
//    objc_msgSend(arr, @selector(insertObject:atIndex:), message, 0);
    
//    NSLog(@"%@", arr);
//
    Son *son = [Son new];
    NSMutableArray *arr = [NSMutableArray arrayWithObjects:@1, @2, nil];
    son.mutableArray = arr;
    [son.mutableArray removeObjectAtIndex:0];
    
    NSArray *array = [NSArray arrayWithObjects:@3, @4, nil];
    son.array = array;
    
//    [son printCurrentClass];
//    [son printSuperClass];
//    [son respondsToSelector:nil];
    
//    BOOL b1 = [son respondsToSelector:@selector(respondsToSelector:)];
//    BOOL b2 = [Son respondsToSelector:@selector(respondsToSelector:)];
//    NSLog(@"%d, %d", b1, b2);
//
//    sleep(5);
//    dispatch_async(dispatch_get_global_queue(0, 0), ^{
//        NSLog(@"Can you see me?");
//    });
    
//    Son *son1 = [Son newSon];
//    NSLog(@"son1:%@", son1);
//
//    Son *son2 = [Son newSonNew];
//    NSLog(@"son2:%@", son2);
    
//    NSMutableString *string = [NSMutableString stringWithString:@"origin"];//copy
//    NSString *stringCopy = [string copy];
//
//    NSLog(@"isEqual:%d", [string isEqual:stringCopy]);
//    NSLog(@"isEqualToString:%d", [string isEqualToString:stringCopy]);
//    NSLog(@"==:%d", string == stringCopy); //判断的是指针地址
//
//    NSLog(@"%lu", (unsigned long)[string hash]);
//    NSLog(@"%lu", (unsigned long)[stringCopy hash]);
    
//    NSLog(@"%@", &string);
//    NSLog(@"%@", &stringCopy);
    
//    NSMutableString *stringNew = string;

//    NSLog(@"%p, %p", string, stringNew);
//    NSLog(@"%p, %p", string, stringCopy);
    
    Message *mes = [[Message alloc] init];
    mes.string = @"123";
    NSLog(@"%@", mes.string);
    
    
    
    //如何运行时添加实例变量
    
//    objc_allocateClassPair(<#Class  _Nullable __unsafe_unretained superclass#>, <#const char * _Nonnull name#>, <#size_t extraBytes#>)
    
    //    class_addIvar(<#Class  _Nullable __unsafe_unretained cls#>, <#const char * _Nonnull name#>, <#size_t size#>, <#uint8_t alignment#>, <#const char * _Nullable types#>)
    
//    objc_registerClassPair(<#Class  _Nonnull __unsafe_unretained cls#>)
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
