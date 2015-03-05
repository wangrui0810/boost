linux:

进入linux系统后，输入
   # apt-cache search boost
你将看到很多文件信息，你会看到其中一个文件叫 libboost-dev, 直接安装此文件即可：
   # apt-get install libboost-dev
这样就安装成功了。这个速度很快，是因为直接拷贝了lib文件到系统。
可以使用本文最后代码测试安装成功与否。

检验安装成功否：在linux下任意目录下创建test.cpp

#include<iostream>
#include<boost/lexical_cast.hpp>
int main()
{
   int a = boost::lexical_cast<int>("123456");
   std::cout << a <<std::endl;
   return 0;
}

这是一个字符串转化为整数的简单程序

运行命令:
   #  g++ test.cpp -o test
   #  ./test

将得到输出结果为：123456
代表boost安装成功，就可以尽情使用boost的美妙了！！！

windows:

（1）boost下载
首先从boost官方主页BOOST官方下载网址下载最新版boost安装包。下载完毕后将其解压在某盘内[ F:\boost_1_54_0\boost_1_54_0\]。
 
（2）运行bootstrap.bat生成bjam.exe可执行文件
用VS2010的命令行来实现，后期也是使用VS2010的命令行来实现boost库的编译。步骤为：
点击开始—>所有程序--> Microsoft Visual Studio 2010-->VisualStudio tools--> Visual Studio 2010 command prompt。
打开VisualStudio 2010 command prompt后进入boost的解压目录：
f: [ 回车 ]
cd F:\boost_1_54_0\boost_1_54_0   [ 此语句表示进入到booststrap.bat目录 ]
运行booststrap.bat应用程序：bootstrap.bat [回车 ]
运行完毕后就可以在bootstrap.bat当期目录看到生成的b2.exe及bjam.exe。淡定，在使用bjam.exe之前先修改一下配置文件的内容。运行完毕后有相应的提示，可根据提示操作。
 
（3）修改user-config.jam文件
user-config.jam文件的位置在boost解压目录[我的解压目录位置为F:\boost_1_54_0\boost_1_54_0\tools\build\v2]的tools\build\v2目录下。
打开user-config.jam文件[可用记事本 ]，添加以下内容[其它的内容在默认下都是被屏蔽了的 ]：
 
using msvc : 10.0 : : <compileflags>/wd4819  <compileflags>/D_CRT_SECURE_NO_DEPRECATE  <compileflags>/D_SCL_SECURE_NO_DEPRECATE  <compileflags>/D_SECURE_SCL=0 ;
<compileflags>间用空格隔开，以上的 ':'及‘::’的格式都是正确的。如果开发环境为VS2008则msvc项应为 msvc:9.0。
保存后关闭文件。
 
（4）用bjam.exe编译生成库文件
在Visual Studio 2010 command prompt命令窗口中执行以下命令[[可先命令bjam–show-libraries查看有哪些库是必须编译才能使用的 ]]：
 
bjam stage --toolset=msvc-10.0 --without-python  --without-mpi --without-wave --without-graph --without-math  --without-serialization --stagedir="F:\boost_1_54_0\boost_1_54_0\bin\vc10" link=static runtime-link=shared threading=multi debug release
 
如果开发环境是vs2008则对应的--toolset参数值为msvc-9.0。运行此命令后就可以看见在指定目录F:\boost_1_54_0\boost_1_54_0下生成bin,bin.v2文件，然后随着编译，这两个文件里面的东西也越来越多。

 (5)设置环境变量
 设置Windows的环境变量
 在“用户变量组”，新建变量名：BOOST，变量值：D:\tmpcode\boost_1_55_0
 
 （6）修改vs2010参数
 在项目的解决方案那里找到属性页，打开并选择配置属性，选择VC++目录，设置包含目录和库目录
 包含目录 $(BOOST);$(IncludePath)
库目录   $(BOOST)\libs;$(LibraryPath) 

 (7) 进行如下程序的测试
 #include <boost/config.hpp>
#include <iostream>
#include <vector>
#include <string>
#include <boost/graph/adjacency_list.hpp>
#include <boost/tuple/tuple.hpp>
enum family
{ Jeanie, Debbie, Rick, John, Amanda, Margaret, Benjamin, N };
int main()
{
        using namespace boost;
        const char *name[] = { "Jeanie", "Debbie", "Rick", "John", "Amanda",
               "Margaret", "Benjamin"
        };
        adjacency_list <> g(N);
        add_edge(Jeanie, Debbie, g);
        add_edge(Jeanie, Rick, g);
        add_edge(Jeanie, John, g);
        add_edge(Debbie, Amanda, g);
        add_edge(Rick, Margaret, g);
        add_edge(John, Benjamin, g);
        graph_traits < adjacency_list <> >::vertex_iterator i, end;
        graph_traits < adjacency_list <> >::adjacency_iterator ai, a_end;
        property_map < adjacency_list <>, vertex_index_t >::type
               index_map = get(vertex_index, g);
        for (boost::tie(i, end) = vertices(g); i != end; ++i) {
               std::cout << name[get(index_map, *i)];
               boost::tie(ai, a_end) = adjacent_vertices(*i, g);
               if (ai == a_end)
                       std::cout << " has no children";
               else
                       std::cout << " is the parent of ";
               for (; ai != a_end; ++ai) {
                       std::cout << name[get(index_map, *ai)];
                       if (boost::next(ai) != a_end)
                               std::cout << ", ";
               }
               std::cout << std::endl;
        }
        return EXIT_SUCCESS;
}



编译出现错误：fatal error LNK1123: 转换到 COFF 期间失败: 文件无效或损坏
解决办法：项目\属性\配置属性\清单工具\输入和输出\嵌入清单：原来是“是”，改成“否”。