# C函数调用关系绘制

## cflow使用

### 基本工具安装

```shell
sudo apt-get install cflow
sudo apt-get install gawk
sudo apt-get install graphviz  # dot
sudo apt install xdot
```

`dot`可以生成图片
`xdot`可以显示图片


### tree2dotx来源

原本的安装方式：

`sudo wget -c https://github.com/tinyclub/linux-0.11-lab/raw/master/tools/tree2dotx -O /usr/bin/tree2dotx`

已经失效，使用了下面连接中提供的脚本：

[cflow——C语言函数调用关系生成器](https://blog.csdn.net/lyndon_li/article/details/122163468)


### cflow命令

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


## calltree使用

### 安装

```shell
git clone https://github.com/htdy/calltree
# 如果系统是x86架构，则需要进行以下规则的配置
cp RULES/i686-linux-cc.rul RULES/x86_64-linux-cc.rul

# 由于项目中的configure已经弃用，推荐直接使用make，但是make之前先配置项目中函数名与gcc函数名冲突问题
find . -name "*.[c|h]" |xargs sed -i -e "s/fexecve/fexecve_calltree/"
find . -name "*.[c|h]" |xargs sed -i -e "s/getline/getline_calltree/"
make

# 这里系统是x86架构，所以拷贝的是x86_64-linux-cc目录下的程序（或建立链接文件也可以）
sudo cp calltree/OBJ/x86_64-linux-cc/calltree /usr/bin/calltree
```

### 使用
`calltree --hellp`来查看帮助信息

> -b：在每个制表位处打印垂直条；
>
> -g：输出函数所在文件的目录；
>
> -m：只分析main函数调用关系；
>
> -p：使用c预处理（默认），缺点就是容易产生多余的信息；
>
> -np：不使用c预处理；
>
> -xvcg：导出供xvcg使用的格式；
>
> -dot：导出供graphviz使用的格式；
>
> depth=#：设置最大打印深度；
>
> list=name：仅为函数name生成调用图；
>
> listfile=file：只列出在file中找到的函数；
>
> igorefile=file：不列出在file中找到的函数。
