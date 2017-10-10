# RuntimePrimer(runtime运行时机制基础）
Help you to understand the runtime

针对unrecognized selector sent to instance等问题的深入研究。在系统发送此crash信息前，系统分别提供了3次重发机制，分别是：

1.Method Resolution

2.Fast Forwarding

3.Normal Forwarding

在示例中查看Message.m来获得具体信息。

另外，对于运行时增加属性，即AssociatedObject的使用，查看Message+Association.m
