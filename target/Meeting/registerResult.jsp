<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: aitaiyo
  Date: 2021/6/25
  Time: 19:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>注册结果</title>
</head>
<body>
<c:if test="${message == 'success'}">
    <h2>提交成功，请等待审核！2s后跳转至登录页...</h2>
    <%
    response.setHeader("refresh", "2;URL=../user/login");
    %>
</c:if>
<c:if test="${message == 'failed'}">
    <h2>提交失败！2s后跳转回注册页...</h2>
    <%
    response.setHeader("refresh", "2;URL=../user/register");
    %>
</c:if>
</body>
</html>
