<%@ page language="java" import="filter.Filte" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" session="true"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Insert title here</title>
</head>
<body>
<%@include file="header.jsp"%>
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="300" align="right" valign="middle" class="dl"><form id="form1" name="form1" method="post" action="Log">
      <p>
        <label for="textfield2"></label>
      </p>
      <table width="1000" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td width="600" height="200" align="center" valign="middle"><table width="300" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td height="40" colspan="2" align="center" valign="middle" bgcolor="#FFFFFF">登陆</td>
            </tr>
            <tr>
              <td width="100" height="40" align="center" valign="middle" bgcolor="#FFFFFF">用户名</td>
              <td height="40" align="center" valign="middle" bgcolor="#FFFFFF"><label for="textfield2"></label>
                <input name="txt" type="text" class="dlwb" id="textfield2" /></td>
            </tr>
            	<tr>
              	 <td width="100" height="40" align="center" valign="middle" bgcolor="#FFFFFF">密码</td>
              	 <td height="40" align="center" valign="middle" bgcolor="#FFFFFF">
              	 <label for="textfield3"></label>
                 <input name="passwd" type="password" class="dlwb" id="textfield3" /></td>
            	</tr>
            	<tr>
              	 <td height="40" colspan="2" align="center" valign="middle" bgcolor="#FFFFFF">
              		<input name="button2" type="submit" class="dlan" id="button2" value="提交" />
                	<input name="button3" type="reset" class="dlan" id="button3" value="重置" />
                 </td>
            	</tr>
          </table></td>
          <td width="500" height="200">&nbsp;</td>
        </tr>
    </table>
<p class="dl">&nbsp;</p>
    </form></td>
  </tr>
</table>
<%@include file="footer.jsp"%>
</body>
</html>