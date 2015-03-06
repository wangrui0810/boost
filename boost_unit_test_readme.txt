create the WRMath.hpp file , code as following:
 
#ifndef WRMATH_H
#define WRMATH_H

int Add(int a, int b)
{
	return a+b;
}
int Sub(int a, int b)
{
	return a-b;
}
int Mul(int a, int b)
{
	return a*b;
}
int Div(int a, int b)
{
	return a/b;
}

#endif


create the main.cpp , code as following:



#define BOOST_TEST_MODULE WRMath 

/* 
  *首先，需要定义#define BOOST_TEST_MODULE example 
  *或者#define BOOST_AUTO_TEST_MAIN，
  *否则测试模块初始化函数需要手动实现
*/
#include <boost/test/included/unit_test.hpp>
#include "WRMath.hpp"

BOOST_AUTO_TEST_SUITE (WRMathTest) // name of the test suite is WRMathTest

/* 
	*然后宏“BOOST_AUTO_TEST_SUITE(WRMathTest)”将创建一个
	*名为WRMathTest的测试套件，并将其加入到测试模块中
*/


//下面是两个测试案例

BOOST_AUTO_TEST_CASE (test1)
{
  BOOST_CHECK( Add(1, 2) == 2 );
   BOOST_CHECK( Sub(1, 2) == -1 );
}
BOOST_AUTO_TEST_CASE (test2)
{
  BOOST_CHECK( Mul(1, 2) == 2 );
   BOOST_CHECK( Div(2, 1) == 2 );
    BOOST_CHECK( Add(1, 1) == 3 );

}

/*
   *七种不同的方式来对函数进行测试：
	BOOST_CHECK：这种方法将检查到的错误保存起来，测试结束时由测试框架自动显示；
	BOOST_REQUIRE：同样是检查错误，与BOOST_CHECK不同之处在于如果发生错误时将抛出一个异常，因此后续的测试将不会继续进行；
	BOOST_ERROR：可以用来对错误进行独立描述，测试结束时由测试框架自动显示；
	BOOST_FAIL：同样可以用来对错误进行独立描述，调用时将抛出一个异常；
	抛出异常方式：测试框架将捕获该异常并打印出错误信息；
	BOOST_CHECK_MESSAGE：与BOOST_CHECK类似，可以在第二个参数中加入错误描述信息；
	BOOST_CHECK_EQUAL：与BOOST_CHECKL类似，用来检查两个参数是否相等。
*/



BOOST_AUTO_TEST_SUITE_END( )  // end


运行结果如下：

Running 2 test cases...
d:/documents/visual studio 2010/projects/boost_test/boost_test/main.cpp(23): err
or in "test1": check Add(1, 2) == 2 failed
d:/documents/visual studio 2010/projects/boost_test/boost_test/main.cpp(30): err
or in "test2": check Add(1, 1) == 3 failed

*** 2 failures detected in test suite "WRMath"
请按任意键继续. . .