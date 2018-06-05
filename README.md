＃MiniJava
编写中

这个版本相对splglet的区别是，它节省下了更多的TEMP。
例如，连MAIN中的TEMP 21这样存放HALLOCATE的寄存器都拿来再利用了。

使用官方提供的测试程序运行spiglet-beta产生的八个spg代码，结果都是对的。
然而，将spiglet-beta产生的八个spg代码转化为kg，使用官方提供的测试程序运行八个kg文件，结果有错误。
而将spiglet产生的八个spg代码转化为kg，使用官方提供的测试程序运行八个kg文件，结果没有问题。

这是因为最初的时候，spiglet转kanga的这一步做错了，有情况没有考虑到。
在修正以后，我们证明spiglet-beta版本也是正确的。
不过，kanga还是在spiglet上进行；当前版本仍作为一个beta版本。
