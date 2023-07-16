<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/8/5
  Time: 16:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>success page</title>
</head>
<body>
这是一个成功的界面
<br>
time:${requestScope.time}
<br>
names:${requestScope.names}
<br>
request_name:${requestScope.user}
<br>
session_name:${sessionScope.user}
<br>
request_school:${requestScope.school}
<br>
session_school:${sessionScope.school}
<br>
abc_user:${requestScope.abc}
<br>
user_user:${requestScope.user}
<br>
<fmt:message key="i18n.username"></fmt:message>
<br>
<fmt:message key="i18n.password"></fmt:message>
<br>
</body>
</html>
