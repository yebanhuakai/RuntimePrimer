//
//  Son.m
//  RuntimePrimer
//
//  Created by Shenry on 2017/10/12.
//  Copyright © 2017年 Shenry. All rights reserved.
//

#import "Son.h"

@implementation Son

- (instancetype)init
{
    self = [super init];
    if (self) {
        NSLog(@"%@", NSStringFromClass([self class]));
        NSLog(@"%@", NSStringFromClass([super class]));
        [super showWhoIAm];
        
        NSLog(@"%@", [self class]);
        NSLog(@"%@", [super class]);
        
        NSLog(@"%@", [self hash]);
        NSLog(@"%@", [super hash]);
        
    }
    return self;
}


- (void)printSuperClass {
    [super printCurrentClass];
}

+ (id)newSon{
    
    Son *son = [Son new];
  
    return son;
}

+ (instancetype)newSonNew {
    Son *son = [Son new];
    
    return son;
}

@end
