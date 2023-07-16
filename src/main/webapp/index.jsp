<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<script type="text/javascript" src="scripts/jquery-1.9.1.min.js"></script>
<html>
<script type="text/javascript">
    $(function () {
        $("#testJson").click(function () {
            var url = this.href;
            var args = {};
            $.post(url, args, function (data) {
                for (var i = 0; i < data.length; i++) {
                    var id = data[i].id;
                    var lastName = data[i].lastName;

                    alert(id + ": " + lastName);
                }
            });
            return false;
        });
    })
</script>
<body>
<form action="springmvc/testMethod" method="post">
    <input type="submit">
</form>
<a href="helloworld">hello world</a>
<br>
<a href="springmvc/testRequestMapping">testRequestMapping</a>
<br>
<a href="springmvc/testMethod">testMethod</a>
<br>
<a href="springmvc/testParamsAndHeaders?username=admin&age=11">testParamsAndHeaders</a>
<br>
<a href="springmvc/testAntPath/tk/abc">testAntPath</a>
<br>
<a href="springmvc/testPathVariable/1">testPathVariable</a>
<br>

<form action="springmvc/testRest/1" method="post">
    <input type="hidden" name="_method" value="PUT"/>
    <input type="submit" value="TestRest PUT"/>
</form>
<form action="springmvc/testRest/1" method="post">
    <input type="hidden" name="_method" value="DELETE"/>
    <input type="submit" value="TestRest DELETE"/>
</form>
<form action="springmvc/testRest" method="post">
    <input type="submit" value="TestRest POST"/>
</form>
<a href="springmvc/testRest/1">Test Rest Get</a>
<br>
<a href="springmvc/testRequestParam?username=atguigu&age=11">Test RequestParam</a>
<br>
<a href="springmvc/testRequestHeader">Test RequestHeader</a>
<br>
<a href="springmvc/testCookieValue">Test CookieValue</a>
<br>
<form action="springmvc/testPojo" method="post">
    username: <input type="text" name="username"/>
    <br>
    password: <input type="password" name="password"/>
    <br>
    email: <input type="text" name="email"/>
    <br>
    age: <input type="text" name="age"/>
    <br>
    city: <input type="text" name="address.city"/>
    <br>
    province: <input type="text" name="address.province"/>
    <br>
    <input type="submit" value="Submit"/>
</form>
<a href="springmvc/testServletAPI">Test ServletAPI</a>
<br>
<a href="springmvc/testModelAndView">Test ModelAndView</a>
<br>
<a href="springmvc/testMap">Test Map</a>
<br>
<a href="springmvc/testSessionAttributes">Test SessionAttributes</a>
<br>
<form action="springmvc/testModelAttribute" method="Post">
    <input type="hidden" name="id" value="1"/>
    username: <input type="text" name="username" value="Tom"/>
    <br>
    email: <input type="text" name="email" value="tom@guigu.com"/>
    <br>
    age: <input type="text" name="age" value="12"/>
    <br>
    <input type="submit" value="Submit"/>
</form>
<a href="springmvc/testRedirect">Test Redirect</a>
<br>
<a href="springmvc/testView">Test View</a>
<br>
<a href="springmvc/testViewAndViewResolver">Test ViewAndViewResolver</a>
<br>
<%--<form action="testFileUpload" method="POST" enctype="multipart/form-data">
    File: <input type="file" name="file"/>
    Desc: <input type="text" name="desc"/>
    <input type="submit" value="Submit"/>
</form>
<a href="emps">List All Employees</a>
<br>
<a href="testJson" id="testJson">Test Json</a>
<br>
<form action="testHttpMessageConverter" method="POST" enctype="multipart/form-data">
    File: <input type="file" name="file"/>
    Desc: <input type="text" name="desc"/>
    <input type="submit" value="Submit"/>
</form>
<a href="testExceptionHandlerExceptionResolver?i=10">Test ExceptionHandlerExceptionResolver</a>
<br>
<a href="testResponseStatusExceptionResolver?i=10">Test ResponseStatusExceptionResolver</a>
<br>
<a href="testDefaultHandlerExceptionResolver">Test DefaultHandlerExceptionResolver</a>
<br>
<a href="testSimpleMappingExceptionResolver?i=2">Test SimpleMappingExceptionResolver</a>
<br>--%>
</body>
</html>
