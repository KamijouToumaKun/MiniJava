第一遍用PigletTempNumVisitor扫描，这一边只为找到最大的一个TEMPNUM，
以后要再用到新的临时TEMPNUM时，就从这里开始计数。
当然，也可以简单的对代码段依次进行扫描，也能找到最大的一个TEMPNUM。

第二遍用Pigelet2SpigletVisitor扫描。
因为splglet的语法很严格，在piglet里面可以用Exp的地方，在spiglet中大多数都只能用TEMP。
所以遇到任何Exp，都先_ret.appendCode("MOVE TEMPNUM Exp")，
把它保存到一个新的临时TEMP里面，并且记录下这个TEMPNUM；
以后需要用到这个代码段的时候，直接用这个TEMPNUM就行了。

不过，还是有一部分情况，可以直接用Exp或SimpleExp，不必用TEMP。
如果所有地方都写成TEMP，未免太过冗余。
所以遇到任何Exp，除了把它保存到一个新的临时TEMP里面，也保存一份它的Exp版本。
如果这个Exp还属于SimpleExp，还保存一份它的SimpleExp版本。
如果在需要用到这个代码段的时候，可以直接用Exp或SimpleExp的版本，
那就直接用，不需要_ret.appendCode("MOVE TEMPNUM Exp")了。
同时把这个TEMPNUM释放、回收重用。

当然，这需要exp中不涉及到其他的TEMP
例如piglet里可以写：Operator Exp1 Exp2
在spiglet里只能写成：Operator TEMP SimpleExp
那么先对TEMP进行展开，要先_ret.appendCode("MOVE TEMPNUM1 Exp1")
再记录下TEMPNUM1。
于是代码变成了Operator TEMPNUM1 SimpleExp。
就算发现Exp是一个SimpleExp，不需要再用一个TEMPNUM2来记录它
Exp里除了保存Operator TEMPNUM1 SimpleExp
也要跟_ret一样先 += "MOVE TEMPNUM1 Exp1"
否则Exp中的TEMPNUM1尚未被赋值。
所以，在exp和_ret中都要保存一份"MOVE TEMPNUM1 Exp1"。
这会造成存储的冗余，而且会改的很乱、代码的可读性变差了。于是作罢。

其实，还可以用两个泛型参数的Visitor。
第二个参数用于指示，返回值必须是Temp，还是可以是SimpleExp或者Exp。
这样就不需要先分配TEMP、再回收不必要的TEMP这样多此一举了。
