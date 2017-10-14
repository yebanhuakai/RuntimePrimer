//
//  Son.h
//  RuntimePrimer
//
//  Created by Shenry on 2017/10/12.
//  Copyright © 2017年 Shenry. All rights reserved.
//

#import "Father.h"

@interface Son : Father

@property (nonatomic, copy) NSArray *array;
@property (nonatomic, strong) NSMutableArray *mutableArray;

- (void)showWhoIAm;

- (void)printSuperClass;

+ (id)newSon;

+ (instancetype)newSonNew;

@end

