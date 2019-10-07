@isTest
public with sharing class TestClassTest {
    @isTest
    static void testHelloWorld() {
        TestClass newclass = new TestClass();
        String result = newclass.Hello();
        System.assertEquals('Hello World !', result);
    }
}
