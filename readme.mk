linux:

����linuxϵͳ������
   # apt-cache search boost
�㽫�����ܶ��ļ���Ϣ����ῴ������һ���ļ��� libboost-dev, ֱ�Ӱ�װ���ļ����ɣ�
   # apt-get install libboost-dev
�����Ͱ�װ�ɹ��ˡ�����ٶȺܿ죬����Ϊֱ�ӿ�����lib�ļ���ϵͳ��
����ʹ�ñ�����������԰�װ�ɹ����

���鰲װ�ɹ���
��linux������Ŀ¼�´���test.cpp

#include<iostream>
#include<boost/lexical_cast.hpp>
int main()
{
   int a = boost::lexical_cast<int>("123456");
   std::cout << a <<std::endl;
   return 0;
}

����һ���ַ���ת��Ϊ�����ļ򵥳���

��������:
   #  g++ test.cpp -o test
   #  ./test

���õ�������Ϊ��123456
����boost��װ�ɹ�

windows:

��1��boost����
���ȴ�boost�ٷ���ҳBOOST�ٷ�������ַ�������°�boost��װ����������Ϻ����ѹ��ĳ����[ F:\boost_1_54_0\boost_1_54_0\]��
 
��2������bootstrap.bat����bjam.exe��ִ���ļ�
��VS2010����������ʵ�֣�����Ҳ��ʹ��VS2010����������ʵ��boost��ı��롣
����Ϊ��
�����ʼ��>���г���--> Microsoft Visual Studio 2010-->VisualStudio tools--> Visual Studio 2010 command prompt��
��VisualStudio 2010 command prompt�����boost�Ľ�ѹĿ¼, as following��
f: [ �س� ]
cd F:\boost_1_54_0\boost_1_54_0   [ ������ʾ���뵽booststrap.batĿ¼ ]
����booststrap.batӦ�ó���bootstrap.bat [�س� ]
������Ϻ�Ϳ�����bootstrap.bat����Ŀ¼�������ɵ�b2.exe��bjam.exe��

 
��3���޸�user-config.jam�ļ�
user-config.jam�ļ���λ����boost��ѹĿ¼
�����������:
 
using msvc : 10.0 : : <compileflags>/wd4819  <compileflags>/D_CRT_SECURE_NO_DEPRECATE  <compileflags>/D_SCL_SECURE_NO_DEPRECATE  <compileflags>/D_SECURE_SCL=0 ;
�����������ΪVS2008��msvc��ӦΪ msvc:9.0��
�����ر��ļ���
 
��4����bjam.exe�������ɿ��ļ�
��Visual Studio 2010 command prompt�������ִ���������
 
bjam stage --toolset=msvc-10.0 --without-python  --without-mpi --without-wave --without-graph --without-math  --without-serialization --stagedir="F:\boost_1_54_0\boost_1_54_0\bin\vc10" link=static runtime-link=shared threading=multi debug release
 
�������������vs2008���Ӧ��--toolset����ֵΪmsvc-9.0��


 (5)���û�������
 ����Windows�Ļ�������
 �ڡ��û������顱���½���������BOOST������ֵ��D:\tmpcode\boost_1_55_0
 
 ��6���޸�vs2010����
 ����Ŀ�Ľ�����������ҵ�����ҳ���򿪲�ѡ���������ԣ�ѡ��VC++Ŀ¼�����ð���Ŀ¼�Ϳ�Ŀ¼
 ����Ŀ¼ $(BOOST);$(IncludePath)
��Ŀ¼   $(BOOST)\libs;$(LibraryPath) 

 (7) �������³���Ĳ���
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



������ִ���fatal error LNK1123: ת���� COFF �ڼ�ʧ��: �ļ���Ч����
����취����Ŀ\����\��������\�嵥����\��������\Ƕ���嵥��ԭ���ǡ��ǡ����ĳɡ��񡱡�