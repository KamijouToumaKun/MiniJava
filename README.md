"From Java to MIPS in Five Nifty Steps"
Project of UCLA CS 132 Compiler Construction & PKU Compiler Internship

You may go to: https://github.com/jiangyuzhao/Minijava to see the final integration version.

typecheck的MClass和MMethod文件中存在BUG，
已经在typecheck branch中对这两个文件进行了修改。

在Piglet中，以下可能是一个BUG：
分配TEMP时，首先给每个函数的每个变量分配一个TEMP。
当函数中需要临时变量的时候，则是使用getNextTemp()给它分配一个TEMP，也是从TEMP 20开始分配，
那么，临时变量的TEMP不就会和给函数变量分配的TEMP冲突？
为了保险，应该从所有函数分配完以后累加到的那个TEMP之后开始分配。
不过这不一定会造成影响。因为在大量的测试样例中，并没有在此处出现问题。
在spiglet中也有类似的TEMP分配的问题，在那里对这个问题进行了更加周密的处理。

*其实，分配temp的时候，每个函数似乎可以都从TEMP 20开始分配，不需要一直累加：
因为不存在全局变量，而类变量又都放在temp 0里。
