<%--
  Created by IntelliJ IDEA.
  User: aitaiyo
  Date: 2021/6/25
  Time: 14:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>错误页面</title>
</head>
<body>
<h2>${sessionScope.message}</h2>
<a href="${pageContext.request.contextPath}/user/login">点此</a>回到登录界面
</body>
</html>
