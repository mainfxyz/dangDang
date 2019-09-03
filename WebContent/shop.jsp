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
.gm {
	width: 100px;
    height: 40px;
    line-height: 38px;
    background: #ff2832;
    border-radius: 3px;
    display: inline-block;
    color: #fff;
    text-align: center;
    font-size: 15px;
    margin-bottom: 10px;
}
</style>
</head>
<body>
<%@include file="header.jsp"%>
<table align="center" width="1000">
<tr><td id="contents">

<sql:setDataSource var="db" driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost:3306/book?useUnicode=true&characterEncoding=utf-8" user="root"  password="123"/>

<sql:query dataSource="${db}" var="rs">
	select * from comments where bookName="${param.book}";
</sql:query>
<table width="1000" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="1000" height="20">&nbsp;</td>
  </tr>
</table>
<table width="1000" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="350" height="400" align="center" valign="middle" bgcolor="#FFFFFF"><img src="img/${param.book}.jpg"" width="350" height="400" /></td>
    <td rowspan="2" valign="top" bgcolor="#FFFFFF"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td height="50"><p class="xiangqing">${param.book}</p></td>
      </tr>
      <tr>
        <td width="650" height="150"><img src="img/jiage.jpg" width="650" height="150" /></td>
      </tr>
      <tr>
        <td height="100" align="center" valign="middle" bgcolor="#F3F3F3"><p>Web安全书，多语全球发行安全著作，原创技术书大奖得主，道哥力作！本书内容详实，深入浅出，理论结合实际，为读者讲述了新层面上的相关技术知识。<br />
            　　大量举例，增加实用性，在动手中思考、理解。<br />
          　　众多读者倾情推荐！</p></td>
      </tr>
      <tr>
        <td height="50" align="center" valign="middle"><form id="form1" name="form1" method="post" action="">
          <a class="gm" href="Iorder?book=${param.book}">立即购买</a>
        </form></td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td height="40" align="center" valign="middle" bgcolor="#FFFFFF"><a href="#">关注 </a>  <a href="#">分享</a></td>
  </tr>
</table>
<table width="1000" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="1000" height="20">&nbsp;</td>
  </tr>
</table>
<table width="1000" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="100" height="50" bgcolor="#FFFFFF" class="xiangqing">商品评价</td>
  </tr>
  <tr>
    <td height="100" bgcolor="#FFFFFF">
    <table width="1000" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="100" height="100"><img src="img/haoping.jpg" width="100" height="100" /></td>
        <td width="900" height="100">　互联网时代的数据安全与个人隐私受到挑战，各种新奇的攻击技术层出不穷。如何才能更好地保护我们的数据？《白帽子讲Web安全（纪念版）》将带你走进Web安全的世界，让你了解Web安全的方方面面。黑客不再神秘，攻击技术原来如此，小网站也能找到适合自己的安全道路。</td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td width="100" height="50" bgcolor="#FFFFFF">
    <table width="1000" border="0" cellpadding="0" cellspacing="0" class="pj">
<c:forEach var="row" items="${rs.rows}">
      <tr>
        <td width="150" height="50" align="center" valign="middle">用户：${row.userName}</td>
        <td height="50" align="left" valign="middle">评论：${row.comment}</td>
      </tr>
</c:forEach>
</table></td>
</tr>
</table>
<%@include file="footer.jsp"%>
</body>
</html>