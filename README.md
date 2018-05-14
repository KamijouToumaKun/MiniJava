＃MiniJava
编写中

这个版本相对splglet的区别是，它节省下了更多的TEMP。
例如，连MAIN中的TEMP 21这样存放HALLOCATE的寄存器都拿来再利用了。

使用官方提供的测试程序运行spiglet-beta产生的八个spg代码，结果都是对的。
然而，将spiglet-beta产生的八个spg代码转化为kg，使用官方提供的测试程序运行八个kg文件，结果有错误。
而将spiglet产生的八个spg代码转化为kg，使用官方提供的测试程序运行八个kg文件，结果没有问题。

目前还不清楚发生这种情况的原因。为了保险，决定暂时不使用spiglet-beta版本。
