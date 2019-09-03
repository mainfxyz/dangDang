<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>买买买！</title>
<style type="text/css">
.fk {
    width: 70px;
    height: 30px;
    line-height: 30px;
    background: #ff2832;
    display: inline-block;
    color: #fff;
    text-align: center;
    font-size: 15px;
}
</style>
</head>
<body>
<sql:setDataSource var="db" driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost:3306/book?useUnicode=true&characterEncoding=utf-8" user="root"  password="123"/>

<sql:query dataSource="${db}" var="rs">
	select `order`.*,jj from `order` JOIN book where userName="${user}" and `name`=bookName;
</sql:query>
<%@include file="header.jsp"%>
<table align="center" width="1000">
<tr><td id="contents">

<table width="1000" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="1000" height="20">&nbsp;</td>
  </tr>
</table>
<table width="1000" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="1000" height="50" bgcolor="#FFFFFF" class="xiangqing">我的订单</td>
  </tr>
</table>
<table width="1000" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="1000" height="20">&nbsp;</td>
  </tr>
</table>
<table width="1000" border="0" align="center" cellpadding="0" cellspacing="0">

<c:forEach var="row" items="${rs.rows}">
<tr>
    <td width="1000" height="150"><table width="1000" border="0" cellpadding="0" cellspacing="0" class="pj">
      <tr>
        <td width="150" height="150" align="center" valign="middle" bgcolor="#FFFFFF"><img src="img/${row.bookName }.jpg" width="150" height="150" /></td>
        <td width="600" height="150" valign="top" bgcolor="#FFFFFF"><table width="100%" border="0" cellpadding="0" cellspacing="0">
          <tr>
          订单号：${row.no}&emsp;书名：${row.bookName}&emsp;数量：${row.num}&emsp;
            <td height="30" align="right" class="jycg">物流：${row.state}</td>
          </tr>
          <tr>
            <td height="120" valign="top"><table width="100%" border="0" cellpadding="0" cellspacing="0">
              <tr>
                <td height="90" valign="top"><p>&nbsp;</p></td>
                </tr>
              <tr>
                <td class="fk" height="30" align="right">查看物流 </td>
                <td height="30" width="3" align="right"></td>
                <td class="fk" height="30" align="right">卖了换钱</td>
              </tr>
            </table></td>
          </tr>
        </table></td>
        <td height="150" align="center" valign="middle" bgcolor="#FFFFFF"><a href="comment.jsp?book=${row.bookName}" class="fk">去评价</a></td>
      </tr>
    </table></td>
  </tr>
</c:forEach>

</table>
</td></tr>
</table>
<%@include file="footer.jsp"%>
</body>
</html>