# cflow使用

## 基本工具安装

```shell
sudo apt-get install cflow
sudo apt-get install gawk
sudo apt-get install graphviz  # dot
sudo apt install xdot
```

`dot`可以生成图片
`xdot`可以显示图片


## tree2dotx来源

原本的安装方式：

`sudo wget -c https://github.com/tinyclub/linux-0.11-lab/raw/master/tools/tree2dotx -O /usr/bin/tree2dotx`

已经失效，使用了下面连接中提供的脚本：

[cflow——C语言函数调用关系生成器](https://blog.csdn.net/lyndon_li/article/details/122163468)


## cflow命令

> -A, --all：展示所有函数，不仅仅是从main函数调用的；
>
> -b, --brief：简要输出；
>
> –cpp[=COMMAND]：运行指定的预处理命令；
>
> -d, --depth=NUMBER：设置流程图被切断的深度；
>
> -D, --define=NAME[=DEFN]：预定义名字作为宏；
>
> -f, --format=NAME：使用给定输出格式名，可选的有gnu（默认）和posix；
>
> -I, --include-dir=DIR：添加DIR到搜索头文件的目录表中；
>
> -m, --main=NAME：指定需要分析的函数名；
>
> -n, --number：打印行号；
>
> -o, --output=FILE：设置输出文件，默认为标准输出；
>
> -T, --tree：描画调用图；

