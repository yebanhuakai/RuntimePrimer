//
//  Message.m
//  OC_Swfit_Bridge_Test
//
//  Created by Shenry on 2017/10/9.
//  Copyright © 2017年 Shenry. All rights reserved.
//

#import "Message.h"
#import <objc/runtime.h>
#import "MessageForwarding.h"

@implementation Message

//- (void)sendMessage:(NSString *)word {
//    NSLog(@"normal way ：send message = %@", word);
//}

#pragma mark - Method Resolution
/*
 首先Objective-C在运行时调用+ resolveInstanceMethod:或+ resolveClassMethod:方法，让你添加方法的实现。如果你添加方法并返回YES，那系统在运行时就会重新启动一次消息发送的过程。
*/
+ (BOOL)resolveInstanceMethod:(SEL)sel {
    if (sel == @selector(sendMessage:)) {
        class_addMethod([self class], sel, imp_implementationWithBlock(^(id self, NSString *word){
            NSLog(@"method resolution way : send message = %@", word);
        }), "v@*");
    }

    return YES;
}

#pragma mark - Fast Forwarding
/*
 如果目标对象实现- forwardingTargetForSelector:方法，系统就会在运行时调用这个方法，只要这个方法返回的不是nil或self，也会重启消息发送的过程，把这消息转发给其他对象来处理。否则，就会继续Normal Fowarding。
 */
- (id)forwardingTargetForSelector:(SEL)aSelector {
    if (aSelector == @selector(sendMessage:)) {
        return [MessageForwarding new];
    }
    return nil;
}

#pragma mark - Normal Forwarding
/*
 如果没有使用Fast Forwarding来消息转发，最后只有使用Normal Forwarding来进行消息转发。它首先调用methodSignatureForSelector:方法来获取函数的参数和返回值，如果返回为nil，程序会Crash掉，并抛出unrecognized selector sent to instance异常信息。如果返回一个函数签名，系统就会创建一个NSInvocation对象并调用-forwardInvocation:方法。
 
 作者：Sam_Lau
 链接：http://www.jianshu.com/p/25a319aee33d
 來源：简书
 著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。
 */
- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector {
    NSMethodSignature *methodSignature = [super methodSignatureForSelector:aSelector];
    if (!methodSignature) {
        methodSignature = [NSMethodSignature signatureWithObjCTypes:"v@:*"]; //void object sel char*
    }
    
    return methodSignature;
}

- (void)forwardInvocation:(NSInvocation *)anInvocation {
    MessageForwarding *messageForwarding = [MessageForwarding new];
    
    if ([messageForwarding respondsToSelector:anInvocation.selector]) {
        [anInvocation invokeWithTarget:messageForwarding];
    }
}

@end
