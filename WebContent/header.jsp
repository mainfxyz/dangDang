<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="css/sousuo.css" rel="stylesheet" type="text/css" />
<style type="text/css">
body {
	background-color: #F0F3EF;
}
#a1 {
	position:absolute;
	width:600px;
	height:400px;
	z-index:2;
	background-color: #0000FF;
}
#a2 {
	position:absolute;
	width:600px;
	height:400px;
	z-index:3;
	background-color: #00FF99;
}
#a3 {
	position:absolute;
	width:600px;
	height:400px;
	z-index:4;
	background-color: #CC66CC;
}
#a4 {
	position:absolute;
	width:600px;
	height:400px;
	z-index:5;
	background-color: #FFCCFF;
}
#b1 {
	position:absolute;
	width:30px;
	height:30px;
	z-index:6;
	left: 743px;
	top: 600px;
}
#b2 {
	position:absolute;
	width:30px;
	height:30px;
	z-index:6;
	left: 789px;
	top: 601px;
}
#b3 {
	position:absolute;
	width:30px;
	height:30px;
	z-index:6;
	left: 838px;
	top: 600px;
}
#b4 {
	position:absolute;
	width:30px;
	height:30px;
	z-index:6;
	left: 884px;
	top: 600px;
}
a:link {
	text-decoration: none;
}
a:visited {
	text-decoration: none;
}
a:hover {
	text-decoration: none;
}
a:active {
	text-decoration: none;
}
a.searchB {
	width: 100px;
    height: 40px;
    line-height: 38px;
    background: #ff2832;
    border-radius: 7px;
    display: inline-block;
    color: #fff;
    text-align: center;
    font-size: 15px;
    margin-bottom: 10px;
    position: relative;
    bottom: 6px;
}
</style>

<script src="https://cdn.bootcss.com/jquery/1.10.2/jquery.min.js"></script>
<script type="text/javascript">
function MM_showHideLayers() { //v9.0
  var i,p,v,obj,args=MM_showHideLayers.arguments;
  for (i=0; i<(args.length-2); i+=3) 
  with (document) if (getElementById && ((obj=getElementById(args[i]))!=null)) { v=args[i+2];
    if (obj.style) { obj=obj.style; v=(v=='show')?'visible':(v=='hide')?'hidden':v; }
    obj.visibility=v; }
}

add=function(url){
    $.get(url,function(data,status){
    	$("#contents").html(data);
    });
}
</script>

<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="toubu">
  <tr>
    <td height="30" align="center" bgcolor="#CCCCCC"><table width="1000" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="100" height="30" align="center" valign="middle"><img src="img/定位图标.png" width="30" height="30" />山东</td>
        <td height="30" align="center" valign="middle">&nbsp;</td>
        <td width="50" height="30" align="center" valign="middle" class="gwc"><a href="index.jsp">首页</a></td>
        <td width="50" align="center" valign="middle" class="gwc"><a href="gwc.jsp">购物车</a></td>
        <td width="100" height="30" align="center" valign="middle" class="gwc"><a href="orderList.jsp">我的订单</a></td>
        <td width="100" height="30" align="center" valign="middle" class="gwc"><a href="#">我的芒果</a></td>
      </tr>
    </table></td>
  </tr>
</table>
<table width="1000" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="150" height="150" align="center" valign="middle"><img src="img/logo.jpg" width="150" height="150" /></td>
    <td height="150" align="center" valign="middle">
    <form action="list.jsp" method="post" id="searchForm">
      <label for="textfield"></label>
      <input name="search" type="text" class="sousuo" id="textfield" />
      <a class="searchB" href="javascript:$.post('list.jsp',$('#searchForm').serialize(),function(data,status){$('#contents').html(data);});">查询</a>
    </form>
    </td>
    <td width="200" height="150" align="center" valign="middle">欢迎光临芒果体育  <a href="login.jsp" class="denglu" style="color:#000">
    <%
	String user="";
	try{
		user=(String)session.getAttribute("user");
	}catch(Exception e){
	}
	
	if(user==null||"".equals(user))
	{
		out.println("请登录");
	}
	else
	{
		out.println("用户："+user);
	}
	%>
</a></td>
  </tr>
</table>
<table width="1000" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="150" height="40" align="center" valign="middle" class="wenxue"><a href="javascript:add('list.jsp?type=文学');" class="wenxue">文学</a></td>
    <td width="106" height="40" align="center" valign="middle" class="daohang"><a href="javascript:add('list.jsp?type=跳绳');">跳绳</a></td>
    <td width="106" height="40" align="center" valign="middle" class="daohang"><a href="javascript:add('list.jsp?type=滚轮');">滚轮</a></td>
    <td width="106" height="40" align="center" valign="middle" class="daohang"><a href="javascript:add('list.jsp?type=呼啦圈');">呼啦圈</a></td>
  </tr>
</table>

<table width="100%" height="5" border="0" cellpadding="0" cellspacing="0" class="zhongxian">
  <tr>
    <td bgcolor="#FF3300"></td>
  </tr>
</table>