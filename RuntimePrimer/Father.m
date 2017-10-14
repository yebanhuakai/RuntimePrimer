//
//  Father.m
//  RuntimePrimer
//
//  Created by Shenry on 2017/10/12.
//  Copyright © 2017年 Shenry. All rights reserved.
//

#import "Father.h"

@implementation Father

- (void)showWhoIAm
{
    NSLog(@"I'm Father");
}

- (void)printCurrentClass {
    NSLog(@"printCurrentClass:%@", [self class]);
}

@end
