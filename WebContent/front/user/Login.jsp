<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
    <%@ taglib prefix="s" uri="/struts-tags" %>   
        <%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="<%=basePath%>/jquery/jquery-1.5.1.js"></script>
<script type="text/javascript" src="<%=basePath%>/front/js/user/regist.js"></script>
<title>Insert title here</title>
</head>
<body>
<form action="login" method="post">
	用户名：<input type="text" name="username"><br>
	登录密码：<input type="password" name="password"><br>
	验证码：<input type="text" name="verifyCode"><br>
    <img id="imgVerifyCode" src="<s:url value='rand?a=<%=new Date().getTime() %>'/>"/>&nbsp;&nbsp;
    <label><a href="javascript:_hyz()">换一张</a></label><br>
	<input type="submit" name="登录">
</form>

</body>
</html>