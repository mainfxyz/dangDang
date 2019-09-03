<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>评论</title>
</head>
<body>
评论：${param.book}
<form method="post" action="Icomm">
<input name="book" type="hidden" value="${param.book}"/>
<input name="comm" type="text">
<input type="submit">
</form>
</body>
</html>