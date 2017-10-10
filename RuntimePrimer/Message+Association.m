//
//  Message+Association.m
//  OC_Swfit_Bridge_Test
//
//  Created by Shenry on 2017/10/9.
//  Copyright © 2017年 Shenry. All rights reserved.
//

#import "Message+Association.h"
#import <objc/runtime.h>

@implementation Message (Association)

/*
 当想使用Category对已存在的类进行扩展时，一般只能添加实例方法或类方法，而不适合添加额外的属性。虽然可以在Category头文件中声明property属性，但在实现文件中编译器是无法synthesize任何实例变量和属性访问方法。这时需要自定义属性访问方法并且使用Associated Objects来给已存在的类Category添加自定义的属性。
 
 作者：Sam_Lau
 链接：http://www.jianshu.com/p/25a319aee33d
 來源：简书
 著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。
 */
- (void)setAssociatedObject:(id)associatedObject {
    objc_setAssociatedObject(self, @selector(associatedObject), associatedObject, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

/*
 Associated Objects的key要求是唯一并且是常量，而SEL是满足这个要求的，所以上面的采用隐藏参数_cmd作为key。
 */
- (id)associatedObject
{
    return objc_getAssociatedObject(self, _cmd);//_cmd表示当前调用方法，其实它就是一个方法选择器SEL。一般用于判断方法名或在Associated Objects中唯一标识键名
}

@end
