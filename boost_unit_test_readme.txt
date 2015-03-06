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
  *���ȣ���Ҫ����#define BOOST_TEST_MODULE example 
  *����#define BOOST_AUTO_TEST_MAIN��
  *�������ģ���ʼ��������Ҫ�ֶ�ʵ��
*/
#include <boost/test/included/unit_test.hpp>
#include "WRMath.hpp"

BOOST_AUTO_TEST_SUITE (WRMathTest) // name of the test suite is WRMathTest

/* 
	*Ȼ��ꡰBOOST_AUTO_TEST_SUITE(WRMathTest)��������һ��
	*��ΪWRMathTest�Ĳ����׼�����������뵽����ģ����
*/


//�������������԰���

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
   *���ֲ�ͬ�ķ�ʽ���Ժ������в��ԣ�
	BOOST_CHECK�����ַ�������鵽�Ĵ��󱣴����������Խ���ʱ�ɲ��Կ���Զ���ʾ��
	BOOST_REQUIRE��ͬ���Ǽ�������BOOST_CHECK��֮ͬ�����������������ʱ���׳�һ���쳣����˺����Ĳ��Խ�����������У�
	BOOST_ERROR�����������Դ�����ж������������Խ���ʱ�ɲ��Կ���Զ���ʾ��
	BOOST_FAIL��ͬ�����������Դ�����ж�������������ʱ���׳�һ���쳣��
	�׳��쳣��ʽ�����Կ�ܽ�������쳣����ӡ��������Ϣ��
	BOOST_CHECK_MESSAGE����BOOST_CHECK���ƣ������ڵڶ��������м������������Ϣ��
	BOOST_CHECK_EQUAL����BOOST_CHECKL���ƣ�����������������Ƿ���ȡ�
*/



BOOST_AUTO_TEST_SUITE_END( )  // end


���н�����£�

Running 2 test cases...
d:/documents/visual studio 2010/projects/boost_test/boost_test/main.cpp(23): err
or in "test1": check Add(1, 2) == 2 failed
d:/documents/visual studio 2010/projects/boost_test/boost_test/main.cpp(30): err
or in "test2": check Add(1, 1) == 3 failed

*** 2 failures detected in test suite "WRMath"
�밴���������. . .